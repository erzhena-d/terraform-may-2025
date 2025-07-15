terraform {
  backend "s3" {
    bucket = "kaizen-erzhenad"
    key    = "kaizen/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
# another approach - using dynamodb_table = "lock-state"