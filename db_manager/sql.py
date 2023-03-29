

class Scripts:
    ADD_ORDER = """INSERT INTO orders(
      client_id, total_price, 
      type_pay, branch_id, status_id
    )VALUES( 
      %(client)s,
      %(total_price)s, 
      %(type_pay)s, 
      %(branch_id)s, 
      %(status_id)s
    );
    """

    FETCH_STOCK = """
    SELECT 
      stock.count 
    from 
      stock 
      join branches on stock.branch_id = branches.id 
      join product on stock.product_id = product.id 
    where 
      branch_id = %(branch_id)s 
      and 
      product_id = %(product_id)s;
    """

    FETCH_PRODUCT_PRICE = """
    SELECT
     price
    from
     product
    where
     product.id = %(product_id)s;
    """

    UPDATE_CLIENTS_TURNOVER = """
    UPDATE
     clients
    SET
     turnover = turnover + %(turnover)s
    where 
     id = %(client_id)s;
    """

    DECREASE_PRODUCT_COUNT = """
    UPDATE
     stock
    SET
     count = count - %(count)s
    where
     id = %(product_id)s;
    """

    UPDATE_BRANCH_TURNOVER = """
    UPDATE
     branches
    SET
     order_average_cost = (SELECT sum(total_price) FROM orders WHERE branch_id = %(branch_id)s) /
                          (SELECT count(id) FROM orders WHERE branch_id = %(branch_id)s)
    WHERE
     id = %(branch_id)s;                      
    """