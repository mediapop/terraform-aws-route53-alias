data "aws_route53_zone" "zone" {
  count = length(local.zones)
  name  = local.zones[count.index]
}

resource "aws_route53_record" "record" {
  count = length(local.records) * length(var.record_types)

  // We lookup the zone name from the record, then the zone_id from zone_name
  zone_id = element(matchkeys(
    data.aws_route53_zone.zone.*.id,
    data.aws_route53_zone.zone.*.name,
    local.record_map[element(local.records, floor(count.index / local.type_count))]
  ), 0)

  name = element(local.records, floor(count.index / local.type_count))
  type = element(var.record_types, count.index % local.type_count)

  alias {
    name                   = var.alias_domain_name
    zone_id                = var.alias_hosted_zone_id
    evaluate_target_health = false
  }
}
