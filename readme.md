Пример конфигурации Kubernetes сервера на платформе Selectel

Для работы необходимо добавить данные

```hcl
provider "selectel" {
  domain_name = ""  # номер аккаунта
  username    = "" # Данные к тех аккаунту Selectel
  password    = ""
}

provider "openstack" {
  auth_url    = "https://cloud.api.selcloud.ru/identity/v3"
  domain_name = "" # номер аккаунта
  tenant_id   = selectel_vpc_project_v2.project_1.id
  user_name   = selectel_iam_serviceuser_v1.serviceuser_1.name
  password    = selectel_iam_serviceuser_v1.serviceuser_1.password
  region      = "ru-7"
}
```