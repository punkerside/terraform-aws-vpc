module "vpc" {
  source  = "punkerside/vpc/aws"
  version = "0.0.12"

  project = "falcon"
  env     = "sandbox"
}