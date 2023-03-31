import logging

import psycopg2
import psycopg2.extras

from db_manager.sql import Scripts


class Database:
    def __init__(self, **kwargs):
        self.connection = psycopg2.connect(
            user=kwargs.get("user"),
            password=kwargs.get("password"),
            host=kwargs.get("host"),
            port=kwargs.get("port"),
            database=kwargs.get("database"),
        )
        self.cursor = self.connection.cursor()
        self.dict_cursor = self.connection.cursor(
            cursor_factory=psycopg2.extras.DictCursor
        )

    def __exec(self, script: str, data: dict):
        print(f"Entry data: {data}, script: {script}")
        self.cursor.execute(script, data)

    def __select(self, script: str, data: dict):
        print(f"Entry data: {data}, script: {script}")
        self.dict_cursor.execute(script, data)

    def get_stock(self, branch_id, product_id):
        self.__select(script=Scripts.FETCH_STOCK, data={
            "branch_id": branch_id,
            "product_id": product_id
        })
        return self.dict_cursor.fetchone()["count"]

    def get_price(self, product_id):
        self.__select(script=Scripts.FETCH_PRODUCT_PRICE, data={
            "product_id": product_id
        })
        return self.dict_cursor.fetchone()["price"]

    def decrease_product_count(self, product_id, count, branch_id):
        self.__exec(script=Scripts.DECREASE_PRODUCT_COUNT, data={
            "product_id": product_id,
            "branch_id": branch_id,
            "count": count
        })

    def update_client_turnover(self, client_id, order_amount):
        self.__select(script=Scripts.UPDATE_CLIENTS_TURNOVER, data={
            "client_id": client_id,
            "turnover": order_amount
        })

    def update_branch_turnover(self, branch_id):
        self.__select(script=Scripts.UPDATE_BRANCH_TURNOVER, data={
            "branch_id": branch_id
        })

    def update_client_status(self, status, client_id):
        self.__select(script=Scripts.UPDATE_CLIENT_STATUS, data={
            "status": status,
            "client_id": client_id
        })

    def add_order(self,
                  count: int,
                  product_id: int,
                  branch_id: int,
                  client_id: int,
                  type_pay: str,
                  status_id: int
                  ) -> None:
        actual_count = self.get_stock(
            branch_id=branch_id,
            product_id=product_id
        )

        if count <= actual_count:
            total_price = count * self.get_price(
                product_id=product_id
            )
            self.__exec(script=Scripts.ADD_ORDER, data={
                "client": client_id,
                "total_price": total_price,
                "type_pay": type_pay,
                "branch_id": branch_id,
                "status_id": status_id,
            })
            self.update_client_turnover(
                client_id=client_id,
                order_amount=total_price
            )

            client_turnover = self.dict_cursor.fetchone()["turnover"]

            # TODO НЕПРАВИЛЬНО УМЕНЬШАЕТ КОЛ-ВО ПРОДУКТОВ : DONE
            self.decrease_product_count(
                product_id=product_id,
                count=count,
                branch_id=branch_id
            )
            self.update_branch_turnover(branch_id=branch_id)
            if client_turnover >= 100000:
                self.update_client_status(client_id=client_id, status="Premium")
            elif client_turnover >= 10000:
                self.update_client_status(client_id=client_id, status="Gold")
            else:
                self.update_client_status(client_id=client_id, status="iron")

            self.connection.commit()
        else:
            raise Exception("Cannot create order which contains more count than branch stock of product")
