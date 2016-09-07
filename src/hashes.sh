#!/bin/bash

directory="linux"
if [ "$(uname)" == "Darwin" ]; then
    directory="macosx"
fi
directory="$(dirname "${BASH_SOURCE}")/${directory}"

if [ ! -f "${directory}/${1}.sh" ]; then
    (>&2 echo "Hash '${1}' not supported.")
    return 50
fi

source "${directory}/${1}.sh" "${@:2}"
