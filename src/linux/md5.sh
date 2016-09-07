#!/bin/bash

case "${1}" in
    "-t")
        echo -n "${2}" | md5sum | cut -d" " -f1
        ;;

    "-f")
        md5sum "${2}" | cut -d" " -f1
        ;;

    *)
        (>&2 echo "Unrecognised parameter '${1}'.")
        return 100
esac
