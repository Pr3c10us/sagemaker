module "sagemaker_redshift" {
  source = "./sagemaker_redshift"
  
  region = var.region
  redshift_role_name = var.redshift_role_name
  redshift_security_group_name = var.redshift_security_group_name
  vpc_id = var.vpc_id
  redshift_secret_name = var.redshift_secret_name
  master_username = var.master_username
  master_password = var.master_password
  notebook_name = var.notebook_name
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  sagemaker_security_group_id = var.sagemaker_security_group_id
  redshift_host = var.redshift_host
  redshift_database = var.redshift_database
}

