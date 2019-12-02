view: customer_base {
  sql_table_name: PCI_demo.customer_base ;;

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: cust_id {
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
