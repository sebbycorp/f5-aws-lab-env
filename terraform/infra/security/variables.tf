variable "vpc_id" {}

variable "restrictedSrcAddress" {
  type        = list
  description = "Lock down management access by source IP address or network"
  default     = ["0.0.0.0/0", "10.0.0.0/16"]
}

variable "restrictedSrcAddressApp" {
  description = "Lock down management access by source IP address or network"
  default     = "0.0.0.0/0"
}
