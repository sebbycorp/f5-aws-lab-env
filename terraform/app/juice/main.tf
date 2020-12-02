resource "aws_instance" "juicebox" {
  ami                         = "ami-062f7200baf2fa504"
  instance_type               = "t2.micro"
  key_name                    = var.aws_keypair
  subnet_id                   = var.ntw-public-a
  user_data                   = file("${path.module}/juice.sh")
  associate_public_ip_address = true
  vpc_security_group_ids = [
    var.juiceshopsecgroup
  ]
  tags = {
    "Name" = "juiceshop"
  }
}