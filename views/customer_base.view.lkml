#############################################################################################################
# Owner: Anakarina Lance
# Purpose: Exposing dummy customer data to show how the PCI offering functions.
# Created: December 2, 2019
# Last Updated: N/A
#############################################################################################################

view: customer_base {
  sql_table_name: PCI_demo.customer_base ;;

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.Cust_ID ;;
  }

  dimension: customer_segment {
    type: string
    sql: ${TABLE}.Customer_Segment ;;
  }

  dimension: customer_vintage_group {
    type: string
    sql: ${TABLE}.Customer_Vintage_Group ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
