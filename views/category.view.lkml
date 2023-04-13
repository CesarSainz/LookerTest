# The name of this view in Looker is "Category"
view: category {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.category ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Catdesc" in Explore.

  dimension: catdesc {
    type: string
    sql: ${TABLE}.catdesc ;;
  }

  dimension: lkfjdslfsd {
    type: string
    sql: CONCAT ${catdesc} AND ${catgroup} ;;
  }

  dimension: catgroup {
    type: string
    sql: ${TABLE}.catgroup ;;
  }

  dimension: catid {
    type: number
    value_format_name: id
    sql: ${TABLE}.catid ;;
  }

  dimension: catname {
    type: string
    sql: ${TABLE}.catname ;;
  }

  measure: count {
    type: count
    drill_fields: [catname]
  }
}
