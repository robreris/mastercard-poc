
output "FGTActiveMGMTPublicIP" {
  value = aws_eip.MGMTPublicIP.public_ip
}

output "FGTClusterPublicFQDN" {
  value = join("", tolist(["https://", "${aws_eip.ClusterPublicIP.public_dns}", ":", "${var.adminsport}"]))
}

output "FGTClusterPublicIP" {
  value = aws_eip.ClusterPublicIP.public_ip
}


output "FGTPassiveMGMTPublicIP" {
  value = aws_eip.PassiveMGMTPublicIP.public_ip
}

output "Username" {
  value = "admin"
}

output "Password" {
  value = aws_instance.fgtactive.id
}

output "secvpcid" {
  value = aws_vpc.fgtvm-vpc.id
}

output "secvpccidr" {
  value = var.vpccidr
}

output "pubsubnetaz1" {
  value = aws_subnet.publicsubnetaz1.id
}

output "pubsubnetaz2" {
  value = aws_subnet.publicsubnetaz2.id
}

output "tgwsnaz1" {
  value = aws_subnet.tgwysubnetaz1.id
}

output "tgwsnaz2" {
  value = aws_subnet.tgwysubnetaz2.id
}

output "obsubnetaz1" {
  value = aws_subnet.obsubnetaz1.id
}

output "obsubnetaz2" {
  value = aws_subnet.obsubnetaz2.id
}

output "fgtpubrt" {
  value = aws_route_table.fgtvmpublicrt
}

output "obrt" {
  value = aws_route_table.obrt.id
}
