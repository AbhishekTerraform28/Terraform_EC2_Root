terraform {
  backend "s3" {
    bucket       = "abhishek-terraform-state-billu "
    key          = "dev/terraform.tfstate"
    region       = "eu-north-1"
    use_lockfile = true
  }
}