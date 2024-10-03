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

output "Security-VPC-Active-FGT-Public-IP" {
  value = module.security_vpc.FGTActiveMGMTPublicIP
}

output "Security-VPC-FGT-Cluster-Public-FQDN" {
  value = module.security_vpc.FGTClusterPublicFQDN
}

output "Security-VPC-FGT-Cluster-Public-IP" {
  value = module.security_vpc.FGTClusterPublicIP
}

output "Security-VPC-FGT-Passive-MGMT-Public-IP" {
  value = module.security_vpc.FGTPassiveMGMTPublicIP
}

output "Security-FGT-Username" {
  value = module.security_vpc.Username
}

output "Security-FGT-Password" {
  value = module.security_vpc.Password
}
