# Terraform Route53 alias
*This terraform module is maintained by [Media Pop](https://www.mediapop.co), a software consultancy. Hire us to solve your DevOps challenges.*

Terraform module to simplify creating aliased A (IPv4) and AAAA (IPv6) records across a list of records.

# Usage

```hcl
module "route53-alias" {
  source = "mediapop/route53-alias/aws"

  domains = {
    "mediapop.co." = ["www.mediapop.co"]
    "mediapop.sg." = ["mediapop.sg", "www.mediapop.sg"]
  }

  alias_hosted_zone_id = aws_cloudfront_distribution.cloudfront.hosted_zone_id
  alias_domain_name    = aws_cloudfront_distribution.cloudfront.domain_name
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domains | Map of zone names with records. | map | - | yes |
| alias_hosted_zone_id | The zone_id to target | string | - | yes |
| alias_domain_name | The domain name to target | string | - | yes |
| record_types | The record types | list | ["A", "AAAA"] | no |

## License

MIT
