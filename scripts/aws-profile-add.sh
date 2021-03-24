#!/usr/bin/env bash

mkdir -p ~/.aws

cat << EOF >> ~/.aws/config
[profile $1]
source_profile=default
role_arn=$2

EOF
