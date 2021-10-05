# Query all avilable Availibility Zone
data "aws_availability_zones" "available" {}

# VPC Creation Block
resource "aws_vpc" "CoreCard_VPC_Final" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.vpc_instance_tenancy
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    CreatedByTerraform = "true"
    Environment        = "dev"
    Name               = var.vpc_name
  }
}

# Public Subnet 1
resource "aws_subnet" "public_subnet1" {
  count                   = 2
  cidr_block              = var.public_cidrs1[count.index]
  vpc_id                  = aws_vpc.CoreCard_VPC_Final.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("%s_%s", var.public_subnet1_name, count.index + 1)
  }
}

# Public Subnet 2
resource "aws_subnet" "public_subnet2" {
  count                   = 2
  cidr_block              = var.public_cidrs2[count.index]
  vpc_id                  = aws_vpc.CoreCard_VPC_Final.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("%s_%s", var.public_subnet2_name, count.index + 1)
  }
}

# Public Route Table
resource "aws_route_table" "public_route_final" {
  vpc_id = aws_vpc.CoreCard_VPC_Final.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }

  tags = {
    Name = "public-route-final"
  }
}

# Private Route Table
resource "aws_default_route_table" "private_route_final" {
  default_route_table_id = aws_vpc.CoreCard_VPC_Final.default_route_table_id

  tags = {
    Name = "private-route-final"
  }
}

# Associate Public Subnet-1 with Public Route Table
resource "aws_route_table_association" "public_subnet_association_1" {
  count          = 2
  route_table_id = aws_route_table.public_route_final.id
  subnet_id      = aws_subnet.public_subnet1.*.id[count.index]
  depends_on     = [aws_route_table.public_route_final, aws_subnet.public_subnet1]
}

# Associate Public Subnet-2 with Public Route Table
resource "aws_route_table_association" "public_subnet_association_2" {
  count          = 2
  route_table_id = aws_route_table.public_route_final.id
  subnet_id      = aws_subnet.public_subnet2.*.id[count.index]
  depends_on     = [aws_route_table.public_route_final, aws_subnet.public_subnet2]
}

# Security Group Creation
resource "aws_security_group" "public-sg1" {
  name   = var.sg_name1
  vpc_id = aws_vpc.CoreCard_VPC_Final.id
}

# Security Group Creation
resource "aws_security_group" "public-sg2" {
  name   = var.sg_name2
  vpc_id = aws_vpc.CoreCard_VPC_Final.id
}

# Ingress HTTP rule
resource "aws_security_group_rule" "http_inbound_access" {
  description       = "HTTP"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.public-sg1.id
}

# Ingress HTTPS rule
resource "aws_security_group_rule" "https_inbound_access" {
  description       = "HTTPS"
  from_port         = 443
  to_port           = 443
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.public-sg1.id
}

# Ingress RDP rule
resource "aws_security_group_rule" "rdp_inbound_access" {
  description       = "RDP"
  from_port         = 3389
  to_port           = 3389
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.public-sg1.id
  # security_group_id = aws_security_group.public2-sg.id
}

# Ingress POP3 rule
resource "aws_security_group_rule" "pop3_inbound_access" {
  description       = "POP3"
  from_port         = 110
  to_port           = 110
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.public-sg1.id
  # security_group_id = aws_security_group.public2-sg.id
}

# Ingress WinRM-HTTP rule
resource "aws_security_group_rule" "winrm_http_inbound_access" {
  description       = "WinRM-HTTP"
  from_port         = 5985
  to_port           = 5985
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.public-sg1.id
  # security_group_id = aws_security_group.public2-sg.id
}

# Ingress WinRM-HTTPS rule
resource "aws_security_group_rule" "winrm_https_inbound_access" {
  description       = "WinRM-HTTPS"
  from_port         = 5986
  to_port           = 5986
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.public-sg1.id
  # security_group_id = aws_security_group.public2-sg.id
}

# Ingress Custom-TCP Port 81 rule
resource "aws_security_group_rule" "customtcs81_inbound_access" {
  description       = "Custom-TCP"
  from_port         = 81
  to_port           = 81
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.public-sg1.id
  # security_group_id = aws_security_group.public2-sg.id
}

# Ingress Custom-TCP Port 83 rule
resource "aws_security_group_rule" "customtcs83_inbound_access" {
  description       = "Custom-TCP"
  from_port         = 83
  to_port           = 83
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.public-sg1.id
  # security_group_id = aws_security_group.public2-sg.id
}

# Ingress Custom-TCP Port 82 rule
resource "aws_security_group_rule" "customtcs82_inbound_access" {
  description       = "Custom-TCP"
  from_port         = 82
  to_port           = 82
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.public-sg1.id
  # security_group_id = aws_security_group.public2-sg.id
}

# Ingress SMTP rule
resource "aws_security_group_rule" "smtp_inbound_access" {
  description       = "SMTP"
  from_port         = 25
  to_port           = 25
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.public-sg1.id
  # security_group_id = aws_security_group.public2-sg.id
}

# Ingress All ICMP rule
resource "aws_security_group_rule" "allicmp_inbound_access" {
  description       = "Custom ICMP-IPv4"
  from_port         = 0
  to_port           = 0
  protocol          = "ICMP"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  security_group_id = aws_security_group.public-sg1.id
  # security_group_id = aws_security_group.public2-sg.id
}

# All OutBound Access
resource "aws_security_group_rule" "all_outbound_access" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.public-sg1.id
  # security_group_id = aws_security_group.public-sg2.id
  to_port     = 0
  type        = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}
