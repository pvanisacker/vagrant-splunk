vagrant-splunk
==============

This is a collection of vagrant configuration files for VirtualBox instances running different Splunk setups.

The purpose of them is to allow you to easily get started with Splunk.

Currently the following boxes exist
- splunk-standalone: simple splunk installation on one host
- splunk-with-forwarder: splunk installation on one host, splunk forwarder on another host
- splunk-cluster: splunk cluster configuration with 3 slaves, 1 master and 1 searchhead
- splunk-cluster-with-forwarder: same as above but with one forwarder
- splunk-searchheadpool-cluster: splunk search head pool with one splunk cluster
- splunk-searchheadpool-cluster-with-forwarder: splunk search head pool with one splunk cluster and a forwarder

You cannot run all of these at same time as there will be name collisions in VM names.

And you'll need quite a bit of RAM memory to run some of the more advanced setups.
