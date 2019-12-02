#############################################################################################################
# Owner: Anakarina Lance
# Purpose: Exposing credit card dummy data to show how the PCI offering functions.
# Created: December 2, 2019
# Last Updated: N/A
#############################################################################################################

view: credit_card_base {
  sql_table_name: PCI_demo.card_base ;;

  dimension: credit_card_family {
    type: string
    sql: ${TABLE}.Card_Family ;;
  }

  dimension: credit_card_number {
#     hidden: yes
    type: string
    sql: ${TABLE}.Card_Number ;;
  }


  dimension: masked_credit_card_number {
    type: string
    sql: CONCAT(LEFT(${TABLE}.credit_card_number, 6), RPAD('X', LEN(${TABLE}.credit_card_number) - 8, 'X'), RIGHT(${TABLE}.credit_card_number, 4)) ;;
  }

  dimension: credit_limit {
    type: number
    sql: ${TABLE}.Credit_Limit ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.Cust_ID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
