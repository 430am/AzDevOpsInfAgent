Azure DevOps Infrastructure Agent Image
==========================

This repo contains 'Dockerfile' definitions for [jacklwade/azdevops-infra-agent](https://github.com/430am/AzDevOpsInfAgent) Docker images.

Docker image for Azure DevOps Agent with infrastructure tools installed
```
ENV TERRAFORM_VERSION 0.11.10
ENV PACKER_VERSION 1.3.2
ENV ANSIBLE_VERSION 2.7
```

## How to use the images
Azure DevOps (VSTS) agents must be started with account information, which is provided through environment variables:

- `VSTS_ACCOUNT`: the name of the Visual Studio account
- `VSTS_TOKEN`: a personal access token (PAT) for the Visual Studio account that has been given at least the **Agent Pools (read, manage)** scope.
- `VSTS_AGENT`: the name of the agent (default: `"$(hostname):`)
- `VSTS_POOL`: the name of the agent pool (default: `"Default"`)

To run the default Azure Devops agent image for a specific Visual Studio account:

```
docker run \
   -e VSTS_ACCOUNT=<name> \
   -e VSTS_TOKEN=<pat> \
   -e VSTS_AGENT='$(hostname)-agent' \
   -e VSTS_POOL=mypool \
   -it jacklwade/azdevops-infra-agent
```

## Notes
First version, based on work from 
