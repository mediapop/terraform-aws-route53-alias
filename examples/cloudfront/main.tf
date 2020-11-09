provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_cloudfront_distribution" "redirect" {
  origin {
    domain_name = "terraform-aws-route53-alias.uatdomains.com"
    origin_id   = "website"

    custom_origin_config {
      origin_protocol_policy = "http-only"
      http_port              = "80"
      https_port             = "443"

      origin_ssl_protocols = [
        "TLSv1",
      ]
    }
  }

  enabled         = true
  is_ipv6_enabled = true

  default_cache_behavior {
    allowed_methods = [
      "HEAD",
      "GET",
    ]

    cached_methods = [
      "HEAD",
      "GET",
    ]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    default_ttl            = 0
    max_ttl                = 0
    min_ttl                = 0
    target_origin_id       = "website"
    viewer_protocol_policy = "allow-all"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

module "alias" {
  source               = "../../"
  alias_hosted_zone_id = aws_cloudfront_distribution.redirect.hosted_zone_id
  alias_domain_name    = aws_cloudfront_distribution.redirect.domain_name

  domains = {
    "uatdomains.com." = [
      "terraform-aws-route53-alias.uatdomains.com",
    ]
  }
}
