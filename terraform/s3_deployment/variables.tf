

variable "subdomain_name" {
  type = string
}

variable "bucket_name" {
  type = string
}

locals {
  full_domain = "${var.subdomain_name}.eliasschmittel.com"
}

