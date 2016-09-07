#!/bin/bash

case "${1}" in
    "-t")
        md5 -qs "${2}"
        ;;

    "-f")
        md5 -q "${2}"
        ;;

    *)
        (>&2 echo "Unrecognised parameter '${1}'.")
        return 100
esac
