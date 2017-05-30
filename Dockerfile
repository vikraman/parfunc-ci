FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install puppet
RUN puppet module install rtyler/jenkins

ADD scripts/   /usr/local/bin/
ADD manifests/ /etc/puppet/manifests/

RUN puppet apply -v /etc/puppet/manifests/site.pp

EXPOSE 8080
ENTRYPOINT entrypoint.sh
