output "Cust1-FGTPublicIP" {
  value = module.customer_one.FGTPublicIP
}

output "Cust2-FGTPublicIP" {
  value = module.customer_two.FGTPublicIP
}

output "Cust1-Username" {
  value = module.customer_one.Username
}

output "Cust2-Username" {
  value = module.customer_two.Username
}

output "Cust1-Password" {
  value = module.customer_one.Password
}

output "Cust2-Password" {
  value = module.customer_two.Password
}
