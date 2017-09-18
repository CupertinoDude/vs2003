
<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Configuration Overview</span>
<p>
A central requirement of any Web application server is a rich and flexible configuration system--one that enables developers to easily associate settings with an installable application (without
having to "bake" values into code) and enables administrators to easily customize these values
post-deployment.  The ASP.NET configuration system has been designed to meet the needs of both of
these audiences; it provides a hierarchical configuration infrastructure that enables extensible
configuration data to be defined and used throughout an application, site, and/or machine.  It has
the following qualities that make it uniquely suited to building and maintaining Web applications:
</p>
<ul>
<li>ASP.NET allows configuration settings to be stored together with static content, dynamic pages,
and business objects within a single application directory hierarchy.  A user or administrator
simply needs to copy a single directory tree to set up an ASP.NET Framework application on a machine.
<p>

<li>Configuration data is stored in plain text files that are both human-readable and
human-writable.  Administrators and developers can use any standard text editor, XML parser,
or scripting language to interpret and update configuration settings.
<p>

<li>ASP.NET provides an extensible configuration infrastructure that enables third-party developers
to store their own configuration settings, define the persistence format of their own configuration
settings, intelligently participate in their processing, and control the resulting object
model through which those settings are ultimately exposed.
<p>

<li>Changes to ASP.NET configuration files are automatically detected by the system and are applied
without requiring any user intervention (in other words, an administrator does not need to restart
the Web server or reboot the machine for them to take effect).
<p>

<li>Configuration sections can be locked down when using the <b>&lt;location&gt;</b> tag and the <b>allowOverride</b> attribute.
</ul>

<p>
To learn more about the ASP.NET configuration system and how it works, see 
<a href="configformat.aspx">Configuration File Format</a> and <a href="configretrieve.aspx">Retrieving Configuration</a>.

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->