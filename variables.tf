
variable "region" {
  default = "us-west-1"
}

## KMS server variable ##
variable "KMS_inst_type_tf" {
  default = "t2.micro"
}
variable "KMS_inst_count_tf" {
  default = 2
}
variable "KMS_ebs_size_tf" {
  default = 10
}
variable "KMS_ami_type" {
  default = "ami-0f24128138a6f2eaa"
}

## Web Server Variables ##
variable "web_inst_type_tf" {
  default = "t2.micro"
}
variable "web_inst_count_tf" {
  default = 2
}
variable "web_ebs_size_tf" {
  default = 10
}
variable "web_ami_type" {
  default = "ami-082fd985a931262f0"
}


## Auth Server Variables ##
variable "Auth_inst_type_tf" {
  default = "t2.micro"
}
variable "Auth_inst_count_tf" {
  default = 2
}
variable "Auth_ebs_size_tf" {
  default = 10
}
variable "Auth_ami_type" {
  default = "ami-0258d389bc7bbbdc8"
}

## ISSU Server Variables ##
variable "ISSU_inst_type_tf" {
  default = "t2.micro"
}
variable "ISSU_inst_count_tf" {
  default = 2
}
variable "ISSU_ebs_size_tf" {
  default = 10
}
variable "ISSU_ami_type" {
  default = "ami-0c2536d4b4021ccc5"
}



## TNP Server Variables ##
variable "TNP_inst_type_tf" {
  default = "t2.micro"
}
variable "TNP_inst_count_tf" {
  default = 2
}
variable "TNP_ebs_size_tf" {
  default = 10
}
variable "TNP_ami_type" {
  default = "ami-06b3f8e6dc3576785"
}


## SVCE Server Variables ##
variable "SVCE_inst_type_tf" {
  default = "t2.micro"
}
variable "SVCE_inst_count_tf" {
  default = 2
}
variable "SVCE_ebs_size_tf" {
  default = 10
}
variable "SVCE_ami_type" {
  default = "ami-04cc58afecc811059"
}


## WKF Server Variables ##
variable "WKF_inst_type_tf" {
  default = "t2.micro"
}
variable "WKF_inst_count_tf" {
  default = 2
}
variable "WKF_ebs_size_tf" {
  default = 10
}
variable "WKF_ami_type" {
  default = "ami-04cc58afecc811059"
}

## File Processing Workflow Server Variables ##
variable "BAT_inst_type_tf" {
  default = "t2.micro"
}
variable "BAT_inst_count_tf" {
  default = 2
}
variable "BAT_ebs_size_tf" {
  default = 10
}
variable "BAT_ami_type" {
  default = "ami-04cc58afecc811059"
}

## WCF Server Variables ##
variable "WCF_inst_type_tf" {
  default = "t2.micro"
}
variable "WCF_inst_count_tf" {
  default = 2
}
variable "WCF_ebs_size_tf" {
  default = 10
}
variable "WCF_ami_type" {
  default = "ami-0f4309737a61f885a"
}

## Report Delivery & SSRS Server Variables ##
variable "RPTD_inst_type_tf" {
  default = "t2.2xlarge"
}
variable "RPTD_inst_count_tf" {
  default = 2
}
variable "RPTD_ebs_size_tf" {
  default = 10
}
variable "RPTD_ami_type" {
  default = "ami-04cc58afecc811059"
}

## Primary DB Server Variables ##
variable "DB_inst_type_tf" {
  default = "t2.2xlarge"
}
variable "DB_inst_count_tf" {
  default = 2
}
# variable "DB_ebs_count_tf" {
#   default = 6
# }
variable "DB_ebs_size_tf" {
  default = 100
}

variable "DB_ami_type" {
  default = "ami-01f724e8c07ceb576"
}

## Replication DB Server Variables ##
variable "RPLDB_inst_type_tf" {
  default = "t2.2xlarge"
}
variable "RPLDB_inst_count_tf" {
  default = 2
}
# variable "RPLDB_ebs_count_tf" {
#   default = 6
# }
variable "RPLDB_ebs_size_tf" {
  default = 100
}
variable "RPLDB_ami_type" {
  default = "ami-01f724e8c07ceb576"
}

## Distribution DB Server Variables ##
variable "DIST_DB_inst_type_tf" {
  default = "t2.2xlarge"
}
variable "DIST_DB_inst_count_tf" {
  default = 2
}
# variable "DIST_DB_ebs_count_tf" {
#   default = 6
# }
variable "DIST_DB_ebs_size_tf" {
  default = 100
}
variable "DIST_DB_ami_type" {
  default = "ami-01f724e8c07ceb576"
}

## Bastion Host ##
variable "b_host_count_tf" {
  default = 2
}

variable "b_host_type_tf" {
  default = "t2.micro"
}

variable "bastion_ami_type" {
  default = ""
}

## Domain Controller ##
variable "DC_inst_type_tf" {
  default = "t2.micro"
}
variable "DC_inst_count_tf" {
  default = 2
}
variable "DC_ebs_size_tf" {
  default = 10
}
variable "DC_ami_type" {
  default = "ami-04cc58afecc811059"
}
