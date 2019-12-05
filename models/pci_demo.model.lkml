connection: "lookerdata"
include: "/views/*"

datagroup: pci_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: pci_demo_default_datagroup


#############################################################################################################
# Owner: Anakarina Lance
# Purpose: Exposing dummy creadt card data to show how the PCI offering functions.
# Created: December 2, 2019
# Last Updated: N/A
#############################################################################################################

explore: credit_card_base {}

explore: customer_base {}

explore: fraud_base {}

explore: transaction_base {}

explore: test {}

explore: PCI_demo {
  view_name:  credit_card_base
  join: customer_base {
    type:  left_outer
    sql_on: ${credit_card_base.customer_id} = ${customer_base.customer_id} ;;
    relationship: one_to_many
  }

  join: transaction_base {
    type:  left_outer
    sql_on:  ${credit_card_base.masked_credit_card_number} = ${transaction_base.masked_credit_card_number};;
    relationship: many_to_one
  }

  join: fraud_base {
    type: left_outer
    sql_on:  ${fraud_base.transaction_id} = ${transaction_base.transaction_id}  ;;
    relationship: many_to_many
  }

  join: test {
    type:  left_outer
    sql_on: ${transaction_base.order_id} = ${test.order_id} ;;
    relationship: one_to_one
  }

  join: inventory_items {
    type:  left_outer
    sql_on: ${inventory_items.id} = ${test.inventory_item_id};;
    relationship: one_to_many
  }

}
