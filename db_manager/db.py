import psycopg2
import psycopg2.extras

ADD_ORDER = """INSERT INTO orders(
  client_id, product_id, amount, total_price, 
  type_pay, branch_id, status_id
)VALUES( 
  %(client)s, 
  %(product)s, 
  %(count)s, 
  %(total_price)s, 
  %(type_pay)s, 
  %(branch_id)s, 
  %(status_id)s
);
"""


class Database:
     
    def __exec(self, script: str, data: dict):
        self.cursor.execute(script, data)
        self.connection.commit()

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

    def add_order(self, **kwargs):
        self.__exec(ADD_ORDER, **kwargs)

