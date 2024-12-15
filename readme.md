Пример конфигурации Nginx сервера на платформе Selectel

Для работы необходимо создать файл с следующими переменными
```
selectel_id                       = "12345"
selectel_serviceuser_name         = "username"
selectel_serviceuser_pass         = "password"
selectel_project_serviceuser_name = "username123"
selectel_project_serviceuser_pass = "password123"
```
Документация к ресурсам Selectel https://docs.selectel.ru/terraform/quickstart/ \

Способ вызова
```bash
terraform apply -var-file="terraform.tfvars"
```