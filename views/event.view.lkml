# The name of this view in Looker is "Event"
view: event {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.event ;;
  drill_fields: [eventid]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: eventid {
    primary_key: yes
    type: number
    sql: ${TABLE}.eventid ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Catid" in Explore.

  dimension: catid {
    type: number
    value_format_name: id
    sql: ${TABLE}.catid ;;

  }

  dimension: dateid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.dateid ;;
  }

  dimension: eventname {
    type: string
    sql: ${TABLE}.eventname ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: starttime {
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
    sql: ${TABLE}.starttime ;;
  }

  dimension: venueid {
    type: number
    value_format_name: id
    sql: ${TABLE}.venueid ;;
  }

  measure: count {
    type: count
    drill_fields: [eventid, eventname, date.dateid]
  }
}
