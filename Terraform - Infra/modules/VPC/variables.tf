variable "vpc_dns_support" {
    type = bool
    default = true
}
variable "vpc_dns_hostnames" {
    type = bool
    default = true
}
variable "vpc_cidr_block" {
    type = string
}

variable "tags" {
  type        = map(string)
}