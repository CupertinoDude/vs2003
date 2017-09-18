<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/configheader.inc" -->

<h4>How Do I... Write client configuration files?</h4>

In addition to supporting access to configuration settings from within an ASP.NET Web Application Server,
the ASP.NET configuration system also enables client-side exe applications to obtain access to
configuration data at runtime.

The API you do this through - <b>System.Web.Configuration.ConfigurationSettings</b> - is the same
as that for Web scenarios.  There are, however, four differences:

<ol>
    <li>The root configuration file for client side exe configuration access -- Machine.config
    --  is the same as that for Web scenarios.  However, the application-specific configuration
    data is not stored in files named Web.Config, but rather in XML text files whose name
    matches the host exe that launched the client process (note that the file format is identical
    to Web.Config).

    <p>
    For example, a client exe "MySample.exe" would store its application-specific configuration data
    within the MySample.exe.config file stored in the same directory as the launching exe.  Note
    that because the configuration file name matches the name of the client exe, it is possible
    to store multiple exe applications (along with their appropriate configuration data)
    within the same file system directory.

    <p>
    <li>Client-side exes can only store configuration data in one of two files: Machine.config
    and the application-specific configuration data file (for example, MySample.exe.config).  The ASP.NET
    configuration system will not examine sub-directories beneath the .exe for configuration data.
    Nor will it look at any parent directory configuration.

    <p>
    For example, here is the configuration resolution path mentioned for the above MySample.exe:

    <div class="code"><pre>
    C:\Program Files\Microsoft .NET Framework 2.0\Machine.config	<= Base Configuration Settings for Machine
    D:\MyApplication\MySample.exe.config	   	<= Overriden by Application Config Settings
    </div></pre>

    <li>The location tag directive is not enabled or used for client exe scenarios.  This is only
    available for use in Web application scenarios.

    <p>
    <li>Changes to the originating configuration file are not automatically picked up by the ASP.NET
    configuration system.  Instead, a client exe must stop and re-launch the exe application in
    order for changes to the configuration files to take effect.
</ol>


<p>
For more information on the configuration file format, see
the <a href="/quickstart/aspplus/default.aspx?url=/quickstart/aspplus/doc/configformat.aspx">
ASP.NET Configuration File Format</a> pages.

<p>
For information on retrieving configuration
information, refer to the ASP.NET section on <a href="/quickstart/aspplus/default.aspx?url=/quickstart/aspplus/doc/configretrieve.aspx">
Retrieving Configuration Information</a>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->