
> Let's get to know the Killercoda interface. We'll want to use the editor, since GitGuardian's ggshield will help us examine our code for any hardcoded secrets. The editor has both a screen to examine code and a terminal. Sweet!

### Install Sempgrep
In the terminal, go ahead and install Semgrep:
`python3 -m pip install semgrep`{{exec}}

We can confirm installation by running:
`semgrep --version`{{exec}}

Run the recommended Semgrep Registry rules:
`semgrep --config=auto`{{exec}}

If you'd like to explore Semgrep:
`semgrep --help`{{exec}}

-----

The Semgrep community has offered some example vulnerable repositories we can test. Let's download "juice-shop", a vulnerable Node.js + Express app:

`git clone https://github.com/bkimminich/juice-shop`{{exec}}