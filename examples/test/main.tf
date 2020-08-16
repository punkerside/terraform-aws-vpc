provider "aws" {
  region = "us-east-1"
}

module "this" {
  source = "../../"
  env    = "awspec"
}