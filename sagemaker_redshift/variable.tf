variable "region" {
  description = "The AWS region where the resources will be created"
  type        = string
}

variable "redshift_role_name" {
  description = "The name of the IAM role that has permissions to access Redshift"
  type        = string
}

variable "redshift_security_group_name" {
  description = "The prefix name for the security group that will be created for the Redshift cluster"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

variable "redshift_secret_name" {
  description = "The name of the AWS Secrets Manager secret that will store the Redshift database credentials"
  type        = string
}

variable "master_username" {
  description = "The username to connect to the Redshift database"
  type        = string
}

variable "master_password" {
  description = "The password to connect to the Redshift database"
  type        = string
}

variable "notebook_name" {
  description = "The name of the SageMaker notebook instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the SageMaker notebook instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the SageMaker notebook instance will be launched"
  type        = string
}

variable "sagemaker_security_group_id" {
  description = "The ID of the security group that will be associated with the SageMaker notebook instance"
  type        = string
}

variable "redshift_host" {
  description = "The hostname or endpoint of the Redshift cluster"
  type        = string
}

variable "redshift_database" {
  description = "The name of the Redshift database"
  type        = string
}

