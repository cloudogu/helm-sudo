#! /bin/bash

NEW_ARGS=""
COMMAND=""
CURRENT_CONTEXT=$(kubectl config current-context)
CURRENT_NAMESPACE=$(kubectl config view --minify | grep namespace | cut -d ':' -f 2 | sed 's/^[ \t]*//;s/[ \t]*$//')

HELM_SUDO_PROMPT=${HELM_SUDO_PROMPT:-false}
if [ "$HELM_SUDO_PROMPT" = true ]; then
    read -p "WARNING: Currently in context '${CURRENT_CONTEXT}' using namespace '${CURRENT_NAMESPACE:-"default"}'. Continue? (y/N) " -r -n 1 yn
    case $yn in
        [Yy]* ) ;;
        * ) exit 0;;
    esac
    echo 
fi

for arg in "$@"
do
    if [ ${arg} != "--"* ] && [ -z "${COMMAND}" ]; then
        COMMAND=${arg}
    fi
    NEW_ARGS="${NEW_ARGS} ${arg}"
done

helm --kube-as-user ${USER} --kube-as-group system:masters ${NEW_ARGS}