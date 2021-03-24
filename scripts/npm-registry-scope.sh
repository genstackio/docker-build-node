#!/usr/bin/env bash

cat << EOF >> ~/.npmrc
@${1}:registry=https://${2}
EOF
