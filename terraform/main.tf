
terraform {
  backend "s3" {
    bucket         = "f5-aws-lab-env"
    key            = "aws-maniak-env.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "aws-maniak-env-state-lock"
  }
}

provider "aws" {
  region = var.aws_region
}

module "core_infra" {
  source = "./infra"
  
  aws_keypair       = var.aws_keypair
  vpd_id = module.core_infra.vpd_id
  ntw-mgmt          = module.core_infra.ntw-mgmt
  ntw-public-a      = module.core_infra.ntw-public-a
  ntw-private-a     = module.core_infra.ntw-private-a
  grafanasecgroup   = module.core_infra.grafanasecgroup
  juiceshopsecgroup = module.core_infra.juiceshopsecgroup
  

}
module "app" {
  source            = "./app"
  aws_keypair       = var.aws_keypair
    vpd_id = module.core_infra.vpd_id

  ntw-mgmt          = module.core_infra.ntw-mgmt
  ntw-public-a      = module.core_infra.ntw-public-a
  ntw-private-a     = module.core_infra.ntw-private-a
  grafanasecgroup   = module.core_infra.grafanasecgroup
  juiceshopsecgroup = module.core_infra.juiceshopsecgroup

}


