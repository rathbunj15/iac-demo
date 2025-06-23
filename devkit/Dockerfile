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

WORKDIR /iac-demo

COPY devkit/entrypoint.sh entrypoint.sh

# Make the entrypoint executable, then install the AWS CLI, Terraform, Anisble, 
# and Helm.
RUN chmod +x entrypoint.sh \
    && yum update \
    && yum -y install \
        yum-utils \
        shadow-utils \
    && yum-config-manager --add-repo \
        https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo \
    && yum -y install \
        terraform \
        helm \
        ansible \
    && yum clean all

ENTRYPOINT ["./entrypoint.sh"]

CMD ["/bin/bash"]