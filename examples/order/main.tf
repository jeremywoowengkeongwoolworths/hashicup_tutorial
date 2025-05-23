terraform {
  required_providers {
    hashicups = {
      source = "hashicorp.com/edu/hashicups"
    }
  }  
  required_version = ">= 1.1.0"
}

provider "hashicups" {
  host     = "http://localhost:19090"
  username = "education"
  password = "test123"
}

output "total_price" {
  value = provider::hashicups::compute_tax(5.00, 0.085)
}

data "hashicups_coffees" "edu" {}

resource "hashicups_order" "edu" {
  items = [{
    coffee = {
      id = 3
    }
    quantity = 222
    }, {
    coffee = {
      id = 2
    }
    quantity = 999
    }
  ]
}

output "edu_coffees" {
  value = data.hashicups_coffees.edu
}

