# Only IPv4 Example

This example shows overriding record_types and only setting A records pointing to an S3 bucket.

```hcl
module "alias" {
  source               = "mediapop/route53-alias/aws"
  alias_hosted_zone_id = aws_s3_bucket.bucket.hosted_zone_id
  alias_domain_name    = aws_s3_bucket.bucket.bucket_domain_name

  record_types = ["A"]

  domains = {
    "uatdomains.com." = [
      "terraform-aws-route53-alias-ipv4.uatdomains.com",
    ]
  }
}
```
