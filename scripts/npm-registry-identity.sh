#!/usr/bin/env bash

cat << EOF >> ~/.npmrc
//${1}/:_authToken=${2}
EOF
