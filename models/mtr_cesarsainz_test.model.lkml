# Define the database connection to be used for this model.
connection: "athena"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: mtr_cesarsainz_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
#datagroup: custom_datagroup {
 # max_cache_age: "24 hours"
  #sql_trigger:  ;;
#}

week_start_day: saturday

persist_with: mtr_cesarsainz_test_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Mtr Cesarsainz Test"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: all_types {}

explore: connection_reg_r3 {}

explore: order_items {

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: userss {
    type: left_outer
    sql_on: ${orders.user_id} = ${userss.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  always_filter: {
    filters: [userss.created_quarter: ""]
  }
  join: userss {
    type: left_outer
    sql_on: ${orders.user_id} = ${userss.id} ;;
    relationship: many_to_one

  }
}



explore: userss {}
