# The name of this view in Looker is "Users"
view: userss {




  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_test.users ;;
  drill_fields: [id]
  suggestions: no
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: req_device_os {
    group_label: "Request"
    type: string
    sql: ${TABLE}.userss;;
    suggest_explore: order_items
    suggest_dimension: order_items.id
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.
#
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

#  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  parameter: select_dimension {
    allowed_value: {
      label: "State"
      value: "state"
    }
    allowed_value: {
      label: "Gender"
      value: "gender"
    }
  }

  dimension: state {
    type: string
    sql: CASE WHEN {% parameter select_dimension %} = "state"
    ELSE ${TABLE}.gender END;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: epoch_at {
    type: number
    sql: ${TABLE}.epoch_at ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: yyyymmdd_at {
    type: number
    sql: ${TABLE}.yyyymmdd_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, orders.count]
  }

  measure: test_content  {
    type: sum
    sql: ${age}
    ;;
  }

  measure: age_count {
    type: count_distinct
    sql: ${age} ;;
  }

  measure: age_50 {
    type: number
    value_format: "#$0.00"
    sql: ${age_count}*2   ;;
  }
}
