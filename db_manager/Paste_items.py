import random

from db_manager.db import Database


db = Database(user="SimpleDB",
              password="SimpleDB",
              host="127.0.0.1",
              port="5432",
              database="SimpleDB")
#db.cursor.execute()

brand_cig = ['Lucia', 'Sobranie', 'Camel', 'Senator', 'Русский стиль', 'LD',
             'Космос', 'Невские', 'Беломорканал', 'Прима', 'Parliament', 'Chesterfield',
             'Marlboro', 'Virginia', 'L&M', 'Muratti', 'Bond', 'Next', 'Optima', 'Trend',
             'Dunhill', 'Kent', 'Vogue', 'Pall Mall', 'Capri', 'Viceroy', 'Lucky Strike',
             'Rothmans', 'Alliance', 'Ява', 'Dallas', 'Золотое Руно', 'Captain Black', 'Донской табак']

type_cig = ['slim', 'mint button', 'mentol', 'red button', 'blue button',
            'cherry', 'apple', 'premium', 'hard', 'light', 'double button',
            'fresh button', 'extra slim', 'chocolate']

colors = ['red', 'green', 'yellow', 'purple', 'orange', 'black', 'white', 'blue']

for i in brand_cig:
    for y in type_cig:
        idddd = 9
        name = i + " " + y
        price = random.randint(80, 300) + 0.00
        weight = random.randint(15, 35)
        color = random.choice(colors)
        sql_command = 'INSERT INTO public.product (type, price, color, weight, description, is_certified) VALUES (%s, %s, %s, %s, %s, %s)'
        args = (1, price, color, weight, name, True)

        db.cursor.execute(sql_command, args)
        idddd = idddd + 1
        # db.cursor.execute("INSERT INTO public.product (type, id, price, color, weight, description, is_certified)"
        #                   " VALUES (1, " + str(id) + ", " + str(price) + ", " + color + ", " + str(weight) + ", " + str(name) + ", true);")

# print(len(brand_cig))

db.connection.commit()
