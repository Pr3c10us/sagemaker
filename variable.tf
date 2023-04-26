variable "region" {
  type    = string
  default = "us-west-2"
}

variable "redshift_role_name" {
  type    = string
  default = "my-redshift-role"
}

variable "redshift_security_group_name" {
  type    = string
  default = "my-redshift-sg"
}

variable "vpc_id" {
  type    = string
  default = "vpc-123456789"
}

variable "redshift_secret_name" {
  type    = string
  default = "my-redshift-credentials"
}

variable "master_username" {
  type    = string
  default = "admin"
}

variable "master_password" {
  type    = string
  default = "password123"
}

variable "notebook_name" {
  type    = string
  default = "my-notebook"
}

variable "instance_type" {
  type    = string
  default = "ml.t2.medium"
}

variable "subnet_id" {
  type    = string
  default = "subnet-123456789"
}

variable "sagemaker_security_group_id" {
  type    = string
  default = "sg-123456789"
}

variable "redshift_host" {
  type    = string
  default = "my-redshift-cluster.amazonaws.com"
}

variable "redshift_database" {
  type    = string
  default = "my-redshift-db"
}
