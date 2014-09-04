Splunk installation with forwarder
==============

This vagrant box will start up a splunk server that acts as a indexer and search head.

On this server Splunk On Splunk and the Splunk App for Unix and Linux will is installed.

It will also create a splunk forwarder vm.

The forwarder has the Splunk add on for Unix and Linux installed.

It also has an Apache HTTP installed and a simple load generation script for generating access logs.

Before starting this box you have to download splunk and the splunk forwarder yourself. As the splunk RPMs are not bundled with this box.

Go to http://www.splunk.com/download and choose the 64bit Linux RPM

The rpms is to be saved in the ../rpms dir.

For the addtional apps you have to download them as well and save the *.tgz files into the ../apps dir.
- Splunk On Splunk app: http://apps.splunk.com/app/748/
- Sideview Utils app: http://apps.splunk.com/app/466/
- Splunk App for Unix and Linux: http://apps.splunk.com/app/273/
- Splunk add on for Unix and Linux: https://apps.splunk.com/app/833/

Once all of these are installed you also have to update the name of the files in Vagrantfile.

After that you can start your box by running vagrant up

Splunk will automatically be started and you can reach it via https://localhost:8000

You can login to splunk using username admin and password admin.

You should see data coming in from the forwarder. Try the following search: index=os host=forwarder source=/var/log/httpd/access_log