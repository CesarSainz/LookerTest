# The name of this view in Looker is "Date"
view: date {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.date ;;
  drill_fields: [dateid]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: dateid {
    primary_key: yes
    type: number
    sql: ${TABLE}.dateid ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: caldate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.caldate ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Day" in Explore.

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: holiday {
    type: yesno
    sql: ${TABLE}.holiday ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: qtr {
    type: string
    sql: ${TABLE}.qtr ;;
  }

  dimension: week {
    type: number
    sql: ${TABLE}.week ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_week {
    type: sum
    sql: ${week} ;;
  }

  measure: average_week {
    type: average
    sql: ${week} ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [dateid]
  }
}
