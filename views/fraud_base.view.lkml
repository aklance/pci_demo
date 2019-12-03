#############################################################################################################
# Owner: Anakarina Lance
# Purpose: Exposing dummy fraud date data to show how the PCI offering functions.
# Created: December 2, 2019
# Last Updated: N/A
#############################################################################################################

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
