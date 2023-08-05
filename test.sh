#!/bin/bash

if [ -z "${CI}" ] && ([ -e /.dockerenv ] || [ -e /run/.containerenv ]); then
	IS_CONTAINER="true"
fi

if [ "${IS_CONTAINER}" == "true" ]; then
	COMMIT=$(git rev-parse HEAD)
  echo $COMMIT
else
  echo "Bad"
fi
