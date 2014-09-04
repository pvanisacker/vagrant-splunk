vagrant-splunk
==============

This is a collection of vagrant boxes.

The purpose of them is to allow you to easily get started with Splunk.

Currently the following boxes exist
- splunk-standalone: simple splunk installation on one host
- splunk-with-forwarder: splunk installation on one host, splunk forwarder on another host
- splunk-cluster: splunk cluster configuration with 3 slaves, 1 master and 1 searchhead
- splunk-cluster-with-forwarder: same as above but with one forwarder
- splunk-searchheadpool-cluster: splunk search head pool with one splunk cluster
- splunk-searchheadpool-cluster-with-forwarder: splunk search head pool with one splunk cluster
- splunk-searchheadpool-multi-cluster: splunk search head pool with two splunk cluster each with 2 slaves and one master
- splunk-searchheadpool-multi-cluster-with-forwarder: splunk search head pool with two splunk cluster each with 2 slaves and one master and 2 forwarders

You cannot run all of these at same time as there will be name collisions in VM names.
