view: content_view {
  sql_table_name: looker_test.users ;;
  suggestions: no

  measure: test_content  {
    type: count
    sql: ${TABLE}.age ;;
    }

 }
