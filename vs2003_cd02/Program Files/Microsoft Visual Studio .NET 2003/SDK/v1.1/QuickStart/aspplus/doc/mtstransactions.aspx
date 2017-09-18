<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" 
    Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">MTS Transactions</span>
<p>
A transaction is an operation or set of operations that succeeds 
or fails as a logical unit.   A good example of a transaction is 
the transfer of funds from one bank account to another.  In this 
case, the funds must be debited from the first account and credited 
to the second account before the operation can be considered a success.  
If the funds are successfully debited but not credited, the debit from 
the first account must be undone to leave both accounts in a 
correct and consistent state.
</p>

<p>
Transactions are normally managed by declaring boundaries around a 
set of operations.  Operations that execute in the context of the 
transaction boundary then succeed or fail as a unit.   For ASP.NET, 
the transaction boundary is the execution of a single request to a page, 
which might contain nested components that participate in the same 
transaction.  While the page is executing, if an operation on the page 
itself or a nested component in the same transaction fails, it can 
call <b>ContextUtil.SetAbort</b>.  This is then picked up by the current 
transaction context, the entire transaction fails, and any operations 
that were already completed are undone.  If nothing fails, the 
transaction is committed.
<p>
ASP.NET support for transactions consists of the ability to allow 
pages to participate in ongoing Microsoft .NET Framework transactions. 
Transaction support is exposed via an <b>@Transaction</b> directive 
that indicates the desired level of support:
<p>

<div class="code"><pre>
&lt;%@ Transaction="Required" %&gt;
</pre></div>

<p>
The following table defines the supported transaction attributes.
The absence of a transaction directive is the same as an explicit 
directive to "Disabled".  Unlike ASP, ASP.NET has no explicit 
directive for none (that is, Transaction="None").
<p>

<table class="table2" width="90%" cellpadding=3>
<tr>
<th width="20%">Attribute</th><th width="100%">Description</th>
</tr>
<tr>
  <td>
    <b>Required</b>
  </td>
  <td>
The page requires a transaction.  It runs in the context of an 
existing transaction, if one exists.  If not, it starts one.
</td>
</tr>
<tr>
  <td>
    <b>RequiresNew</b>
  </td>
  <td>
The page requires a transaction and a new transaction is started for each request.
  </td>
</tr>
<tr>
  <td>
    <b>Supported</b>
  </td>
  <td>
The page runs in the context of an existing transaction, if one exists.  
If not, it runs without a transaction.
  </td>
</tr>
<tr>
  <td>
    <b>NotSupported</b>
  </td>
  <td>
The page does not run within the scope of transactions. When a request 
is processed, its object context is created without a transaction, 
regardless of whether there is an active transaction.
  </td>
</tr>
</table>

<p>

A transaction can be explicitly committed or aborted using static 
methods of the <b>System.EnterpriseServices.ContextUtil</b> class.  
You can explicitly call the <b>SetComplete</b> or <b>SetAbort</b> 
method to commit or abort an ongoing transaction.
<p>
Note: A transaction will commit or abort at the end of page's 
lifetime depending on whether the SetComplete or SetAbort was 
called last, provided there is no other object joining the same transaction.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// Try to do something crucial to transaction completing.
if (!DoSomeWork()) {
    ContextUtil.SetAbort();
}
</Tab>
<Tab Name="VB">
' Try to do something crucial to transaction completing.
If (Not DoSomeWork())
    ContextUtil.SetAbort()
End If
</Tab>
<Tab Name="JScript">
// Try to do something crucial to transaction completing.
if (!DoSomeWork()) {
    ContextUtil.SetAbort();
}
</Tab>
</Acme:TabControl>

<p>
<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>A transaction is an operation or set of operations that 
succeeds or fails as a logical unit.</li>

<li>ASP.NET transaction support consists of the ability to 
allow pages to participate in ongoing Microsoft .NET Framework 
transactions. Transaction support is exposed via an 
<b>@Transaction</b> directive that indicates the desired 
level of support.</li>

<li>A transaction can be explicitly committed or aborted using 
static methods of the <b>System.EnterpriseServices.ContextUtil</b> 
class.  Developers can explicitly call the <b>SetComplete</b> or 
<b>SetAbort</b> method to commit or abort an ongoing transaction.</li>
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
