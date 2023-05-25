# Killercoda

A set of tutorial on Killercoda. Killercoda has nice series of tutorial projects on their website to reference, but creating a project is all implied.

The root folder contains the most important file, index.json. An example is below
```
{
  "title": "Kube-Monkey",
  "description": "Experimenting with Kube-Monkey",
  "details": {
    "intro": {
      "text": "intro.md",
      "foreground": "foreground.sh",
      "background": "background.sh"
    },
    "steps": [
      {
        "title": "Installation",
        "text": "step1/step.md",
        "verify": "step1/verify.sh"
      }
    ],
    "finish": {
      "text": "finish.md"
    }
  },
  "backend": {
    "imageid": "kubernetes-kubeadm-1node"
  }
}
```

You can organize the intro, steps, and finish (concluding step) into folders as you please, just update the file path. This helps as each step can include subfiles such as images and a verify.sh, which can be used to make sure a user is properly following along with a tutorial.

Any file not listed in index.json or not a dependecy for any of the files for the project won't appear anywhere on your Killercoda tutorial.

To upload your tutorial, link your Killercoda account to the Github repo where your project folder lives. The project folder name is important, as it defines the project name as is shown when browsing through projects.