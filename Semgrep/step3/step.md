
> Given that Semgrep can be used as Docker image, this means you can use it in your CI/CD environments quite easily! If you are a DevOps engineer, this would be a great way to easily scan your code without needing to manually run Semgrep. There is also the Semgrep CI for this more specific purpose (and also makes it easier to do third-party OSS scanning) as well as the Semgrep Cloud Platform for potentially easier integration and issue tracking.


### Try Semgrep as a Docker image
This is also helpful if you don't have or don't want Semgrep installed.

We want to be in juice-shop's parent folder:
`cd /root/`{{exec}}

Download and run the Docker image:
`docker run --rm -v "$(pwd)/juice-shop:/src" returntocorp/semgrep semgrep --config p/security-audit /src`{{exec}}

Again, very nice! Make sure to note the difference when you had used the semgrep cli. What are they? In all fairness, this is a bit of a trick question, as we ran this with the flag `--config p/security-audit` instead of `--config auto`. From our tests, the Docker image is significantly slower with the latter; we recommend installing the Semgrep cli.