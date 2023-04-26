provider "aws" {
    region = var.region
  }
  
  # Create IAM role with permissions to access Redshift
  resource "aws_iam_role" "redshift_role" {
    name = var.redshift_role_name
    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Principal = {
            Service = "sagemaker.amazonaws.com"
          }
          Action = "sts:AssumeRole"
        }
      ]
    })
  
    # Permissions to access Redshift
    inline_policy {
      name = "redshift_policy"
      policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
          {
            Effect = "Allow"
            Action = [
              "redshift:GetClusterCredentials",
              "redshift:DescribeClusters",
              "redshift:DescribeClusterCredentials",
              "redshift:AuthorizeClusterSecurityGroupIngress",
              "secretsmanager:GetSecretValue"
            ]
            Resource = ["*", "arn:aws:secretsmanager:*:*:secret:redshift-credentials-*"]
          }
        ]
      })
    }
  }
  
  # Create security group for Redshift cluster
  resource "aws_security_group" "redshift_sg" {
    name_prefix = var.redshift_security_group_name
    description = "Security group for Redshift cluster"
    vpc_id = var.vpc_id
  
    ingress {
      from_port = 5439
      to_port = 5439
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
  # Create a secret to store the Redshift database credentials
  resource "aws_secretsmanager_secret" "redshift_credentials" {
    name = var.redshift_secret_name
  }
  
  # Add the Redshift database credentials to the secret
  resource "aws_secretsmanager_secret_version" "redshift_credentials" {
    secret_id = aws_secretsmanager_secret.redshift_credentials.id
    secret_string = jsonencode({
      username = var.master_username
      password = var.master_password
    })
  }
  
  # Retrieve the Redshift database credentials from the secret
  data "aws_secretsmanager_secret" "redshift_credentials" {
    name = aws_secretsmanager_secret.redshift_credentials.name
  }
  
  # Create SageMaker notebook instance
  resource "aws_sagemaker_notebook_instance" "jupyter_notebook" {
    name = var.notebook_name
    role_arn = aws_iam_role.redshift_role.arn
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    security_groups = [
      aws_security_group.redshift_sg.id,
      var.sagemaker_security_group_id
    ]
  
    # Bootstrapping script to install packages and libraries
    lifecycle {
      create_before_destroy = true
    }
  
    provisioner "remote-exec" {
      inline = [
        "pip install psycopg2-binary pandas"
      ]
    }
  
    
    # Set up authentication to Redshift API using the stored credentials
    # environment {
    #   REDSHIFT_HOST = var.redshift_host
    #   REDSHIFT_DATABASE = var.redshift_database
    #   REDSHIFT_USER = data.aws_secretsmanager_secret.redshift_credentials.secret.username
    #   REDSHIFT_PASSWORD = data.aws_secretsmanager_secret.redshift_credentials.secret.password
    # }
  }
  