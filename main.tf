module "zone_alias" {
  for_each             = var.domains
  source               = "./aws-route53-zone-alias"
  alias_domain_name    = var.alias_domain_name
  alias_hosted_zone_id = var.alias_hosted_zone_id
  zone                 = each.key
  hosts                = each.value
  record_types         = var.record_types
}
