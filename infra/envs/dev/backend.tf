terraform {
  backend "s3" {
    bucket         = "brentbucketremote"
    key            = "devops-job-sim/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
