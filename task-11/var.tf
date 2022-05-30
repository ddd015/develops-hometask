variable "app_port" {
  default = 80
}

variable "node_port" {}
variable "image_name" {}
variable "app_name" {}
variable "repl_count" {}
variable "git_token" {}
variable "cl_crt" {}
variable "cl_key" {}
variable "cl_ca_key" {}
#variable "path_file" {}
variable "host_ip" {}
variable "git_repo_name" {}
variable "path" {
  default = "/home/dima/vm/terraform"
}
variable "files" {
  default = [
    "github.tf",
    "provider.tf",
    "static-deployment.tf",
    "static-service.tf",
    "terraform.tfvars",
    "var.tf",
    ".terraform.lock.hcl"
  ]
}

