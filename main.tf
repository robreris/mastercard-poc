module "customer_one" {
  source 		= "./cust1"
  vpc_name 		= "customer-one"

  access_key 		= var.access_key
  secret_key 		= var.secret_key
  
  vpccidr 		= var.vpc1cidr
  publiccidraz1 	= var.publiccidraz1vpc1
  privatecidraz1 	= var.privatecidraz1vpc1
  tgwcidraz1 		= var.tgwcidraz1vpc1
  
  tags = {
    Name = "customer one vpc"
  }
}

module "customer_two" {
  source 		= "./cust2"
  vpc_name 		= "customer-two"

  access_key 		= var.access_key
  secret_key 		= var.secret_key

  vpccidr 		= var.vpc2cidr
  publiccidraz1 	= var.publiccidraz1vpc2
  privatecidraz1 	= var.privatecidraz1vpc2
  tgwcidraz1 		= var.tgwcidraz1vpc2

  tags = {
    Name = "customer two vpc"
  }
}

module "security_vpc" {
  source 		= "./secvpc"

  access_key 		= var.access_key
  secret_key 		= var.secret_key

  vpccidr 		= var.secvpccidr
  publiccidraz1 	= var.publiccidraz1sec
  privatecidraz1 	= var.privatecidraz1sec
  hasyncmgmtcidraz1 	= var.hasyncmgmtcidraz1sec
  tgwycidraz1 		= var.tgwycidraz1sec

  publiccidraz2 	= var.publiccidraz2sec
  privatecidraz2 	= var.privatecidraz2sec
  hasyncmgmtcidraz2 	= var.hasyncmgmtcidraz2sec
  tgwycidraz2 		= var.tgwycidraz2sec
}

module "transitgwy" {
  source = "./transitgwy"

  cust1_sn_id 		= module.customer_one.TGWSubnetID
  cust1_vpc_id 		= module.customer_one.vpc_id
  cust1_vpc_cidr 	= module.customer_one.vpc_cidr
  cust1_pubrt 		= module.customer_one.cust1_pubrt

  cust2_sn_id 		= module.customer_two.TGWSubnetID
  cust2_vpc_id 		= module.customer_two.vpc_id
  cust2_vpc_cidr 	= module.customer_two.vpc_cidr
  cust2_pubrt 		= module.customer_two.cust2_pubrt

  secvpcaz1_sn_id 	= module.security_vpc.tgwsnaz1
  secvpcaz2_sn_id 	= module.security_vpc.tgwsnaz2
  sec_vpc_id 		= module.security_vpc.secvpcid
  sec_vpc_cidr 		= module.security_vpc.secvpccidr  

}

