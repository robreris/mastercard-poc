resource "null_resource" "tgw_wait" {
  depends_on = [aws_ec2_transit_gateway.mstrcrd]

  provisioner "local-exec" {
    command = "sleep 120"
  }
}

resource "aws_route" "cust1_tgwroute" {
  route_table_id         = var.cust1_obrt
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_ec2_transit_gateway.mstrcrd.id
  depends_on 		 = [null_resource.tgw_wait] 
}

resource "aws_route" "cust2_tgwroute" {
  route_table_id         = var.cust2_obrt
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_ec2_transit_gateway.mstrcrd.id
  depends_on 		 = [null_resource.tgw_wait] 
}
