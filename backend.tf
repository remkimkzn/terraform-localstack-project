# помнить что уже создано terraform.tfstate
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}