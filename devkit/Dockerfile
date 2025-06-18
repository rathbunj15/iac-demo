# Copyright (©) 2025 rathbunj15 <rathbunj15@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

FROM amazon/aws-cli:2.27.37

LABEL maintainer=rathbunj15

USER root

WORKDIR /root

COPY entrypoint.sh entrypoint.sh

# Make the entrypoint executable, then install the AWS CLI, Terraform, Anisble, 
# and Helm.
RUN chmod +x entrypoint.sh \
    && yum update \
    && yum install -y \
        apt-transport-https \
        curl \
        gpg \
        unzip \
    && curl https://apt.releases.hashicorp.com/gpg \ 
        | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" \
        | tee /etc/apt/sources.list.d/hashicorp.list \
    && curl https://baltocdn.com/helm/signing.asc | gpg --dearmor \
        | tee /usr/share/keyrings/helm.gpg > /dev/null \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" \ 
        | tee /etc/apt/sources.list.d/helm-stable-debian.list \
    && yum update \
    && yum install -y \
        ansible \
        helm \
        terraform \ 
    && yum clean

ENTRYPOINT ["./entrypoint.sh"]

CMD ["/bin/bash"]