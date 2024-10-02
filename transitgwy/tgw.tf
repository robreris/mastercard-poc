resource "aws_ec2_transit_gateway" "mstrcrd" {
  description                     = "Transit Gateway for routing between customer and security VPCs."
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  tags = {
    Name     = "mytgw"
  }
}

resource "aws_ec2_transit_gateway_route_table" "tgwrt_cust1" {
  depends_on         = [aws_ec2_transit_gateway.mstrcrd]
  transit_gateway_id = aws_ec2_transit_gateway.mstrcrd.id
  tags = {
    Name     = "tgw-rt-cust1"
  }
}

resource "aws_ec2_transit_gateway_route_table" "tgwrt_cust2" {
  depends_on         = [aws_ec2_transit_gateway.mstrcrd]
  transit_gateway_id = aws_ec2_transit_gateway.mstrcrd.id
  tags = {
    Name     = "tgw-rt-cust2"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "cust1_att" {
  subnet_ids                                      = [var.cust1_sn_id]
  transit_gateway_id                              = aws_ec2_transit_gateway.mstrcrd.id
  vpc_id                                          = var.cust1_vpc_id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name     = "tgw-cust1-att"
  }
  depends_on = [aws_ec2_transit_gateway.mstrcrd]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "cust2_att" {
  subnet_ids                                      = [var.cust2_sn_id]
  transit_gateway_id                              = aws_ec2_transit_gateway.mstrcrd.id
  vpc_id                                          = var.cust2_vpc_id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name     = "tgw-cust2-att"
  }
  depends_on = [aws_ec2_transit_gateway.mstrcrd]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "sec_att_az1" {
  subnet_ids                                      = [var.secvpcaz1_sn_id]
  transit_gateway_id                              = aws_ec2_transit_gateway.mstrcrd.id
  vpc_id                                          = var.sec_vpc_id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name     = "tgw-secvpcaz1-att"
  }
  depends_on = [aws_ec2_transit_gateway.mstrcrd]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "sec_att_az2" {
  subnet_ids                                      = [var.secvpcaz2_sn_id]
  transit_gateway_id                              = aws_ec2_transit_gateway.mstrcrd.id
  vpc_id                                          = var.sec_vpc_id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name     = "tgw-secvpcaz2-att"
  }
  depends_on = [aws_ec2_transit_gateway.mstrcrd]
}

resource "aws_ec2_transit_gateway_route" "cust1_to_cust2" {
  destination_cidr_block         = var.cust2_vpc_cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.cust2_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwrt_cust1.id
}

resource "aws_ec2_transit_gateway_route" "cust2_to_cust1" {
  destination_cidr_block         = var.cust1_vpc_cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.cust1_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwrt_cust2.id
}

resource "aws_ec2_transit_gateway_route" "cust1_to_secvpc" {}

resource "aws_ec2_transit_gateway_route" "cust2_to_secvpc" {}

resource "aws_ec2_transit_gateway_route" "secvpc_to_cust1" {}

resource "aws_ec2_transit_gateway_route" "secvpc_to_cust2" {}

resource "aws_ec2_transit_gateway_route_table_association" "cust1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.cust1_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwrt_cust1.id
}

resource "aws_ec2_transit_gateway_route_table_association" "cust2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.cust2_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgwrt_cust2.id
}
