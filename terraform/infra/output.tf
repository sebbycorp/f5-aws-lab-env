output "vpc" {
  value = module.network.vpc
}
output "ntw-mgmt" {
  value = module.network.ntw-mgmt
}
output "ntw-public-a" {
  value = module.network.ntw-public-a
}
output "ntw-private-a" {
  value = module.network.ntw-private-a
}
output "grafanasecgroup" {
  value = module.security.grafanasecgroup
}

output "juiceshopsecgroup" {
  value = module.security.juiceshopsecgroup
}