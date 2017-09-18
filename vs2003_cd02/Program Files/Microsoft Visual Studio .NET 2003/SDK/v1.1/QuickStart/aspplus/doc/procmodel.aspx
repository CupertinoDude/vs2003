<style>
<!--
div.Section1
	{page:Section1;}
span.Bold
	{font-weight:bold;
	}
-->
</style>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Using the Process Model</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#config">Process Model Configuration</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#reactive">Reactive Process Recycling</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#proactive">Proactive Process Recycling</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#events">Logging Process Model Events</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#webgarden">Enabling Web Gardens</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>

One of the most important requirements for ASP.NET Framework applications is
reliability.
The architecture of applications running inside the server process (in IIS, Inetinfo.exe) does not produce a solid foundation for
building reliable applications that can continue to run over a
long period of time.  Too many resources are shared on the process
level, and it is too easy for an error to bring down the entire server process.

<p>To solve this problem, ASP.NET provides an out-of-process
execution model, which protects the server process from user code.
It also enables you to apply heuristics to the lifetime of the
process to improve the availability of your Web applications.
Using asynchronous interprocess communication enables you to
provide the best balance of performance, scalability, and reliability.
<p>

<!--BEGIN SUB SECTION-->
<a name="config">
<span class="subhead">Process Model Configuration</span>
<p>
Process model settings are exposed in the root configuration file for the computer,
Machine.config.  The configuration section is named <b>&lt;processModel&gt;</b> and is shown in the following example.
On Windows 2000 and Windows XP, the process model is enabled by default (enable="true"). 
On the Windows Server 2003 family, ASP.NET runs by default in IIS6 native mode (Worker 
Process Isolation Mode).<div class="code"><pre>&lt;processModel
    enable="true"
    timeout="Infinite"
    idleTimeout="Infinite"
    shutdownTimeout="0:00:05" 
    requestLimit="Infinite" 
    requestQueueLimit="5000" 
    restartQueueLimit="10"
    memoryLimit="60" 
    webGarden="false"
    cpuMask="0xffffffff"
    userName="machine"
    password="AutoGenerate"
    logLevel="Errors"
    clientConnectedCheck="0:00:05"
    comAuthenticationLevel="Connect"
    comImpersonationLevel="Impersonate"
    responseRestartDeadlockInterval="00:09:00"
    responseDeadlockInterval="00:03:00" 
    maxWorkerThreads="20"
    maxIoThreads="20"
/&gt;
</pre></div>

<p>
Most of these settings control when a new worker process is
started to serve requests (gracefully taking the place of an old
worker process).  The process model supports two types of recycling:
reactive and proactive. The 'userName' and 'password' attributes define the 
account under which the ASP.NET worker process runs.&nbsp; These default to 
'machine' and 'autogenerate' respectively.&nbsp; These values tell ASP.NET to 
use the built-in ASPNET account and to use a cryptographically strong random 
password stored in the Local Security Authority (LSA) for that account.&nbsp; As 
noted above, by default on the Windows Server 2003 family, ASP.NET runs as part of the w3wp 
process using the default identity &quot;NETWORK SERVICE&quot;.&nbsp; If IIS5 Isolation 
mode is configured on the Windows Server 2003 family, the ASP.NET worker process would run 
in the ASPNET account.<p>

<p class="Text">If you want a more privileged process, you can set the
<span class="Bold">userName</span> attribute to <span class="Bold">System</span>, 
which causes the ASP.NET worker process to run with the same identity as the 
inetinfo.exe process. This process runs by default as the System identity. When 
so configured, the ASP.NET worker process will have the right to access nearly 
all resources on the local machine. In Windows 2000, Windows XP, and the Windows 
Server 2003 family systems, the System account also has network credentials and 
can access network resources as the machine account.</p>
<p class="Text">To configure the process to run as System, change the
<span class="Bold">userName</span> attribute in the <span class="Bold">&lt;processModel&gt;</span> 
section of machine.config as follows:</p>
<p class="Code">&lt;processModel&nbsp; userName=&quot;system&quot; password=&quot;autogenerate&quot; …/&gt;</p>
<p>

<!--BEGIN SUB SECTION-->
<a name="reactive">
<span class="subhead">Reactive Process Recycling</span>
<p>
Reactive process recycling occurs when a process is misbehaving or
unable to serve requests.  The process typically displays detectable
symptoms, such as deadlocks, access violations,
memory leaks, and so on,
in order to trigger a process recycle.  You can control the conditions that
trigger a process restart by using the configuration settings described in the following table.
<p>

<table class="table2" width="90%" cellpadding=3>
<tr>
<th width="*">Setting</th><th width="70%">Description</th>
</tr>
<tr>
  <td>
    <b>requestQueueLimit</b>
  </td>
  <td>
Handles deadlock conditions.  The DWORD value is set to the
maximum allowed number of requests
in the queue, after which the worker process is considered to be
misbehaving. When the number is exceeded, a new process
is
launched and the requests are reassigned.  The default is 5000 requests.
</td>
</tr>
<tr>
  <td>
    <b>memoryLimit</b>
  </td>
  <td>
Handles memory leak conditions.  The DWORD
 value is set to the percentage of physical memory
that the worker process can consume before it is considered to be
misbehaving. When that percentage is exceeded, a new process is
launched and the requests are reassigned.  The default is
60%.
  </td>
</tr>
<tr>
  <td>
    <b>shutdownTimeout</b>
  </td>
  <td>
Specifies the amount of time the worker process has
to shut itself down gracefully (string value in hr:min:sec format).
When the time out expires, the ASP.NET ISAPI shuts down the worker
process.  The default is "00:00:05".
  </td>
</tr>
</table>

<p>

<!--BEGIN SUB SECTION-->
<a name="proactive">
<span class="subhead">Proactive Process Recycling</span>
<p>
Proactive process recycling restarts the worker process periodically
even if the process is healthy.  This can be a useful way to prevent
denials of service due to conditions the process model is unable to
detect.  A process can be restarted after a specific number of
requests or after a time-out period has elapsed.
<p>

<table class="table2" width="90%" cellpadding=3>
<tr>
<th width="20%">Setting</th><th width="100%">Description</th>
</tr>
<tr>
  <td>
    <b>timeout</b>
  </td>
  <td>
String value in hr:min:sec format that configures the time limit
after which a new worker process
will be launched to take the place of the current one. The default
is <b>Infinite</b>, a keyword indicating
that the process should not be restarted.
  </td>
</tr>
<tr>
  <td>
    <b>idleTimeout</b>
  </td>
  <td>
String value in hr:min:sec format that configures the amount of
inactivity, after which the
worker process is automatically shut down.  The default is <b>Infinite</b>,
a keyword indicating that
the process should not be restarted.
  </td>
</tr>
<tr>
  <td>
    <b>requestLimit</b>
  </td>
  <td>
DWORD value set to the number of requests after which a new worker
process will be launched to take the
place of the current one.  The default is <b>Infinite</b>, a keyword
indicating that the process
should not be restarted.
  </td>
</tr>
</table>

<p>

<!--BEGIN SUB SECTION-->
<a name="events">
<span class="subhead">Logging Process Model Events</span>
<p>
The process model can write events to the Windows event log when
process cycling occurs.  This is controlled by the <b>logLevel</b>
attribute in the <b>&lt;processModel&gt;</b> configuration section.
<p>

<table class="table2" width="90%" cellpadding=3>
<tr>
<th width="20%">Setting</th><th width="100%">Description</th>
</tr>
<tr>
  <td>
    <b>logLevel</b>
  </td>
  <td>
Controls that process cycling events are logged to the event log.
The value can be:
<ul>
<li><b>All</b>: All
process cycling events are logged.</li>
<li><b>None</b>: No events are logged.</li>
<li><b>Errors</b>: Only unexpected
events are logged.</li>
</ul>
  </td>
</tr>
</table>

<p>
When a cycling event occurs, if logging is enabled for that event,
the following events are written to the application event log.
<p>

<table class="table2" width="90%" cellpadding=3>
<tr>
<th width="200"><nobr>Shutdown Reason</nobr></th><th><nobr>Event Log Type</nobr></th><th width="*">Description</th>
</tr>
<tr>
  <td>
    <b>Unexpected</b>
  </td>
  <td>
    Error
  </td>
  <td>
The ASP.NET worker process has shut down unexpectedly.
  </td>
</tr>
<tr>
  <td>
    <b>RequestQueueLimit</b>
  </td>
  <td>
    Error
  </td>
  <td>
The ASP.NET worker process has been restarted because the request queue limit was exceeded.
  </td>
</tr>
<tr>
  <td>
    <b>RequestLimit</b>
  </td>
  <td>
    Information
  </td>
  <td>
The ASP.NET worker process has been  restarted because the request limit was exceeded.
  </td>
</tr>
<tr>
  <td>
    <b>Timeout</b>
  </td>
  <td>
    Information
  </td>
  <td>
The ASP.NET worker process has been restarted because the time-out interval was met.
  </td>
</tr>
<tr>
  <td>
    <b>IdleTimeout</b>
  </td>
  <td>
    Information
  </td>
  <td>
The ASP.NET worker process has been shut down because the idle time-out interval was met.
  </td>
</tr>
<tr>
  <td>
    <b>MemoryLimitExceeded</b>
  </td>
  <td>
    Error
  </td>
  <td>
The ASP.NET worker process was restarted because the process memory limit was exceeded.
  </td>
</tr>
</table>


<p>

<!--BEGIN SUB SECTION-->
<a name="webgarden">
<span class="subhead">Enabling Web Gardens</span>
<p>
The process model helps enable scalability on multiprocessor
computers by distributing the work to several processes, one per CPU,
each with processor affinity set to its CPU.  This eliminates
cross-processor lock contention and is ideal for large SMP systems.
This technique is called Web gardening.  The configuration
settings for enabling Web gardens are listed in the following table.
Note that these settings take effect only after a server is restarted.
IIS must be cycled in order for this change to take place.
<p>

<table class="table2" width="90%" cellpadding=3>
<tr>
<th width="20%">Setting</th><th width="100%">Description</th>
</tr>
<tr>
  <td>
    <b>webGarden</b>
  </td>
  <td>
Controls CPU affinity. <b>True</b> indicates that processes should
be affinitized to the corresponding CPU.
The default is <b>False</b>.
  </td>
</tr>
<tr>
  <td>
    <b>cpuMask</b>
  </td>
  <td>
Specifies which processors on a multiprocessor server are 
eligible to run ASP.NET processes. The cpuMask value specifies 
a bit pattern that indicates the CPUs eligible 
to run ASP.NET threads. ASP.NET launches one worker process 
for each eligible CPU. If <b>webGarden</b> is set to false, 
cpuMask is ignored and only one worker process will run regardless 
of the number of processors in the machine. If <b>webGarden</b> is set to true, 
ASP.NET launches one worker process for each CPU that corresponds to a set bit 
in cpuMask. The default value of cpuMask is 0xffffffff.
  </td>
</tr>
</table>

<p>

Web gardening has some side effects that you should be aware of:

<ul>
  <li>If your application uses session state, it must choose an
out-of-process provider (NT Service or SQL).
  <li>Application state and application statics are per process, not
per computer.
  <li>Caching is per process, not per computer.
</ul>

<p>

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>ASP.NET provides an out-of-process execution model, which protects
the server process from user code.   It also enables you to apply
heuristics to the lifetime of the process to improve the overall
availability of Web applications.
<li>The <b>&lt;processModel&gt;</b> settings are exposed in the root
configuration file for the computer's Machine.config file. On Windows 2000 and 
Windows XP, the process model is enabled by default.&nbsp; On the Windows 
Server 2003 family, it is not.
<li>The process model supports two types of recycling:
reactive and proactive.  Reactive process
recycling occurs when a process is misbehaving or unable to serve
requests.  Proactive process recycling restarts the worker process
periodically, even when the process may be healthy.
<li>The process model can write events to the Windows event
log when process cycling occurs.  This is controlled by the
log-level attribute in the <b>&lt;processModel&gt;</b> configuration section.
<li>The process model helps enable scalability on multiprocessor
computers by distributing the work to several processes, one per CPU,
each with processor affinity set to its CPU.  This technique is called
Web gardening.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->