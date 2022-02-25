terraform {
  backend "remote" {
    organization = "TFSquad-GCP"

    workspaces {
      name = "Terraform-GCP"
    }
  }
}