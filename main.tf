resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "${var.name}-vpc"
    segment = var.create_vpc_attachment == true ? var.segment : ""
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name}-rt-private"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.private_subnet
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.name}-subnet-private"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.private_subnet2
  availability_zone = data.aws_availability_zones.available.names[1]


  tags = {
    Name = "${var.name}-subnet-private2"
  }
}

resource "aws_route_table_association" "subnet_private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "subnet_private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name}-rt-public"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.public_subnet
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.name}-subnet-public"
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.public_subnet2
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "${var.name}-subnet-public2"
  }
}

resource "aws_route_table_association" "subnet_public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "subnet_public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_nat_gateway" "main" {
  count         = var.create_natgw ? 1 : 0
  subnet_id     = aws_subnet.public.id
  allocation_id = aws_eip.natgw[0].allocation_id

  tags = {
    Name = "${var.name}-natgw"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_eip" "natgw" {
  count  = var.create_natgw ? 1 : 0
  domain = "vpc"

  tags = {
    Name = "${var.name}-natgw-eip"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_route" "default_private" {
  count                  = var.create_natgw ? 1 : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main[0].id
}

resource "aws_route" "default_public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_networkmanager_vpc_attachment" "main" {
  count  = var.create_vpc_attachment ? 1 : 0

  subnet_arns     = [aws_subnet.private.arn, aws_subnet.private2.arn]
    core_network_id = var.core_network_id
    vpc_arn         = aws_vpc.main.arn

    tags = {
      segment = var.segment
    }

}

# resource "aws_key_pair" "main" {
#   key_name   = var.project
#   public_key = file(var.public_key_path)

#   tags = {
#     Name = "${var.project}-key-pair"
#   }
# }