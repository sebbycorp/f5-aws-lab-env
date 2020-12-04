variable "vpc_id" {}

variable "availability-zones" {
  description = "aws region (default is us-east-1)"
  default     = "us-east-1a"
}
variable "aws_keypair" {}
variable "ntw-mgmt" {}
variable "ntw-public-a" {}
variable "ntw-private-a" {}

variable "f5-stack-name" {
  description = "f5 stack name"
  default     = "f5-payg-stack"
}
variable "imageName" {
  description = "imageName"
  default     = "Good25Mbps"
}

variable "f5-managementSubnetAz1Address" {
  description = "managementSubnetAz1Address"
  default     = "DYNAMIC"
}
variable "f5-subnet1Az1Address" {
  description = "subnet1Az1Address"
  default     = "DYNAMIC"
}
variable "f5-subnet1Az1AddressPri" {
  description = "subnet1Az1AddressPri"
  default     = "DYNAMIC"
}


variable "restrictedSrcAddress" {
  type        = list
  description = "Lock down management access by source IP address or network"
  default     = ["0.0.0.0/0", "10.0.0.0/16"]
}

variable "restrictedSrcAddressApp" {
  description = "Lock down management access by source IP address or network"
  default     = "0.0.0.0/0"
}