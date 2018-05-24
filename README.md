# Terraform Route53 alias
*This terraform module is maintained by [Media Pop](https://www.mediapop.co), a software consultancy. Hire us to solve your DevOps challenges.*

Terraform module to simplify creating aliased A (IPv4) and AAAA (IPv6) records across a list of records.

# Usage

```hcl
module "route53-alias" {
  source = "mediapop/terraform-route53-alias"
  zone_name = "mediapop.co."
  zone_records = ["mediapop.co", "www.mediapop.co"]
  alias_hosted_zone_id = "${aws_cloudfront_distribution.cloudfront.hosted_zone_id}"
  alias_domain_name = "${aws_cloudfront_distribution.cloudfront.domain_name}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| zone_name | The Route53 zone name | string | - | yes |
| zone_records | The records to create | list | - | yes |
| alias_hosted_zone_id | The zone_id to target | string | - | yes |
| alias_domain_name | The domain name to target | string | - | yes |
| records | What records types to bind. Defaults to both | list | \["A", "AAAA"] | no |

## License

MIT
