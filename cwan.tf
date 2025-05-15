resource "aws_networkmanager_vpc_attachment" "cwan" {
  subnet_arns     = [aws_subnet.private1.arn, aws_subnet.private2.arn]
  core_network_id = var.core_network_id
  vpc_arn         = aws_vpc.this.arn

  tags = {
    segment = var.segment
  }
}

resource "aws_networkmanager_connect_attachment" "connect" {
  core_network_id         = var.core_network_id
  transport_attachment_id = aws_networkmanager_vpc_attachment.cwan.id
  edge_location           = aws_networkmanager_vpc_attachment.cwan.edge_location
  options {
    protocol = "NO_ENCAP"
  }
  tags = {
    segment = var.segment
  }
}

resource "aws_networkmanager_connect_peer" "peer" {
  connect_attachment_id = aws_networkmanager_connect_attachment.connect.id
  peer_address          = "10.1.0.10"
  
  bgp_options {
    peer_asn = 65000
  }
  inside_cidr_blocks = null
  subnet_arn = aws_subnet.private1.arn

  tags = {
    segment = var.segment
  }
}

resource "aws_networkmanager_connect_peer" "peer2" {
  connect_attachment_id = aws_networkmanager_connect_attachment.connect.id
  peer_address          = "10.1.4.10"
  
  bgp_options {
    peer_asn = 65000
  }
  inside_cidr_blocks = null
  subnet_arn = aws_subnet.private2.arn

  tags = {
    segment = var.segment
  }
}