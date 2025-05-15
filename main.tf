resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.name}-vpc"
    segment = var.segment
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-rt-private"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.this.id
  cidr_block = local.private_subnet_1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.name}-subnet-private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.this.id
  cidr_block = local.private_subnet_2
  availability_zone = data.aws_availability_zones.available.names[1]


  tags = {
    Name = "${var.name}-subnet-private2"
  }
}

resource "aws_route_table_association" "subnet_private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "subnet_private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-rt-public"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.this.id
  cidr_block = local.public_subnet_1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.name}-subnet-public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.this.id
  cidr_block = local.public_subnet_2
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "${var.name}-subnet-public2"
  }
}

resource "aws_route_table_association" "subnet_public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "subnet_public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_nat_gateway" "this" {
  count         = var.create_natgw ? 1 : 0
  subnet_id     = aws_subnet.public1.id
  allocation_id = aws_eip.natgw[0].allocation_id

  tags = {
    Name = "${var.name}-natgw"
  }

  depends_on = [aws_internet_gateway.this]
}

resource "aws_eip" "natgw" {
  count  = var.create_natgw ? 1 : 0
  domain = "vpc"

  tags = {
    Name = "${var.name}-natgw-eip"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_route" "default_to_natgw" {
  count                  = var.create_natgw ? 1 : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this[0].id
}

resource "aws_route" "default_to_igw" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

# resource "aws_key_pair" "this" {
#   key_name   = var.project
#   public_key = file(var.public_key_path)

#   tags = {
#     Name = "${var.project}-key-pair"
#   }
# }