Пример конфигурации Nginx сервера на платформе Selectel

Для работы необходимо добавить данные

```hcl
provider "selectel" {
  domain_name = ""  # Номер аккаунта
  username    = "" # Данные к тех аккаунту Selectel
  password    = ""
}

provider "openstack" {
  auth_url    = "https://cloud.api.selcloud.ru/identity/v3"
  domain_name = "" # Номер аккаунта
  tenant_id   = selectel_vpc_project_v2.project_1.id
  user_name   = selectel_iam_serviceuser_v1.serviceuser_1.name
  password    = selectel_iam_serviceuser_v1.serviceuser_1.password
  region      = "" # Пул
}

resource "selectel_vpc_project_v2" "project_1" {
  name = "" # Название проекта
}

resource "selectel_iam_serviceuser_v1" "serviceuser_1" {
  name     = "" # логин
  password = "" # пароль
  role {
    role_name  = "member"
    scope      = "project"
    project_id = selectel_vpc_project_v2.project_1.id
  }
}
```