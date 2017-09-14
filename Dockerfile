FROM fedora:26
COPY bdcs-ghc.repo /etc/yum.repos.d/
COPY filelist.txt /root/
RUN dnf -y install $(cat /root/filelist.txt) && dnf clean all

# Switch to user specified by LOCAL_USERNAME LOCAL_UID env variables
# Depends on bash, useradd, and sudo
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
