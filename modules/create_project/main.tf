resource "selectel_vpc_project_v2" "project_1" {
  name = var.name
}

resource "selectel_iam_serviceuser_v1" "serviceuser_1" {
  name     = var.service_user_name
  password = var.service_user_pass
  role {
    role_name  = "member"
    scope      = "project"
    project_id = selectel_vpc_project_v2.project_1.id
  }
}
