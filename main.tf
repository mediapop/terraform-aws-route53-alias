data "aws_route53_zone" "zone" {
  name = "${var.zone_name}"
}

resource "aws_route53_record" "record" {
  count = "${length(var.zone_records) * length(var.records)}"
  zone_id = "${data.aws_route53_zone.zone.zone_id}"
  name = "${element(var.zone_records, floor(count.index / 2))}"
  type = "${element(var.records, count.index % length(var.records))}"

  alias {
    name = "${var.alias_domain_name}"
    zone_id = "${var.alias_hosted_zone_id}"
    evaluate_target_health = false
  }
}
