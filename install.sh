#! /bin/bash -e

# currently does nothing -> install installs it on its own and just runs the shell script
# but updating could be: clone the git repo again, because we only call: helm plugin update helm-sudo
if [ -z "$HELM_PLUGINS" ]; then
    HELM_PLUGINS=$(helm env | grep "HELM_PLUGINS" | cut -d '"' -f 2)
fi
cd 
VERSION="$(cat ${HELM_PLUGINS}/helm-sudo/plugin.yaml | grep "version" | cut -d '"' -f 2)"

echo "Installing helm-sudo v${VERSION} ..."
echo "helm-sudo ${VERSION} is installed."
echo
echo "See https://github.com/cloudogu/helm-sudo for help getting started.."