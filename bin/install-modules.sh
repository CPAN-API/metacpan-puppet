#!/bin/bash

# Brute force Puppet module upgrades

PUPPET="puppet module install --force --modulepath /etc/puppet/modules"

declare -a arr=("apt" "concat" "firewall" "java" "nginx" "nodejs" "postgresql" "stdlib" "vcsrepo")

for m in "${arr[@]}"
    do
        $PUPPET "puppetlabs-$m"
    done

$PUPPET puppet-archive # puppetlabs-java
$PUPPET elastic-elasticsearch
$PUPPET elastic-elastic_stack # elastic-logstash
$PUPPET puppet-tea # elastic-elasticsearch
$PUPPET richardc-datacat
$PUPPET ispavailability-file_concat
$PUPPET elastic-logstash
$PUPPET ssm-munin
$PUPPET saz-rsyslog
$PUPPET bashtoni-timezone
$PUPPET ceritsc-yum
$PUPPET puppet-logrotate