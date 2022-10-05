FROM centos:7

RUN rpm --rebuilddb \
  && yum install -y epel-release \
  && rpm -Uvh --replacepkgs https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
  && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN yum install -y \
    gcc make \
    httpd httpd-devel pcre-devel mod_ssl mod_ldap \
    php55w php55w-pear php55w-devel \
    php55w-mysql php55w-mbstring php55w-pecl-memcache php55w-gd

RUN rm -rf /var/cache/yum/* \
  && yum clean all

# To use custom Apache configuration, in your Dockerfile, mount /etc/httpd/conf, /etc/httpd/conf.d and /etc/httpd/ssl as volumes.
# To custom PHP configuration, in your Dockerfile, copy the custom php.ini file to /etc/php.ini and/or mount /etc/php.d as a volume.

EXPOSE 80 443

#CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
