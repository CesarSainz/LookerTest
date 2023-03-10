view: orders_amount_test {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  derived_table: {
    sql: SELECT order_amount,
          created_at
          FROM  ${EXTENDED}
          WHERE ;;
  }
}
