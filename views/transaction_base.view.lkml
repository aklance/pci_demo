#############################################################################################################
# Owner: Anakarina Lance
# Purpose: Exposing dummy transaction data to show how the PCI offering functions.
# Created: December 2, 2019
# Last Updated: N/A
#############################################################################################################

view: transaction_base {
  sql_table_name: PCI_demo.transaction_base ;;

  dimension: credit_card_number {
#     hidden:  yes
    type: string
    sql: ${TABLE}.Credit_Card_ID ;;
  }

  dimension: masked_credit_card_number {
    type: string
    sql:
    CONCAT(
        RPAD('*', LENGTH(REPLACE(${TABLE}.credit_card_ID, "-", "")) - 4, '*'),
        SUBSTR(REPLACE(${TABLE}.credit_card_ID, "-", ""), -4, 4)) ;;
  }

  dimension_group: transaction {
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
    sql: ${TABLE}.Transaction_Date ;;
  }

  dimension: transaction_id {
    primary_key:  yes
    type: string
    sql: ${TABLE}.Transaction_ID ;;
  }

  dimension: transaction_segment {
    type: string
    sql: ${TABLE}.Transaction_Segment ;;
  }

  dimension: transaction_value {
    type: number
    sql: ${TABLE}.Transaction_Value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
