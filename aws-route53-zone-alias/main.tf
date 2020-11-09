data "aws_route53_zone" "zone" {
  name = var.zone
}

resource "aws_route53_record" "record" {
  count = length(local.mappings)

  zone_id = data.aws_route53_zone.zone.id

  name = local.mappings[count.index]["host"]
  type = local.mappings[count.index]["type"]

  alias {
    name                   = var.alias_domain_name
    zone_id                = var.alias_hosted_zone_id
    evaluate_target_health = false
  }
}
