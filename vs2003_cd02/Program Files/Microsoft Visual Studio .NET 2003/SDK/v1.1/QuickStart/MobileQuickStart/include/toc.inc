<table>
<tr> 
<td nowrap style="padding-right:15">

<script runat=server>

String LinkTarget = "_top";
String MakeLink(String link)
{
    return String.Concat("/MobileQuickStart?url=", link);
}


</script>

<div class="toc" style="font-size:8pt;color:darkred">

    <div style="padding:0,0,4,0"><b>Getting Started</b></div>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/Introduction.aspx") %>">Introduction</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/SdkFeatures.aspx") %>">ASP.NET Mobile Controls</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/HowToView.aspx") %>">Viewing the Samples</a><p>
    
    <div style="padding:0,0,4,0"><b>Mobile Web Form Basics</b></div>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/SimpleForms.aspx") %>">Introducing Mobile Web Forms</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/Input.aspx") %>">Handling User Input</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/Lists.aspx") %>">List Controls</a><p>
    
    <div style="padding:0,0,4,0"><b>Advanced Topics</b></div>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/Styles.aspx") %>">Styles and Style Sheets</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/Pagination.aspx") %>">Automatic Pagination</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/DeviceSpecific.aspx") %>">Device-Specific Content</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/SpecialFeatures.aspx") %>">Image, AdRotator,</a><br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/SpecialFeatures.aspx") %>">Calendar and PhoneCall</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/WritingControls.aspx") %>">Writing Your Own Controls</a><p>
    
    <div style="padding:0,0,4,0"><b>Writing Mobile Applications</b></div>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/StateManagement.aspx") %>">Managing Application State</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/Capabilities.aspx") %>">Using Mobile Capabilities</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/Security.aspx") %>">Security</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/Localizing.aspx") %>">Localizing Mobile Applications</a><p>
    
    <div style="padding:0,0,4,0"><b>Samples and Resources</b></div>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/MailControl.aspx") %>">Writing an E-Mail Control</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/TimerForm.aspx") %>">Writing a TimerForm Control</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/FMExpense.aspx") %>">FM Expense Reporting</a><br>
        &nbsp; <a class="outer" target="<%= LinkTarget %>" href="<%= MakeLink("doc/IBuySpy.aspx") %>">IBuySpy Mobile Portal</a><p>
    
</div>

</td>
</tr>
</table>
