output "bastion_sg_id" {
  description = "Security Group for bastion server(ID)"
  value       = aws_security_group.bastion.id
}

output "bastion_sg_name" {
  description = "Security Group for bastion server(NAME)"
  value       = aws_security_group.bastion.name
}

output "bastion_sg_arn" {
  description = "Security Group for bastion server(ARN)"
  value       = aws_security_group.bastion.arn
}

output "bastion_instance_id" {
  description = "instance id of bastion server"
  value       = aws_instance.bastion.id
}

output "bastion_instance_arn" {
  description = "arn of bastion server"
  value       = aws_instance.bastion.arn
}

output "bastion_instance_public_ip" {
  description = "public IP of bastion server"
  value       = aws_instance.bastion.public_ip
}
