variable "zone_records" {
  type = "list"
  description = "The records to bind"
}

variable "zone_name" {
  type = "string"
  description = "The route53 zone-id"
}

variable "alias_hosted_zone_id" {
  description = "The hosted_zone_id to alias"
}

variable "alias_domain_name" {
  description = "The domain_name on the hosted_zone_id to alias"
}

variable "records" {
  type = "list"
  description = "The types of records to set. Default is A and AAAA"
  default = [
    "A",
    "AAAA"
  ]
}
