variable "project" {
    type = string
    default = "roboshop"
}
variable "environment"{
    type = string 
    default ="dev"
}
variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}
variable "vpc_tags" {
    type = map
    default = {}
}
variable "igw_tags" {
    type = map
    default = {}
}
variable "public_subnet_cidr" {
    type = list
    default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "public_subnet_tags" {
    type = map
    default ={}
}
variable "private_subnet_cidr" {
    type = list
    default = ["10.0.3.0/24","10.0.4.0/24"]
}
variable "private_subnet_tags" {
    type = map
    default ={}
}
variable "database_subnet_cidr" {
    type = list
    default = ["10.0.5.0/24","10.0.6.0/24"]
}
variable "database_subnet_tags" {
    type = map
    default ={}
}
variable "public_route_table_tags" {
    type = map
    default = {}

}
variable "private_route_table_tags" {
    type = map
    default = {}
}
variable "database_route_table_tags" {
    type = map
    default = {}
}
variable "eip_tags" {
    type = map
    default = {}
}
variable "nat_tags" {
    type = map
    default = {}
}
variable "is_peering_required" {
    default = false

}
variable "vpc_peering_tags" {
    type = map
    default = {}
}


# #/* variable "peer_vpc_id" {
#   type        = string
#   description = "VPC ID of the accepter VPC in the other account"
# }

# variable "peer_owner_id" {
#   type        = string
#   description = "12-digit AWS Account ID of the accepter VPC"
# }
#  *
