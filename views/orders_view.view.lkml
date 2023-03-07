# The name of this view in Looker is "Orders View"
view: orders_view {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "LOOKER_TEST"."ORDERS_VIEW"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.
#simon
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Order Amount" in Explore.

  dimension: order_amount {
    type: number
    sql: ${TABLE}."ORDER_AMOUNT" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_order_amount {
    type: sum
    sql: ${order_amount} ;;
  }

  measure: average_order_amount {
    type: average
    sql: ${order_amount} ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
