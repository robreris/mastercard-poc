// AWS VPC 
resource "aws_vpc" "fgtvm-vpc" {
  cidr_block           = var.vpccidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = var.tags
}

resource "aws_subnet" "publicsubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.publiccidraz1
  availability_zone = var.az1
  tags = {
    Name = "${var.vpc_name} public subnet az1"
  }
}

resource "aws_subnet" "privatesubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.privatecidraz1
  availability_zone = var.az1
  tags = {
    Name = "${var.vpc_name} private subnet az1"
  }
}

resource "aws_subnet" "tgwsubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.tgwcidraz1
  availability_zone = var.az1
  tags = {
    Name = "${var.vpc_name} tgw subnet az1"
  }
}

resource "aws_subnet" "obsubnetaz1" { 
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.obcidraz1
  availability_zone = var.az1
  tags = {
    Name = "${var.vpc_name} ob subnet az1"
  }
}
