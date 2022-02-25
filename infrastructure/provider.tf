provider "google" {
  credentials = file("account.json")
  project     = "playground-s-11-270a07c1"
  region      = "us-central1"
}

provider "google-beta" {
  credentials = file("account.json")
  project     = "playground-s-11-270a07c1"
  region      = "us-central1"
}