output "vpc" {
  value = aws_vpc.infra-vpc.id
}
output "ntw-mgmt" {
  value = aws_subnet.ntw-mgmt.id
}
output "ntw-public-a" {
  value = aws_subnet.ntw-public-a.id
}
output "ntw-private-a" {
  value = aws_subnet.ntw-private-a.id
}