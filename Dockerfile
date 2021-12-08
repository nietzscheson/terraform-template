FROM python:3.10

RUN pip3 install awscli --upgrade --user --no-warn-script-location

RUN cp /root/.local/bin/aws /usr/bin/aws && chmod -R a+w /usr/bin/aws

ARG TERRAFORM_VERSION=0.12.19

ENV TERRAFORM_VERSION=$TERRAFORM_VERSION

RUN cd /usr/local/bin && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

