view: transaction_base {
  sql_table_name: PCI_demo.transaction_base ;;

  dimension: credit_card_id {
    type: string
    sql: ${TABLE}.Credit_Card_ID ;;
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
