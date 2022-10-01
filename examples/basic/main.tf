module "vpc" {
  source  = "punkerside/vpc/aws"
  version = "0.0.11"

  project = "falcon"
  env     = "sandbox"
}