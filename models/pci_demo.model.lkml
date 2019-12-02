connection: "lookerdata"
include: "/views/*"

datagroup: pci_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: pci_demo_default_datagroup

explore: credit_card_base {}

explore: customer_base {}

explore: fraud_base {}

explore: transaction_base {}
