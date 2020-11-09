# 1.2.0

This role now requires terraform 0.13 syntax. It has also been updated to internally use a module per zone which will cause records to be recreated.

BREAKING:

* Now requires terraform => 0.13 to function.

# 1.1.0

BREAKING

* `domains` replaces `zone_name` and `zone_records` enabling us to set records across many zones.

# 1.0.0

Initial Release
