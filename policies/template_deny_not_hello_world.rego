# Ensure that json has "hello": "world" in it.
#
# METADATA
# title: Verifies that json has hello world
# description: Verifies that json has value "world" in the "hello" element.
# custom:
#   controls:
#     - None
#   schedule: "* * * * * *"
package compliance_framework.template.deny_not_hello_world

import future.keywords.in

violation[{
    "title": "Host SSH is using password authentication.",
    "description": "Host SSH should not use password, as this is insecure to brute force attacks from external sources.",
    "remarks": "Migrate to using SSH Public Keys, and switch off password authentication."
}] {
	not ("world" in hello)
}
