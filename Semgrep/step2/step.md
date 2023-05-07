
> Semgrep has a default ruleset we can use. "Rulesets are rules related through a programming language, OWASP category, or framework." - Semgrep.

### Use Semgrep
Let's use Semgrep on repository we downloaded.

`cd /root/juice-shop`{{exec}}

Run the recommended Semgrep Registry rules:
`semgrep --config=auto`{{exec}}

Be patient! It can take roughly two minutes to scan the large amount of files in the juice-shop project.

Once the scan is done, be sure to scroll through the warnings that appear. Notice that recommendations of all kinds appear, including suggestions regarding encrpytion, secrets in code, insecure methods, and vulnerable strategies for user input. Because of the lightweight nature, one thing to note is there is not necessarily a severity score or level for each of the warnings. All in all, very nice!