#!/bin/bash

case "${1}" in
    "-t")
        echo -n "${2}" | shasum -a 1 | cut -d" " -f1
        ;;

    "-f")
        shasum -a 1 "${2}" | cut -d" " -f1
        ;;

    *)
        (>&2 echo "Unrecognised parameter '${1}'.")
        return 100
esac
