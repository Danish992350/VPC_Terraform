output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

output "subnet_ids" {
    value = aws_subnet.subnets.*.id
}



#these output is for that thes output values can be used by other modules 