provider "aws" {
  region = "ap-southeast-1"
}

// in the initial apply, you need to comment out the backend block, and run terraform init & apply first to create the s3 bucket and dynamodb table.
// then you can uncomment the backend block and run terraform init again to configure the backend.
// this is because the backend block will try to create the s3 bucket and dynamodb table, but it will fail because the s3 bucket and dynamodb table are not created yet.
terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-bb1994"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-bb1994"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
