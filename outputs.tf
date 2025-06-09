output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id

}

output "private_subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.private.id

}

output "private2_subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.private2.id

}

output "public_subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.public.id

}

output "public2_subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.public2.id

}

output "private_subnet_cidr" {
  description = "The cidr block of the subnet"
  value       = aws_subnet.private.cidr_block

}

output "private2_subnet_cidr" {
  description = "The cidr block of the subnet"
  value       = aws_subnet.private2.cidr_block

}

output "public_subnet_cidr" {
  description = "The cidr block of the subnet"
  value       = aws_subnet.public.cidr_block

}

output "public_subnet2_cidr" {
  description = "The cidr block of the subnet"
  value       = aws_subnet.public2.cidr_block

}

output "private_subnet_arn" {
  description = "The arn of the subnet"
  value       = aws_subnet.private.arn

}

output "private2_subnet_arn" {
  description = "The arn of the subnet"
  value       = aws_subnet.private2.arn

}

output "public_subnet_arn" {
  description = "The arn of the subnet"
  value       = aws_subnet.public.arn

}

output "public2_subnet_arn" {
  description = "The arn of the subnet"
  value       = aws_subnet.public2.arn

}

output "vpc_attachment_id" {
    description = "The ID of the VPC CloudWAN attachment"
    value = aws_networkmanager_vpc_attachment.main[0].id
  
}
