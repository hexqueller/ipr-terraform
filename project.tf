resource "selectel_vpc_project_v2" "project_1" {
  name = "testProject"
}

resource "selectel_iam_serviceuser_v1" "serviceuser_1" {
  name     = "tf"
  password = "1qaz!QAZ"
  role {
    role_name  = "member"
    scope      = "project"
    project_id = selectel_vpc_project_v2.project_1.id
  }
}
