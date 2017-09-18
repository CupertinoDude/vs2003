
======
README
======

Last Updated: 06/11/2002

INSTALLING THE QUICKSTARTS

To install the Quickstarts open:

   Start > Programs > Microsoft .NET Framework SDK v1.1 > Samples and Quickstart Tutorials


PRINTING THE QUICKSTARTS

To print the QuickStart topics, click the "Hide TOC" link on the main 
navigation menu, then right-click the topic body and choose "Print".  The 
Quickstarts should print nicely in either "Portrait" or "Landscape" mode.

HOSTING THE QUICKSTARTS ONLINE (MIXED MODE)

The Quickstart samples are intended to be installed and run from your 
local machine.  If you are running Windows 2000 you will be able 
to read the documentation from your local machine as well.  If you are 
running NT 4.0 you should read the documentation from a remote server 
that is running the Quickstarts on Windows 2000.  In this case, you will 
be able to run Windows Forms and console samples locally but ASP.NET pages 
will run from the remote server -- this is called "mixed mode".

Mircosoft hosts the Quickstart samples at the following remote server for your
convenience:  

    http://go.microsoft.com/fwlink/?linkid=516&clcid=0x409

You may also set up your own remote server for your organization, by 
following the instructions below.

A. Configuring the Server

You will need to edit the security settings for each virtual directory in 
the quickstart to grant access to machines other than "localhost" (the local 
machine). To do this: 

- Start the Internet Services Manager by choosing Start->Run and typing 
  "inetmgr". 
- Expand the "Default Web Site" item in the left-side tree. 
- Right-click the "quickstart" virtual directory, and choose "Properties". 
- Select the "Directory Security" tab and edit the "IP address and domain 
  name restrictions." 
- Add the machines you wish to grant access, or grant access to all machines. 

Note: By granting access to remote machines you may be compromising the 
security of your web server.  Only provide access to those IPs whom you trust.

B. Configuring the Client

When reading the quickstart documentation from a remote server, you must 
configure the Quickstart to spawn the samples on your local machine.  Choose 
the "Configure Installation" link on the Quickstart home page or navigate to 
/quickstart/setup.aspx directly.  This step is not necessary if you are 
reading the documentation from your local machine.

HOSTING THE QUICKSTARTS ONLINE (REMOTE-ONLY MODE)

Mixed mode (above) assumes that you always have a local copy of the samples, 
even if you are reading the documentation online.  This allows Windows Forms 
and console samples to be run from the local client machine, since they cannot 
be run remotely.  However, you may not want to require the client to install 
the samples, and so the quickstart supports a remote-only mode where the 
samples are always run online.  To enable remote-only mode, make the 
following configuration settings in the web.config file at the /quickstart 
root directory: 

  <appsettings>
    <add key="RemoteHost" value="true" />
  </appsettings>

This has the effect of downgrading samples which cannot be run from the Web 
to "View Source" only. 

MANUALLY BUILDING THE QUICKSTARTS

By default, the Quickstart samples are already built when you install them 
to your machine.  However, if you modify and want to rebuild any of the samples
you may do so by following these two steps:

1.  Set the NETSAMPLEPATH environment variable to the parent directory of the 
Quickstarts, for example:

  > set NETSAMPLEPATH=C:\Program Files\Microsoft.Net\SDK\v1.1

2. Build the samples using NMAKE.  You can type "nmake clean" from anywhere
in the Quickstart directory tree to recursively build the samples at or 
below that location.

NOTE: You may need to put the SDK tools on your path for the NMAKE build
to work properly.  The SDK tools are located in the directory:

  %WINDIR%\Microsoft.Net\Framework\<version_dir>

IV.  Feedback

Send feedback and future sample suggestions to:  "qswish@microsoft.com"