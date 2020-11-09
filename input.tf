variable "domains" {
  type        = map(list(string))
  description = "A map {\"zone.com.\" = [\"zone.com\",\"www.zone.com\"],\"foo.com\" = [\"foo.com\"] } of domains."
}

variable "alias_hosted_zone_id" {
  description = "The hosted_zone_id to alias"
}

variable "alias_domain_name" {
  description = "The domain_name on the hosted_zone_id to alias"
}

variable "record_types" {
  type        = list(string)
  description = "The types of records to set. Default is A and AAAA"

  default = [
    "A",
    "AAAA",
  ]
}
