#resource "github_repository" "teraform" {
#  name       = "develops-hometask"
#  auto_init  = true
#  visibility = "public"
#}

resource "github_repository_file" "file" {
  count = length(var.files)
  repository          = var.git_repo_name
  branch              = "master"
  file                = "task-11/${element(var.files, count.index)}"
  content             = file("${var.path}/${element(var.files, count.index)}")
  commit_message      = "Ups, i am write commit"
  commit_author       = "I am"
  commit_email        = "vasya_pupkin@pupkin.com"
  overwrite_on_create = true
}

