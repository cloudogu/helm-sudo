#! /bin/bash
HELM_SUDO_PROMPT_VAL=false

if [ -z "$HELM_PLUGINS" ]; then
    HELM_PLUGINS=$(helm env | grep "HELM_PLUGINS" | cut -d '"' -f 2)
fi
VERSION="$(cat ${HELM_PLUGINS}/helm-sudo/plugin.yaml | grep "version" | cut -d '"' -f 2)"

echo "Installing helm-sudo v${VERSION} ..."

echo 
echo "helm-sudo ${VERSION} is installed."
echo "See https://github.com/cloudogu/helm-sudo for help getting started!"