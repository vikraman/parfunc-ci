#!/bin/sh

/etc/init.d/jenkins start

exec tailf /var/log/jenkins/jenkins.log
