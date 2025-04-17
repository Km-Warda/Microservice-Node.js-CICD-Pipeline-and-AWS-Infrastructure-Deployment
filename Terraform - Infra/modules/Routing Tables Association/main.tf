# Route Table Association for Subnets
resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = var.subnet_id
  route_table_id = var.rt_id
}