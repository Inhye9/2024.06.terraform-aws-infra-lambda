provider "aws" {
  region = var.region
  profile = var.profile
}

# ------------------------------------------------------------------------
#  VPC, Subnet 등 Network 생성 
# ------------------------------------------------------------------------
module "anf-vpc" {
  source = "../../modules/vpc"

  region                          = var.region
  project_name                    = var.project_name
  profile                         = var.profile
} 

# ------------------------------------------------------------------------
#  Lambda 환경 생성 
# ------------------------------------------------------------------------
module "anf-lambda" {
  source = "../../modules/lambda"

  region                          = var.region
  project_name                    = var.project_name
  profile                         = var.profile
} 