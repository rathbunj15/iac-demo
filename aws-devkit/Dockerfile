FROM ubuntu:24.04

LABEL maintainer=rathbunj15

USER root

WORKDIR /root

COPY entrypoint.sh entrypoint.sh

RUN apt-get update -y \
    && apt-get install -y \
        unzip \
        curl \
    && curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip \
    && unzip -d /tmp /tmp/awscliv2.zip \
    && /tmp/aws/install \
    && chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD ["/bin/bash"]