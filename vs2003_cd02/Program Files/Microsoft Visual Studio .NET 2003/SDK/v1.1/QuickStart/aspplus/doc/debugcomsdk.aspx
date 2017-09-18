
<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">The Microsoft .NET Framework SDK Debugger</span>
<p>
No matter how skilled a programmer you are, you are bound to make mistakes once in a while.  Tracking down problems in your code
can be baffling without the appropriate tool.  Fortunately, the compiled nature of ASP.NET means that debugging Web applications is
no different than debugging any other managed applications, and the .NET Framework SDK includes a lightweight debugger that is perfectly
suited for this task.
</p>
<p>
This section describes the steps required to debug ASP.NET Framework applications using the debugger provided in this SDK.  The debugger supports manual-attach debugging of processes on a local development computer.
The debugger documentation included in this SDK is your best resource for information about specific features.

<h5>Enabling Debug Mode for ASP.NET Applications</h5>

Because many parts of an ASP.NET Framework application are dynamically compiled at runtime (.aspx and .asmx files, for example), you must
configure the ASP.NET runtime to compile the application with symbolic information before the application can be debugged.
Symbols (.pdb files) tell the debugger how to find the original source files for a binary, and how to map breakpoints in code to lines in those
source files.  To configure an application to compile with symbols, include a <b>debug</b> attribute on the <b>compilation</b> section within
the <b>system.web</b> group of the Web.config file at the application's root directory, as follows:

<div class="code"><pre>
&lt;configuration&gt;
  &lt;compilation debug="true"/&gt;
&lt;/configuration&gt;
</pre></div>

<b>Important: </b> You should only enable this setting when you are debugging an application, because it can significantly affect application 
performance.
<p>

<h5>Debugging ASP.NET Applications</h5>

When you have enabled debugging for the application, you should issue a request to the page you want to debug.  This
ensures that the ASP.NET runtime process (Aspnet_wp.exe) is created and the application is loaded into memory.
<p>
To begin debugging:

<ol>
<li>Launch the .NET Framework debugger, DbgClr.exe.
<li>Use the <b>File...Miscellaneous Files...Open File </b> menu to open the source file for the page you want to debug.
<li>From the <b>Tools</b> menu, choose <b>Debug Processes</b>.  The screen in the figure following these instructions will appear.
<li>Check the <b>Show system processes</b> checkbox, if it is not checked.
<li>Find the Aspnet_wp.exe process and double-click it to bring up the <b>Attach to Process</b> dialog.
<li>Make sure your application appears in the list of running applications, and select <b>OK</b> to attach.
<li>Close the <b>Programs</b> dialog.
</ol>

<div class="indent">
<img src="/quickstart/aspplus/images/debug1.gif">
</div>

<p>

<b>Important: </b> When you attach to the Aspnet_wp.exe process, all threads in that process are frozen.
Under no circumstances should you attempt to debug a live production application, because client requests can not execute normally
until the debugger is detached.

<h5>Setting Breakpoints</h5>

To set a breakpoint in your page, click the left-hand margin on a line containing an executable statement or function/method signature.
A red dot appears where the breakpoint is set.  Move the mouse over the breakpoint to ensure that it is appropriately mapped to
the correct application instance in the Aspnet_wp.exe process.

<p>
Reissue the request to the page from your browser.  The debugger will stop at the breakpoint and gain the current window focus.
From this point, you can step, set variable watches, view locals, stack information, disassembly, and so on.  You can see the intrinsic objects on the page, like <b>Request</b>, <b>Response</b>, and <b>Session</b> by using <i>this</i> (C#) or <i>Me</i> (VB) in the watch window.
<p>

<div class="indent">
<img src="/quickstart/aspplus/images/debug2.gif">
</div>

<h5>Generating Symbols for Pre-Compiled Components</h5>

To debug pre-compiled components, such as business objects or code-behind files, you must compile with symbolic
information prior to debugging.  Symbols for assemblies are typically found by means of a path-based search algorithm.  The algorithm
used by the PDB library (Mspdb70.dll) to find symbolic information is as follows:

<ol>
<li>Search the same path as the assembly. This is the normal location for .pdb files.
<br>For local assemblies, place the symbols (.pdb files) in the application's /bin directory with the DLLs.
<li>Search path as specified in the PE file (the NB10 debug header).
<li>Search NT symbol file locations (environment variables <b>_NT_SYMBOL_PATH</b> and <b>_NT_ALT_SYMBOL_PATH</b>).
</ol>

<b>Note: </b> If symbolic information cannot be found, the debugger prompts for a user-specified location.

<h4>Section Summary</h4>
<ol>
<li>The debugger described in this section supports manual-attach debugging of processes on a local development computer.
<li>Debugging allows the ASP.NET runtime to dynamically compile with symbolic information.  Enable this by setting
<i><nobr>&lt;compilation debug="true"/&gt;</nobr></i> in the Web.config file located in the application's root directory.  The debugger setting should only be
enabled when you are debugging an application, because it degrades application performance.
<li>To debug an application, issue a request to a page, attach the debugger to the Aspnet_wp.exe process, set breakpoints, and reissue the page request.
<li>When attached to the Aspnet_wp.exe process, all threads in that process are frozen.
Under no circumstances should you debug a live production application, since client requests can not execute normally
until the debugger is detached.
<li>To debug pre-compiled components, such as business objects or code-behind files, you must compile with symbolic
information prior to debugging.
</ol>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->