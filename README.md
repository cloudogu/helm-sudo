# helm-sudo plugin

A [helm](https://helm.sh) plugin that uses impersonating to execute helm-commands on clusters within the admin context.

<img src="https://raw.githubusercontent.com/wiki/cloudogu/helm-sudo/helm-sudo-demo.gif" alt="Demo gif" width="618" height="286"> 



For questions or suggestions you are welcome to join us at our myCloudogu [community forum](https://community.cloudogu.com/c/kubernetes/54).

[![Discuss it on myCloudogu](https://static.cloudogu.com/static/images/discuss-it.png)](https://community.cloudogu.com/c/kubernetes/54)

## Installation

Install the plugin using the built-in plugin manager (see [releases](https://github.com/cloudogu/helm-sudo/releases)  for latest version):

```
# Installs latest commit
helm plugin install https://github.com/cloudogu/helm-sudo
# Installs deterministic version
helm plugin install  https://github.com/cloudogu/helm-sudo --version=0.0.2
``` 

---

## Usage

Its usage is pretty simple, just use "sudo" on your helm commands like so:

```
helm sudo list 
```

what the plugin does is, it adds the --kube-as-user and --kube-as-group flags with your user ($USER) and system:masters group to the given helm command. 

So the plugin executes the following: 

```
helm --kube-as-user $USER --kube-as-group system:masters list
```

Flags will just be passed along to the command you are calling. 

**CAUTION: Due to the usage of this plugin, you will execute the helm command as admin on your cluster!**

Syntax completion works with helm version 3.8.0 and up.

---

## Configuration

| ENV_VAR  	|   Default	|   Description	|   
|---	|---	|---	|
|HELM_SUDO_PROMPT|   	false |   If set to true you will be prompted to acknowledge the usage of the helm-command on the current context as admin	|


## Similar projects
* [postfinance/kubectl-sudo](https://github.com/postfinance/kubectl-sudo): Same functionality as helm-sudo for kubectl
* [cloudogu/sudo-kubeconfig](https://github.com/cloudogu/sudo-kubeconfig): Create a sudo kubeconfig for your current kubernetes context.
