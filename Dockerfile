FROM makayel/supervisor
MAINTAINER Michael Hatoum <michael@adaltas.com>

RUN yum -y install openssh openssh-server openssh-clients openssl-libs && \
    ssh-keygen -b 2048 -t rsa -f /etc/ssh/ssh_host_rsa_key -q -N '' && \
    mkdir -p /var/run/sshd && \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/UsePAM\syes/UsePAM no/' /etc/ssh/sshd_config && \
    sed -i 's/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config && \
    echo "root:root" | chpasswd && \
    echo '[program:sshd]' >> /etc/supervisor/conf.d/sshd.conf && \
    echo 'command=/usr/sbin/sshd -D' >> /etc/supervisor/conf.d/sshd.conf && \
    echo '' >> /etc/supervisor/conf.d/sshd.conf

EXPOSE 22

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
