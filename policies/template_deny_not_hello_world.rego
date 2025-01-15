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

violation[{
    "title": "Template check that hello == world.",
    "description": "Template check that hello == world.",
    "remarks": "Change hello to == world."
}] if {
	"world" != input.hello
}
