terraform {
  backend "s3" {
    bucket         = "ejfschmittel-terraform-state"
    key            = "apps/s3_starter/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "s3_deployment" {
  source         = "./s3_deployment"
  subdomain_name = "kings-cup"
  bucket_name    = "ejf-kings-cup"
}

