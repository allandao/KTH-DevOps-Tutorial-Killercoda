
> Given that Semgrep can be used as Docker image, this means you can use it in your CI/CD environments quite easily! If you are a DevOps engineer, this would be a great way to easily scan your code without needing to manually run semgrep.


### Try Semgrep as a Docker image
This is also helpful if you don't have Semgrep installed.

`cd /root/`{{exec}}

`docker run --rm -v "$(pwd)/juice-shop:/src" returntocorp/semgrep semgrep --config p/security-audit /src`{{exec}}

Again, very nice! Make sure to note what the differences are, if any, when you had used the semgrep cli.