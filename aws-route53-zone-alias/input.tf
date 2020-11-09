variable "zone" {
  type        = string
  description = "A zone."
}

variable "hosts" {
  type        = set(string)
  description = "A set of hosts."
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
}

locals {
  mappings = flatten([
    for record_type in var.record_types : [
      for host in var.hosts : {
        type = record_type,
        host = host
      }
    ]
  ])
}
