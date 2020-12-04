module "juice" {
  source            = "./juice"
  aws_keypair       = var.aws_keypair
  ntw-mgmt          = var.ntw-mgmt
  ntw-public-a      = var.ntw-public-a
  ntw-private-a     = var.ntw-private-a
  juiceshopsecgroup = var.juiceshopsecgroup
}
module "bigip" {
  source = "./bigip"
  vpc_id = var.vpc_id
  aws_keypair       = var.aws_keypair
  ntw-mgmt          = var.ntw-mgmt
  ntw-public-a      = var.ntw-public-a
  ntw-private-a     = var.ntw-private-a
  
}