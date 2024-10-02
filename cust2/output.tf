
output "FGTPublicIP" {
  value = aws_eip.FGTPublicIP.public_ip
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = aws_instance.fgtvm.id
}

output "vpc_id" {
  value = aws_vpc.fgtvm-vpc.id
}

output "vpc_cidr" {
  value = var.vpccidr
}

output "PulicSubnetID" {
  value = aws_subnet.publicsubnetaz1.id
}

output "TGWSubnetID" {
  value = aws_subnet.tgwsubnetaz1.id 
}

output "cust2_pubrt" {
  value = aws_route_table.fgtvmpublicrt.id
}
