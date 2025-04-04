terraform {
  backend "s3" {
    bucket = "mi-w7-terraformstate"
    key    = "dev2/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true 
  }
}