data "azuread_domains" "aad" {
    only_initial = true
}
resource "random_string" "special" {
  length  = 3
  special = true
  upper   = false
  lower   = false
  numeric = false
}
locals {
  domain_name = data.azuread_domains.aad.domains.0.domain_name
  users = csvdecode(file("users_info.csv"))
}
resource "azuread_user" "users" {
    for_each = {for user in local.users: user.first_name => user}
    user_principal_name = format("%s%s@%s",
    substr(each.value.first_name,0,1),
    lower(each.value.last_name),
    local.domain_name)

    password = format("%s%s%s%s!",
    lower(each.value.last_name),
    substr(lower(each.value.first_name),0,1),
    length(each.value.first_name),
    random_string.special.result)

    display_name = "${each.value.first_name} ${each.value.last_name}"

    force_password_change = true
    department = each.value.department
    job_title = each.value.job_title
}