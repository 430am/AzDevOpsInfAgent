FROM microsoft/vsts-agent:latest

LABEL org.label-schema.name="Azure DevOps Agent with Infrastructure Tools" \
    org.label-schema.schema-version="0.1"

ENV TERRAFORM_VERSION 0.11.10
ENV PACKER_VERSION 1.3.2
ENV ANSIBLE_VERSION 2.7.0

# Install Packer
RUN echo "Installing Packer ${PACKER_VERSION} ..." \
    && wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
    && unzip packer_${PACKER_VERSION}_linux_amd64.zip \
    && mv packer /usr/local/bin/packer \
    && rm packer_${PACKER_VERSION}_linux_amd64.zip

# Install Terraform
RUN echo "Installing Terraform ${TERRAFORM_VERSION} ..." \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin/terraform \
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Install Ansible
RUN echo "Installing Ansible ${ANSIBLE_VERSION} ..." \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ansible \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Adding hosts for convenience..." \
    && mkdir -p /etc/ansible \
    && echo 'localhost' > /etc/ansible/hosts
