# Modified from: https://github.com/ansible/ansible-runner/blob/stable/1.4.x/Dockerfile
# --nogpgcheck, is no bueno, but ironbank UBI8 derived ansible-runner is a step in the right direction
# Added openssl

FROM registry1.dso.mil/ironbank/redhat/ubi/ubi8:latest
USER root
# ^-- The image doesn't work without "USER root"
# I suspect it's why IB images aren't working

ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /bin/tini
ADD https://raw.githubusercontent.com/ansible/ansible-runner/stable/1.4.x/utils/entrypoint.sh /bin/entrypoint

# Install Ansible and Runner
ADD https://releases.ansible.com/ansible-runner/ansible-runner.el8.repo /etc/yum.repos.d/ansible-runner.repo
RUN dnf install -y --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
    dnf install -y --nogpgcheck http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/python3-ptyprocess-0.5.2-4.el8.noarch.rpm && \
    dnf install -y ansible-runner python3-pip sudo rsync openssh-clients sshpass glibc-langpack-en openssl && \
    alternatives --set python /usr/bin/python3 && \
    pip3 install ansible && \
    chmod +x /bin/tini /bin/entrypoint && \
    rm -rf /var/cache/dnf

# Kubernetes Helper Tools: kubectl, helm, pgo (CrunchyData PSQL Operator)
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.20.0/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash && \
    curl -LO https://github.com/CrunchyData/postgres-operator/releases/download/v4.5.1/pgo && \
    chmod +x ./pgo && \
    mv ./pgo /usr/local/bin/pgo

# In OpenShift, container will run as a random uid number and gid 0. Make sure things
# are writeable by the root group.
RUN mkdir -p /runner/inventory /runner/project /runner/artifacts /runner/.ansible/tmp && \
	chmod -R g+w /runner && chgrp -R root /runner && \
	chmod g+w /etc/passwd

VOLUME /runner/inventory
VOLUME /runner/project
VOLUME /runner/artifacts

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
ENV RUNNER_BASE_COMMAND=ansible-playbook
ENV HOME=/runner
ENV PS1="[\u@ibd-ansible-runner \W] # "

WORKDIR /runner

ENTRYPOINT ["entrypoint"]
CMD ["ansible-runner", "run", "/runner"]
