output "vpc_id" {
    description = "The ID of the VPC"
    value = aws_vpc.this.id
  
}

output "private_subnet1_id" {
    description = "The ID of the subnet"
    value = aws_subnet.private1.id
  
}

output "private_subnet2_id" {
    description = "The ID of the subnet"
    value = aws_subnet.private2.id
  
}

output "public_subnet1_id" {
    description = "The ID of the subnet"
    value = aws_subnet.public1.id
  
}

output "public_subnet2_id" {
    description = "The ID of the subnet"
    value = aws_subnet.public2.id
  
}

output "private_subnet1_cidr" {
    description = "The cidr block of the subnet"
    value = aws_subnet.private1.cidr_block
  
}

output "private_subnet2_cidr" {
    description = "The cidr block of the subnet"
    value = aws_subnet.private2.cidr_block
  
}

output "public_subnet1_cidr" {
    description = "The cidr block of the subnet"
    value = aws_subnet.public1.cidr_block
  
}

output "public_subnet2_cidr" {
    description = "The cidr block of the subnet"
    value = aws_subnet.public2.cidr_block
  
}

output "connect_attachment_id" {
    value = one(aws_networkmanager_connect_attachment.connect[*].id)
  
}

output "connect_peer_1" {
  description = "The connect peer configuration"
  value = {
    connect_peer_id        = aws_networkmanager_connect_peer.peer.id
    core_network_addresses = local.core_network_addresses
    core_network_asns      = local.core_network_asns
    peer_addresses         = local.peer_addresses
    peer_asns              = local.peer_asns
  }

}

output "connect_peer_2" {
  description = "The connect peer configuration"
  value = {
    connect_peer_id        = aws_networkmanager_connect_peer.peer2.id
    core_network_addresses = local.core_network_addresses_2
    core_network_asns      = local.core_network_asns_2
    peer_addresses         = local.peer_addresses_2
    peer_asns              = local.peer_asns_2
  }

}
