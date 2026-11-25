resource "aws_vpc_peering_connection" "default" {
    count = var.is_peering_required ? 1 :0
    peer_vpc_id = data.aws_vpc.default.id #acceptor
    vpc_id = aws_vpc.main.id #requester
    auto_accept = true

    accepter {
        allow_remote_vpc_dns_resolution = true
    }
    requester {
        allow_remote_vpc_dns_resolution = true
    }
    tags = merge(
        var.vpc_peering_tags,
        {
            Name = "${local.common_name}-default"
        }
    )
} 
resource "aws_route" "public_peering" {
    count = var.is_peering_required ? 1 :0 #we can add private and databaseas well as per requirement
    route_table_id = aws_route_table.public.id
    destination_cidr_block = data.aws_vpc.default.cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
    
}
resource "aws_route" "default"{
    count = var.is_peering_required ? 1 :0
    route_table_id = data.aws_route_table.default.id
    destination_cidr_block = var.vpc_cidr #if another vpc we are connecting then we should inform them to add this route
    vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
}


