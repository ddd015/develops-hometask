resource "github_repository" "terraform-modules" {
  name       = "develops-hometask"
  auto_init  = true
  visibility = "public"
}

resource "github_repository_file" "file" {
  repository          = github_repository.terraform-terraform-modules.name
  branch              = github_repository.terraform-terraform-modules.branches.0.name
  file                = "service/terraform.tfstate"
  content             = file(var.path_file)
  commit_message      = "Ups, i am write commit"
  commit_author       = "I am"
  commit_email        = "vasya_pupkin@pupkin.com"
  overwrite_on_create = true
}

