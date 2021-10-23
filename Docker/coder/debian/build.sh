#!/usr/bin/env bash
#
# build.sh
#
# Dependencies: docker
# 
# Description: Builds the vapurrmaid/coder image defined in Dockerfile

set -euox pipefail

docker build -t vapurrmaid/coder:latest .
docker push vapurrmaid/coder:latest
