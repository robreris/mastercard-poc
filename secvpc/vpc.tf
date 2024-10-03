// AWS VPC 
resource "aws_vpc" "fgtvm-vpc" {
  cidr_block           = var.vpccidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "security vpc"
  }
}

resource "aws_subnet" "publicsubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.publiccidraz1
  availability_zone = var.az1
  tags = {
    Name = "secvpc public subnet az1"
  }
}

resource "aws_subnet" "publicsubnetaz2" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.publiccidraz2
  availability_zone = var.az2
  tags = {
    Name = "secvpc public subnet az2"
  }
}


resource "aws_subnet" "privatesubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.privatecidraz1
  availability_zone = var.az1
  tags = {
    Name = "secvpc private subnet az1"
  }
}

resource "aws_subnet" "privatesubnetaz2" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.privatecidraz2
  availability_zone = var.az2
  tags = {
    Name = "secvpc private subnet az2"
  }
}

resource "aws_subnet" "hasyncmgmtsubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.hasyncmgmtcidraz1
  availability_zone = var.az1
  tags = {
    Name = "secvpc hasyncmgmt subnet az1"
  }
}

resource "aws_subnet" "hasyncmgmtsubnetaz2" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.hasyncmgmtcidraz2
  availability_zone = var.az2
  tags = {
    Name = "secvpchasyncmgmt subnet az2"
  }
}

resource "aws_subnet" "tgwysubnetaz1" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.tgwycidraz1
  availability_zone = var.az1
  tags = {
    Name = "tgwy subnet az1"
  }
}

resource "aws_subnet" "tgwysubnetaz2" {
  vpc_id            = aws_vpc.fgtvm-vpc.id
  cidr_block        = var.tgwycidraz2
  availability_zone = var.az2
  tags = {
    Name = "tgwy subnet az2"
  }
}

