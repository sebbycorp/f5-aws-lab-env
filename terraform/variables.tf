variable "aws_region" {
  description = "aws region (default is us-east-1)"
  default     = "us-east-1"
}
variable "aws_keypair" {
  description = "The name of an existing key pair. In AWS Console: NETWORK & SECURITY -> Key Pairs"
  default     = "maniak.io.key"
}
