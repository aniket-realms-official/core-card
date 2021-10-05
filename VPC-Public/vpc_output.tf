output "vpc_id" {
  value = aws_vpc.CoreCard_VPC_Final.id
}

output "subnet1" {
  value = element(aws_subnet.public_subnet1.*.id, 1)
}

output "subnet2" {
  value = element(aws_subnet.public_subnet1.*.id, 2)
}

output "bhost_subnet1" {
  value = element(aws_subnet.public_subnet2.*.id, 1)
}

output "bhost_subnet2" {
  value = element(aws_subnet.public_subnet2.*.id, 2)
}

output "public_subnets" {
  value = aws_subnet.public_subnet1.*.id
}

output "bhost_public_subnets" {
  value = aws_subnet.public_subnet2.*.id
}

output "security_group" {
  value = aws_security_group.public-sg1.id
}

output "bhost_0security_group" {
  value = aws_security_group.public-sg2.id
}
