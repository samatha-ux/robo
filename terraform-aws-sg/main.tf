resource "aws_security_group" "allow_tls" {
    name = local.final_sg_name
    description = "Allow traffic for ${var.sg_name}"
    vpc_id = var.vpc_id

    egress ={
        from_port = 0
        to_port = 0
        protocal = "-1"
        cidr_block = ["0.0.0.0/0"] #we never add ingress rule bcoz if any one created then it cause error
    }
    tags = merge(
        var.sg_tags,
        local.common_tags
    )

}