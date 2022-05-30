resource "github_repository" "task-11" {
  name       = "develops-hometask"
  auto_init  = true
  visibility = "public"
}

resource "github_repository_file" "file" {
  repository          = github_repository.task-11.name
  branch              = github_repository.task-11.branches.0.name
  file                = "service/terraform.tfstate"
  content             = file(var.path_file)
  commit_message      = "Ups, i am write commit"
  commit_author       = "I am"
  commit_email        = "vasya_pupkin@pupkin.com"
  overwrite_on_create = true
}

