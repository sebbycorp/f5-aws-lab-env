provider "aws" {
  region = var.aws_region
}
module "juice" {
  source            = "./juice"
  region            = var.region
  aws_keypair       = var.aws_keypair
  ntw-mgmt          = var.ntw-mgmt
  ntw-public-a      = var.ntw-public-a
  ntw-private-a     = var.ntw-private-a
  grafanasecgroup   = var.grafanasecgroup
  juiceshopsecgroup = var.juiceshopsecgroup

}