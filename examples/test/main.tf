provider "aws" {
  region = "us-east-1"
}

module "this" {
  source  = "../../"
  project = "falcon"
  env     = "awspec"
}