# vpc
resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = var.name == null ? random_string.this.result : var.name
  }
}

# eip
resource "aws_eip" "this" {
  count = length(var.cidr_pub)
  vpc   = true

  tags = {
    Name = "${var.name == null ? random_string.this.result : var.name}-${element(local.aws_availability_zones, count.index)}"
  }
}

# internet gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.name == null ? random_string.this.result : var.name
  }
}

# subnet
resource "aws_subnet" "public" {
  count                   = length(var.cidr_pub)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = element(var.cidr_pub, count.index)
  availability_zone       = element(local.aws_availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name == null ? random_string.this.result : var.name}-public-${element(local.aws_availability_zones, count.index)}"
  }
}

resource "aws_subnet" "private" {
  count                   = length(var.cidr_pri)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = element(var.cidr_pri, count.index)
  availability_zone       = element(local.aws_availability_zones, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.name == null ? random_string.this.result : var.name}-private-${element(local.aws_availability_zones, count.index)}"
  }
}

# nat gateway
resource "aws_nat_gateway" "this" {
  count         = length(var.cidr_pri)
  allocation_id = element(aws_eip.this.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)

  tags = {
    Name = "${var.name == null ? random_string.this.result : var.name}-${element(local.aws_availability_zones, count.index)}"
  }
}

# route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.name == null ? random_string.this.result : var.name}-public"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.cidr_pub)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  count  = length(var.cidr_pri)
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.this.*.id, count.index)
  }

  tags = {
    Name = "${var.name == null ? random_string.this.result : var.name}-private-${element(local.aws_availability_zones, count.index)}"
  }
}

resource "aws_route_table_association" "private" {
  count          = length(var.cidr_pri)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}