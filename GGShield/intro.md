<br>

Welcome to a tutorial on ggshield (a GitGuardian tool) by Allan and Jun for the KTH Devops Course DD2482. 

What is Semgrep? From their website:

"semgrep or Semgrep CLI is a free open-source static code analysis tool developed by Semgrep Inc. (formerly r2c) and open-source contributors. It has stable support for C#, Go, Java, JavaScript, JSON, Python, PHP, Ruby, and Scala.

Semgrep is a fast, open source, static analysis engine for finding bugs, detecting dependency vulnerabilities, and enforcing code standards.

Semgrep analyzes code locally on your computer or in your build environment: code is never uploaded.

Its rules look like the code you already write; no abstract syntax trees, regex wrestling, or painful DSLs."

## Tutorial
We'll focus on using Semgrep, a lightweight static analysis tool. It can also be used in a CI/CD environment as a Docker image, but we'll be mainly examining how to use it in the command line to better understand what it is doing.

## DevOps Perspective
Semgrep is actively being developed, and Dockerfile and YAML are marked as languages being experimented with. This means there is some level of support, but many bugs will be present. They are actively looking for support! In any case, Semgrep also having the ability to be used as a Docker image helps you create more secure applications through automated static analysis scanning alongside the scanning of your pipeline files in the near future, given successful ongoing development!
