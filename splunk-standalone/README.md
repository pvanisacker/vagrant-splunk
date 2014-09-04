Standalone Splunk installation
==============

This vagrant box will start up a standalone splunk installation.

That means one server only that acts as an forwarder,indexer and search head.

It will install the Splunk On Splunk app and also the Splunk App for Unix and Linux.

Before starting this box you have to download splunk yourself. As the splunk RPM is not bundled with this box.

Go to http://www.splunk.com/download and choose the 64bit Linux RPM

The rpm is to be saved in the ../rpms dir.

For the addtional apps you have to download them as well and save the *.tgz files into the ../apps dir.
- Splunk On Splunk app: http://apps.splunk.com/app/748/
- Sideview Utils app: http://apps.splunk.com/app/466/
- Splunk App for Unix and Linux: http://apps.splunk.com/app/273/

Once all of these are installed you also have to update the name of the files in Vagrantfile.

After that you can start your box by running vagrant up

Splunk will automatically be started and you can reach it via https://localhost:8000

You can login to splunk using username admin and password admin.