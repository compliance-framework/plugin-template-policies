package compliance_framework.template.deny_not_hello_world

test_deny_hello_world {
	count(violation) == 0 with input as {
        "hello": "world"
    }
}

test_deny_hello_sun {
	count(violation) == 1 with input as {
        "hello": "sun"
    }
}
