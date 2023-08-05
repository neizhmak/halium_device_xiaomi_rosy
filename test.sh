#!/usr/bin/env bash

if [ -z "${CI}" ] && ([ -e /.dockerenv ] || [ -e /run/.containerenv ]); then
    IS_CONTAINER="true"
    echo "Ok"
fi

if [ -z "${CI}" ]; then
    echo "Ok-0.5"
fi

if [ "${IS_CONTAINER}" == "true" ]; then
    COMMIT=$(git rev-parse HEAD)
    echo $COMMIT
else
    echo "Bad"
fi
