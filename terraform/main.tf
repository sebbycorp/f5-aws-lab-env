
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

module bigip {
  source = "./modules/bigip"
}

module app {
  source = "./modules/app"
}

module automation {
  source = "./modules/automation"
}

module monitor {
  source = "./modules/automation"
}