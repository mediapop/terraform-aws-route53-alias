# Cloudfront Example

This example just shows how to bind a group of domains to a CloudFront distribution. The main usage is:

```hcl
module "alias" {
  source               = "../../"
  alias_hosted_zone_id = "${aws_cloudfront_distribution.redirect.hosted_zone_id}"
  alias_domain_name    = "${aws_cloudfront_distribution.redirect.domain_name}"

  domains = {
    "uatdomains.com." = [
      "terraform-aws-route53-alias.uatdomains.com",
    ]
  }
}
```