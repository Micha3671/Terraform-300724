# Liste der AZs, Subnet-CIDRs und Namen der Subnetze
locals {
  azs                  = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  public_subnets       = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
  private_subnets      = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24"]
  public_subnet_names  = ["public-subnet-1a", "public-subnet-1b", "public-subnet-1c"]
  private_subnet_names = ["private-subnet-1a", "private-subnet-1b", "private-subnet-1c"]
}

# Erstelle öffentliche Subnetze
resource "aws_subnet" "public" {
  count = length(local.azs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = local.public_subnets[count.index]
  availability_zone       = local.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = local.public_subnet_names[count.index]
  }
}

# Erstelle private Subnetze
resource "aws_subnet" "private" {
  count = length(local.azs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = local.private_subnets[count.index]
  availability_zone = local.azs[count.index]
  tags = {
    Name = local.private_subnet_names[count.index]
  }
}
