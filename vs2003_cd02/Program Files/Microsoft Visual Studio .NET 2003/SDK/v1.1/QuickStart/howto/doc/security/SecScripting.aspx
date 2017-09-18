<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/security.inc" -->

<h4>How Do I...Script Security Policy Changes?</h4>

<p>The common language runtime ships with an advanced security policy system. An assembly receives permissions to access protected resources
based on evidence about the code (such as its URL of origin or its publisher certificate). The set of granted permissions is a function of what
various policy levels grant to the assembly based on its evidence. There are three policy levels that can be administered: the enterprise policy, machine policy,
and user policy level. Each policy level consists of a tree of code groups. Each code group consists of a membership condition and an
associated permission set. Code is granted the permission set associated with a code group if it meets the respective membership condition. Changing code groups
in the user, machine, or enterprise policy allows administrators to determine what permissions are granted to assemblies. It might become necessary to script
policy changes.  In these cases, the Code Access Security Policy (Caspol.exe) command line tool can be used to create batch files containing policy change commands.</p> 
<p>
Note: For all standard administrative tasks, it is highly recommended you use the common language runtime configuration (Mscorcfg.msc) tool.</p>

<p>Note: For more information regarding the policy system please see the security documentation in the Frameworks SDK.</p>
<p></p>

<h5>The Code Access Security Policy (Caspol.exe) command line tool</h5>
<p> The SDK ships the caspol command line policy administration tool. This tool can be used to create batch files for scripting security
policy changes. Typing <b>caspol -?</b> at the command line will show you the available options of the tool.
</p>

<h5>Scripting Against Named Code Groups</h5>
<p>In the default policy shipping with the common language runtime, all code groups have a unique name. If code groups have not been deleted or renamed
it is possible to uniquely script changes against these code groups. The most common code group names that will be used for scripting are:

<p>
<div class="indent">
<table class="table2">
  <tr>
    <th>
      <b>Code Group Name</b>
    </th>
    <th>
      Description
    </th>
  </tr>
  <tr>
    <td>
      <b>All_Code</b>
    </td>
    <td>
      The root code group in every policy level
    </td>
  </tr>
  <tr>
    <td>
      <b>My_Computer_Zone</b>
    </td>
    <td>
      Code group that applies to code on local computer
    </td>
  </tr>
<tr>
    <td>
      <b>Internet_Zone</b>
    </td>
    <td>
      Code group that applies to code from the Internet
    </td>
  </tr>
<tr>
    <td>
      <b>LocalIntranet_Zone</b>
    </td>
    <td>
      Code group that applies to code from the Intranet
    </td>
  </tr>
</table>
</div>
</p>


To see a complete list of code groups and their names in all policy levels, you can use the following
caspol command:  <b>caspol -all -listgroups</b>.  In order to change a code group's permission set,
include a command of the following form in your batch script:</p>

<div class="indent">
<p>caspol <em>PolicyLevel</em> -chggroup  <em>Name of code group</em> <em>PermissionSetName</em></p>
</div>
In order to add a new code group include a command of the following form in your batch script:</p>
<div class="indent">
<p>caspol <em>PolicyLevel</em> -addgroup  <em>Name of Parent code group</em> <em>MembershipCondition PermissionSetName CodeGroupFlags</em></p>
</div>
In order to reset policy to the default state at a policy level include a command of the following form in your batch script:</p>
<div class="indent">
<p>caspol <em>PolicyLevel</em> -reset</p>
</div>


<h5>Sample Scripts</h5>
The following caspol batch script resets policy to the default on all policy levels and grants full
trust to intranet applications. Note, since the granted permissions to code are calculated as the
intersection between policy levels and since (in default policy) both enterprise and user policy
level are set to full trust, you only need to change the machine policy level in order to guarantee
that intranet applications receive full trust. In other words, the script below guarantees that
intranet applications will run with full trust (while code from other places of origin will run
with the permissions given it in default policy).</p>

<p><b><div class="code"><pre>
caspol -all -reset
caspol -machine -chggroup LocalIntranet_Zone FullTrust
</pre></div></b></p>

<p>
The following script of caspol commands shows how to set policy so code from the internet will not receive any permissions from machine policy (first line). The second command
shows how to add a code group for granting full trust to code signed by the publisher that signed Myexe.exe. Note that the new code group
is hung off the root of the machine policy.
</p>
<p><b><div class="code"><pre>
caspol -machine -chggroup Internet_Zone Nothing
caspol -machine -addgroup All_Code -pub -file Myexe.exe FullTrust
</pre></div></b></p>



<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
