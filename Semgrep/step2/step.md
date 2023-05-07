
> Semgrep has a default ruleset we can use. "Rulesets are rules related through a programming language, OWASP category, or framework." - Semgrep.

### Use Semgrep
Let's use Semgrep on repository we downloaded.

`cd /root/juice-shop`{{exec}}

Run the recommended Semgrep Registry rules:
`semgrep --config=auto`{{exec}}

Very nice! Be sure to scroll through the warnings that appear.