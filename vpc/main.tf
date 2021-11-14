provider "aws" {
  region  = "us-east-1"
  profile = "chandradc-general"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "FromJenkins"
    project = "001"
  }

}
