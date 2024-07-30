terraform {
  backend "s3" {
    bucket = "s3-terraform-260724"
    key    = "ec2-example/ec2-example.tfstate"
    region = "eu-central-1"
  }
}