# plugin-template-policies

# Policy for template example

## Requirements

Install [opa](https://www.openpolicyagent.org/docs/latest/#running-opa) for testing & building the bundles.

## Testing


```shell
opa test policies
```

## Bundling

Policies are built into bundle to make distribution easier.

You can easily build the policies by running
```shell
opa build -b policies -o dist/bundle.tar.gz
```

## Releasing

These steps apply to repos created from this template; the template itself doesn't release.

- Releases come from release-please PRs: merging one tags `vX.Y.Z` and publishes the bundle.
- Release candidates (`vX.Y.Z-rcN`) come from the `cut-prerelease` workflow.
- If the repo already has releases, set `.release-please-manifest.json` to its current version
  (e.g. `{".": "1.2.3"}`) before the first release-please run.

## Running policies locally

```shell
opa eval -I -b policies -f pretty data.compliance_framework.local_ssh <<EOF
{
  "passwordauthentication": [
    "yes"
  ],
  "permitrootlogin": [
    "with-password"
  ],
  "pubkeyauthentication": [
    "no"
  ]
}
EOF
```

## Writing policies.

Policies are written in the [Rego](https://www.openpolicyagent.org/docs/latest/policy-language/) language.

```rego
package ssh.deny_password_auth

import future.keywords.in

violation[{
    "title": "Host SSH is using password authentication.",
    "description": "Host SSH should not use password, as this is insecure to brute force attacks from external sources.",
    "remarks": "Migrate to using SSH Public Keys, and switch off password authentication."
}] {
	"yes" in input.passwordauthentication
}
```
