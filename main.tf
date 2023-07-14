
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.7.0"
    }
  }
}
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIATGUS7Y2AVTWXIBOD"
  secret_key = "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"
}


resource "aws_dynamodb_table" "users" {
  name         = "users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "email"

  attribute {
    name = "email"
    type = "S"
  }

  global_secondary_index {
    name               = "email-index"
    hash_key           = "email"
    projection_type    = "INCLUDE"
    read_capacity      = 5
    write_capacity     = 5
    non_key_attributes = ["name", "password"]
  }

}
