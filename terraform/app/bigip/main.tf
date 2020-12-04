data "aws_availability_zones" "available" {}

resource "aws_cloudformation_stack" "f5-payg-bigip-stack" {
  name         = var.f5-stack-name
  capabilities = ["CAPABILITY_IAM"]

  parameters = {
    Vpc = var.vpc_id


    imageName    = var.imageName
    instanceType = "m4.large"
    sshKey       = var.aws_keypair

    managementSubnetAz1        = var.ntw-mgmt
    managementSubnetAz1Address = var.f5-subnet1Az1Address
    provisionPublicIP          = "Yes"
    restrictedSrcAddress       = "0.0.0.0/0"
    restrictedSrcAddressApp    = "0.0.0.0/0"
    subnet1Az1                 = var.ntw-public-a
    subnet1Az1Address          = var.f5-subnet1Az1Address

    bigIpModules  = "ltm:nominal"
    customImageId = "OPTIONAL"

    declarationUrl = "https://raw.githubusercontent.com/sebbycorp/my-basic-as3-app/master/as3-https.json"

    timezone  = "UTC"
    ntpServer = "0.pool.ntp.org"

    allowPhoneHome      = "No"
    allowUsageAnalytics = "No"

    owner       = "f5owner"
    costcenter  = "f5costcenter"
    environment = "f5env"
    group       = "f5group"
    application = "f5app"

  }
  template_url = "https://f5-payg-aws-cft-tf-env-s3.s3.amazonaws.com/f5-payg-cft.json"
}