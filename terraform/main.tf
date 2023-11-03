terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
}

resource "aws_instance" "kafka-valorant-project" {
  ami           = "ami-01bc990364452ab3e"
  instance_type = "t2.micro"

  tags = {
    Name = "kafka-valorant-project"
  }
}

resource "aws_s3_bucket" "kafka-vct2023-valorant-project" {
  bucket = "${var.bucket_name}" 
}