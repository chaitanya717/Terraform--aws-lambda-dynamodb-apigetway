terraform {
  backend "s3" {
    bucket = "lambda-serverlesss"
     key = "./terraform.tfstate"
    region = "eu-west-1"
  }
}