provider "aws" {
  region = "ap-southeast-1"

  default_tags {
    tags = {
      Owner     = "team-foo"
      ManagedBy = "Terraform"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-bb1994"
    key            = "stage/services/webserver-cluster/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

module "webserver_cluster" {
  source = "../../../modules/services/hello-world-app"
  environment            = "stage"

  server_text            = "New server text"
  db_remote_state_bucket = "terraform-up-and-running-bb1994"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2

  enable_autoscaling = false

  custom_tags = {
    Owner     = "team-foo"
    ManagedBy = "Terraform"
  }
}
