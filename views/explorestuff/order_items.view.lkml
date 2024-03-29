# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_test.order_items ;;
  drill_fields: [id]
  suggestions: no

  parameter: results{
    allowed_value: {
      label: "Less than 500"
      value: "1"
    }
  }
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.{% parameter results %} ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: lkfjdslfsd {
    type: string
    sql: concat(CAST(${TABLE}.amount AS varchar),CAST(${TABLE}.id AS varchar));;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    sql: ${amount} ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: sku_num {
    type: number
    sql: ${TABLE}.sku_num ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id]
  }
}
