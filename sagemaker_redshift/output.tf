output "sagemaker_notebook_instance_id" {
  value = aws_sagemaker_notebook_instance.jupyter_notebook.id
}

output "redshift_role_arn" {
  value = aws_iam_role.redshift_role.arn
}

output "redshift_security_group_id" {
  value = aws_security_group.redshift_sg.id
}

output "redshift_credentials_secret_name" {
  value = aws_secretsmanager_secret.redshift_credentials.name
}

output "redshift_credentials_secret_version" {
  value = aws_secretsmanager_secret_version.redshift_credentials.id
}
