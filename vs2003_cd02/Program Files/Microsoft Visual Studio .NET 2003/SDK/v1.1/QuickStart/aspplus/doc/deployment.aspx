<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Deploying ASP.NET Applications</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#fslayout">File System Layout of ASP.NET Applications</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#resolvingassemblies">Resolving Class References to Assemblies</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#startup">ASP.NET Framework application Startup and Class Resolution</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#codereplacement">Code Replacement</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>



<!--BEGIN SUB SECTION-->
<a name="fslayout">
<span class="subhead">File System Layout of ASP.NET Applications</span>
<p>
ASP.NET can be used to host multiple Web applications, each identified using a unique
URL prefix within a Web site (where a Web site is represented on a 
Web server as a
unique <b>HostName</b>/<b>Port</b> combination). For example, a 
single Microsoft Internet Information
Services (IIS) Web server with two mapped IP addresses (one aliased to "www.msn.com" and
the other to "intranet") and three logical sites (http://intranet, http://www.msn.com,
http://www.msn.com port 81) could expose the following six ASP.NET applications.
<p>
<div class="indent">
<table class="table2" cellpadding="3" width="450">
<tr>  <th>Application URL</th>
        <th>Description</th></tr>
<tr>  <td>http://intranet</td>
        <td>"Root" application on intranet site.</td></tr>
<tr>  <td>http://www.msn.com</td>
        <td>"Root" application on www.msn.com site.</td></tr>
<tr>  <td>http://www.msn.com:81</td>
        <td>"Root" application on www.msn.com port 81 site.</td></tr>
<tr>  <td>http://intranet/training</td>
        <td>"Training" application on intranet site.</td></tr>
<tr>  <td>http://intranet/hr</td>
        <td>"HR" application on intranet site.</td></tr>
<tr>  <td>http://intranet/hr/compensation/</td>
        <td>"Compensation" application on intranet site.</td></tr>
</table>
</div>
<p>

<b>Note:</b> The URL for the compensation application mentioned in the table is rooted within 
the HR application URL namespace. However, this URL hierarchy notation does not 
imply that the
compensation application is contained or nested within the HR 
application.  Rather, each application maintains an independent set of configuration and 
class resolution properties; both are logical peer child sites of the 
intranet site.

<p>
Each ASP.NET Framework application exposed within a URL namespace is backed using a file system
directory located on either a local or remote file share. Application directories are not required to be centrally located within a contiguous part of the
file system; they can be scattered throughout a disk. For example, the 
ASP.NET applications
mentioned previously could be located in the different directories listed in the following table.
<p>

<div class="indent">
<table class="table2" cellpadding="3" width="450">
<tr>  <th>Application URL</th>
      <th>Physical path</th></tr>
<tr>  <td>http://intranet</td>
      <td>c:\inetpub\wwwroot</td></tr>
<tr>  <td>http://www.msn.com</td>
      <td>c:\inetpub\msnroot</td></tr>
<tr>  <td>http://www.msn.com:81</td>
      <td>d:\msnroot81</td></tr>
<tr>  <td>http://intranet/training</td>
      <td>d:\serverapps\trainingapp</td></tr>
<tr>  <td>http://intranet/hr</td>
      <td>\\hrweb\sillystuff\reviews</td></tr>
<tr>  <td>http://intranet/hr/compensation/</td>
      <td>c:\inetpub\wwwroot\compensation</td></tr>
</table>
</div>



<!--BEGIN SUB SECTION-->
<br>
<a name="resolvingassemblies">
<br>
<span class="subhead">Resolving Class References to Assemblies</span>
<p>
Assemblies are the unit of class deployment in the common language runtime. Developers writing
.NET Framework classes using Visual Studio .NET version 7.0 will produce a new assembly with each
Visual Studio project that they compile.  Although it is possible to have an assembly
span multiple portable executable (PE) files (several module DLLs),
Visual Studio .NET will, by default,
compile all assembly code into a single DLL (1 Visual Studio .NET project = 1 .NET 
Framework assembly = 1 physical DLL).

<p>
You can use an assembly on a computer by deploying it into an assembly cache.
The assembly cache can be either global to a computer or local to a particular
application. Only code intended to be shared across multiple
applications should be placed in the global system assembly cache. Code specific
to a particular application, such as most Web application logic, 
should be deployed in the application's local assembly cache. One advantage
of deploying an assembly within an application's local assembly cache is that only
code within that application can access it. (This is a nice feature 
for scenarios involving
ISPs.) It also facilitates side-by-side versioning of the same 
application because
classes are private to each application version instance.
<p>
An assembly can be deployed into an  application's local assembly cache by simply copying,
XCOPYing, or FTPing the appropriate files into a directory that has been marked as an
"assembly cache location" for that particular application. No additional registration
tool must be run once the appropriate files are copied, and no reboot is necessary.
This eliminates some of the difficulties currently associated with deploying COM components within ASP applications
(currently, an administrator must log on to the Web server locally and run Regsvr32.exe).
<p>
By default, an ASP.NET Framework application is automatically configured to use the \bin subdirectory,
located immediately under the application root, as its local assembly cache. The \bin directory
is also configured to deny any browser access so that a remote client cannot download
and steal the code.  The following example shows a possible directory layout for an ASP.NET application, where the \bin directory is immediately under the application root.

<div class="code"><xmp>
C:\inetpub\wwwroot
   Web.cfg
   Default.aspx

   \bin                  <= Application assembly cache directory
      MyPages.dll
      MyBizLogic.dll

   \order
      SubmitOrder.aspx
      OrderFailed.aspx

      \img
         HappyFace.gif
</xmp></div>


<!--BEGIN SUB SECTION-->
<a name="startup">
<span class="subhead">ASP.NET Framework application Startup and Class Resolution</span>
<p>
ASP.NET Framework applications are lazily constructed the first time a client requests a URL
resource from them. Each ASP.NET Framework application is launched within a unique application
domain (<b>AppDomain</b>)--a new common language runtime construct that enables process hosts to provide extensive
code, security, and configuration isolation at run time.
<p>
ASP.NET is responsible for manually creating an application domain when a new application
is started. As part of this process, ASP.NET provides configuration settings for the common language runtime
to use. These settings include:
<ul>
<li>The directory paths that make up the local assembly cache. (Note: It is the .NET Framework
application domain isolation architecture that allows each application to maintain its
own local assembly cache.)
<li>The application's security restrictions (what the application can access on the system).
</ul>
<p>

Because ASP.NET does not have compile-time knowledge of any applications you 
write on top of it, it cannot use static references to resolve and reference application code.
Instead, ASP.NET must use a dynamic class/assembly resolution approach to make the transition
from the ASP.NET runtime into application code.
<p>
ASP.NET configuration and page activation files will enable you to dynamically reference
a target-compiled .NET Framework class by specifying an assembly and class name combination.
The string format for this union follows the pattern <div class="code">classname, assemblyname</div>. The common language runtime can then use this simple string reference to resolve and load the appropriate class.



<!--BEGIN SUB SECTION-->
<br>
<a name="codereplacement">
<br>
<span class="subhead">Code Replacement</span>
<p>
.NET Framework assemblies are typically compiled and deployed into a Windows DLL-based
PE format. When the common language runtime's loader resolves a class implemented within this type
of assembly, it calls the Windows LoadLibrary routine on the file (which locks
its access on disk), and then maps the appropriate code data into memory for
run-time execution. Once loaded, the DLL file will remain locked on disk until
the application domain referencing it is either torn down or manually recycled.

<p>
Although ASP.NET cannot prevent the common language runtime from locking a loaded assembly DLL on disk,
it can support you by ensuring that the physical DLLs in a Web application's private assembly cache are never actually
loaded by the runtime. Instead, shadow copies of the assembly DLLs are made immediately
prior to their use. These shadow assemblies--not the original files--are then
locked and loaded by the runtime.

<p>
Because the original assembly files always remain unlocked, you are free to delete, replace, or rename them without cycling the Web server
or having to use a registration utility. FTP and similar methods work just fine. ASP.NET maintains an
active list of all assemblies loaded within a particular application's application domain
and uses file-change monitoring code to watch for any updates to the original files.



<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>ASP.NET Framework applications are identified by a unique URL and live in the file system of the Web server.
<li>ASP.NET can use shared assemblies, which reside in the global cache, and application-specific assemblies, which reside in the \bin directory of the application's virtual root.
<li>ASP.NET Framework applications run in the context of application domains (AppDomains), which provide isolation and enforce security restrictions.
<li>Classes can be dynamically referenced using "classname, assemblyname".
<li>ASP.NET uses shadow copies of assembly files to avoid locking, it and monitors the files so that changes are picked up immediately.
</ol>
<p>


<!-- #include virtual="/quickstart/include/footer.inc" -->


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->