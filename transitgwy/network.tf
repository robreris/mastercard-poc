resource "aws_route" "cust1_tgwroute" {
  route_table_id         = var.cust1_pubrt
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_ec2_transit_gateway.mstrcrd.id
  depends_on 		 = [aws_ec2_transit_gateway.mstrcrd] 
}

resource "aws_route" "cust2_tgwroute" {
  route_table_id         = var.cust2_pubrt
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_ec2_transit_gateway.mstrcrd.id
  depends_on 		 = [aws_ec2_transit_gateway.mstrcrd] 
}
