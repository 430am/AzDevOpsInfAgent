#!/bin/bash
docker build -t azdevops-infra-agent --build-arg VCS_REF="git rev-parse --short HEAD" .
docker tag azdevops-infra-agent
docker push jacklwade/azdevops-infra-agent