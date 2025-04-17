output "vpc_id" {
  value = module.vpc.vpc_id
}
output "subnet_id" {
  value = module.public_subnet.subnet_id
}
output "security_group_id" {
  value = module.security_group.security_group_id
}
output "instance_id" {
  value = module.ec2_instance.instance_id
}
output "route_table_id" {
  value       = module.Routing_Tables.route_table_id
}