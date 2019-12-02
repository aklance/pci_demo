view: fraud_base {
  sql_table_name: PCI_demo.fraud_base ;;

  dimension: fraud_flag {
    type: number
    sql: ${TABLE}.Fraud_Flag ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.Transaction_ID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
