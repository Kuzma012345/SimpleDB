import psycopg2
import psycopg2.extras

ADD_ORDER = "INSERT INTO orders VALUES "


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

    def add_order(self):
        self.cursor.execute()
