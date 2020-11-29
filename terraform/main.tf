
terraform {
  backend "s3" {
    bucket         = "f5-aws-lab-env"
    key            = "f5-aws-lab-env.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "f5-aws-lab-env-state-lock"
  }
}

resource "aws_s3_bucket" "f5-aws-lab-env-s3" {
  bucket = "f5-aws-lab-env"
  acl    = "private"

  versioning {
    enabled = true
  }
}
provider "aws" {
  region = var.aws_region
}

module "core_infra" {
  source = "./infra"
}
module "app" {
  source            = "./app"
  region            = var.region
  aws_keypair       = var.aws_keypair
  ntw-mgmt          = module.core_infra.ntw-mgmt
  ntw-public-a      = module.core_infra.ntw-public-a
  ntw-private-a     = module.core_infra.ntw-private-a
  grafanasecgroup   = module.core_infra.grafanasecgroup
  juiceshopsecgroup = module.core_infra.juiceshopsecgroup

}
