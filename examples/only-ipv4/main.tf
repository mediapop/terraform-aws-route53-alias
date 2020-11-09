provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "bucket" {
  # TODO Why can't I use the bucket_regional_domain_name as the alias_domain_name?
  website {
    index_document = "index.html"
  }
}

module "alias" {
  source               = "../../"
  alias_hosted_zone_id = aws_s3_bucket.bucket.hosted_zone_id
  alias_domain_name    = aws_s3_bucket.bucket.website_domain

  record_types = ["A"]

  domains = {
    "uatdomains.com." = [
      "terraform-aws-route53-alias-ipv4.uatdomains.com",
    ]
  }
}
