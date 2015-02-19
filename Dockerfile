###
#
# A simple base image for installing the mongodb-mms-backup-agent
#
###
FROM debian:wheezy
MAINTAINER Kingsquare <docker@kingsquare.nl>

####
# Install prequisites + cleanup
RUN apt-get update && \
	apt-get install -y curl logrotate && \
	apt-get clean && \
	apt-get autoremove --purge && \
	rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

ONBUILD ADD resources/ /

####
# Make sure the app is configured correctly
ENTRYPOINT ["/configure.sh"]