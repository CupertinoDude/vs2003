<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/Security.inc" -->


<h4>How Do I...Request the permissions my code needs?</h4>

Since you do not necessarily have control over what permissions are assigned to
the code you write, the common language runtime provides a mechanism for requesting the
permissions that you feel your code must have in order to run properly. If the code
is not granted the required permissions, it will not run. And, because permission requests
are stored in an assembly's manifest, the end user can run a tool to determine what
permissions have been requested by the assembly author and then take the appropriate steps
to grant those permissions if they need the code to run on their machine.<p>

Three types of permission requests are supported:
<ul>
<li><strong>RequestMinimum:</strong> The permissions the code must have to run properly.
If these permissions cannot be granted, the code will not be executed.
<li><strong>RequestOptional:</strong> The permissions that should be granted if allowed
by policy. The runtime will attempt to execute code even if permissions it requests as
optional have not been granted.
<li><strong>RequestRefuse:</strong> The permissions that code should never be granted.
Code will not receive these permissions, even if they would normally be granted to it.
This is an extra precaution you can take to prevent your from code being
misused.
</ul>

Permission requests can only be made in a declarative fashion and must always be at the
assembly level (the assembly is the unit to which permissions are granted by the security
system). The following code is a request stating that an assembly must have unrestricted access to the
file system in order to function.</p>

<Acme:TabControl runat="server" HtmlEncode="true">
<Tab Name="C#">
[assembly:FileIOPermission(SecurityAction.RequestMinimum, Unrestricted=true)]

public class FileMover {
    //something interesting
}
</Tab>
<Tab Name="VB">
<Assembly: FileIOPermission(SecurityAction.RequestMinimum, Unrestricted := True)>

Public Class FileMover
    'something interesting
End Class
</Tab>
<Tab Name="C++">
[assembly:FileIOPermission(SecurityAction.RequestMinimum, Unrestricted=true)]

public class FileMover {
    //something interesting
}
</Tab>
</Acme:TabControl>
<p>

Several requests of the same type can be made, in which case the final permission
set requested is the aggregate of all requests of that type.  In the example below
<strong>RequestMinimum</strong> is used twice with different permissions to state
that the assembly must have the ability to use Reflection Emit and perform
serialization in order for it to function.<p>

<Acme:TabControl runat="server" HtmlEncode="true">
<Tab Name="C#">
[assembly:ReflectionPermission(SecurityAction.RequestMinimum, ReflectionEmit=true)]
[assembly:SecurityPermission(SecurityAction.RequestMinimum, SerializationFormatter=true)]

public class CodeGenerator {
    //something interesting
}
</Tab>
<Tab Name="VB">
<Assembly: ReflectionPermission(SecurityAction.RequestMinimum, ReflectionEmit := True)>
<Assembly: SecurityPermission(SecurityAction.RequestMinimum, SerializationFormatter := True)>

Public Class CodeGenerator
    'something interesting
End Class
</Tab>
<Tab Name="C++">
[assembly:ReflectionPermission(SecurityAction.RequestMinimum, ReflectionEmit=true)]
[assembly:SecurityPermission(SecurityAction.RequestMinimum, SerializationFormatter=true)]

public class CodeGenerator {
    //something interesting
}
</Tab>
</Acme:TabControl>
<p>

The same permission can also appear in requests of different types.  For instance, the
example program at the bottom of this page uses an <strong>EnvironmentPermission</strong>
in each of its three requests (Minimum, Optional, and Refuse).  This is useful when a
permission encompasses a number of operations and you want to ensure that your assembly
has the ability to perform some of those operations while being prevented from performing
others.  It is important to note that any permission you refuse using
<strong>RequestRefuse</strong> will not be granted to your assembly even if you request
that same permission using <strong>RequestMinimum</strong>.<p>

In addition to requesting individual permissions, entire sets of permissions can be
requested in a compact fashion.  The example below shows two requests: one
stating that an assembly must have unrestricted access to the file system in order
to function and one stating that it will take any and all other permissions that
the security system is willing to grant it.<p>

<Acme:TabControl runat="server" HtmlEncode="true">
<Tab Name="C#">
[assembly:FileIOPermission(SecurityAction.RequestMinimum, Unrestricted=true)]
[assembly:PermissionSet(SecurityAction.RequestOptional, Name="FullTrust")]

public class FileMover {
    //something interesting
}
</Tab>
<Tab Name="VB">
<Assembly: FileIOPermission(SecurityAction.RequestMinimum, Unrestricted := True)>
<Assembly: PermissionSet(SecurityAction.RequestOptional, Name := "FullTrust")>

Public Class FileMover
    'something interesting
End Class
</Tab>
<Tab Name="C++">
[assembly:FileIOPermission(SecurityAction.RequestMinimum, Unrestricted=true)]
[assembly:PermissionSet(SecurityAction.RequestOptional, Name="FullTrust")]

public class FileMover {
    //something interesting
}
</Tab>
</Acme:TabControl>
<p>

The previous example shows how to request a permission set by name, but it is also
possible to use a custom permission set representing the exact permissions
you want. For more information on how to do this, search for
<strong>PermissionSetAttribute</strong> in the .NET Framework SDK Reference.<p>

The SDK provides a tool called PERMVIEW that is useful for verifying that your
permission requests are correct.  Running PERMVIEW on a compiled assembly will
read the permission requests out of the assembly's manifest and display them
as shown below.<p>

<div class="code"><xmp>
C:\>permview filemover.exe

Microsoft (R) .NET Framework Permission Request Viewer.  Version 1.0.XXXX.0
Copyright (C) Microsoft Corp. 1998-2001

minimal permission set:
<PermissionSet class="System.Security.PermissionSet"
               version="1">
   <IPermission class="System.Security.Permissions.FileIOPermission"
                version="1"
                Unrestricted="true"/>
</PermissionSet>


optional permission set:
<PermissionSet class="System.Security.PermissionSet"
               version="1"
               Unrestricted="true"/>


refused permission set:
  Not specified
</xmp></div>
<p>


The following example shows a simple program for reading Windows environment variables.
The program is intending to collect very basic information about the user's hardware
(processor type, # of processors, etc.) but has safeguards in place to prevent it from
ever being used to obtain private information (user name, computer name, etc.).<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/Security/RequestPermissions/CS"
        ViewSource="/quickstart/howto/samples/Security/RequestPermissions/RequestPermissions.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# RequestPermission"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/Security/RequestPermissions/VB"
        ViewSource="/quickstart/howto/samples/Security/RequestPermissions/RequestPermissions.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB RequestPermission"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/Security/RequestPermissions/CP"
        ViewSource="/quickstart/howto/samples/Security/RequestPermissions/RequestPermissions.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ RequestPermission"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->