output "tenant_id" {
  value = selectel_vpc_project_v2.project_1.id
}

output "user_name" {
  value = selectel_iam_serviceuser_v1.serviceuser_1.name
}

output "password" {
  value = selectel_iam_serviceuser_v1.serviceuser_1.password
}
