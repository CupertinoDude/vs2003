<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/ConfigHeader.inc" -->

<h4>How Do I...Write a Custom Configuration Section Handler?</h4>

When configurations become too complex for the simple section handlers provided by the
<b>System.Configuration</b> namespace, a custom section handler should be created.  All
that is needed for a custom section handler is for a class to support the
<b>IConfigurationSectionHandler</b> interface.  A basic class definition for the handler
might look like the following.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
public class MyConfigSectionHandler : IConfigurationSectionHandler {
 ...
}
</Tab>
<Tab Name="VB">
Public Class MyConfigurationSectionHandler : Implements IConfigurationSectionHandler
 ..
End Class
</Tab>
</Acme:TabControl>

<p>
The <b>IConfigurationSectionHandler</b> interface has only one method.  The <b>Create</b> method
is called on the section handler whenever a configuration section is found that is registered
to the handler.  The <b>Create</b> method accepts three parameters.  The first parameter
is an <b>Object</b> that contains parent configuration settings in the instance
that inherited configuration settings exist.  The second parameter is a <b>ConfigurationContext</b> that contains any contextual information such as the current virtual path.  This information is provided for convenience, and 
doesn't have to be used.  The final parameter is an <b>XmlNode</b>
containing the raw XML configuration.  The <b>DictionarySectionHandler</b> returns a hash table, but a handler
can return any possible type after parsing data.  A sample implementation of <b>Create</b> might
consist of the following code sample.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
public object Create(Object parent, ConfigurationContext configContext, XmlNode section) {
    Hashtable hash = new Hashtable();
    ...
    return hash;
}
</Tab>
<Tab Name="VB">
Public Function Create(Parent As Object, ConfigContext As ConfigurationContext, Section As XmlNode) As Object
    Dim Hash As New Hashtable()
    ...
    Return Hash
End Class
</Tab>
</Acme:TabControl>

<p>
When trying to manipulate and investigate
the parent properties, keep the following guidelines in mind: the <b>parent</b> object should never be modified in the <b>Create</b> method; any
modifications, no matter how small, should be made on a clone; the <b>parent</b> object may also be null;
if the section handler is being called for the first time, there won't be any inheritable settings
available.  The following code example demonstrates proper use of the <b>parent</b> object.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
Hashtable hash;

if (parent == null) {
    hash = new Hashtable();
} else {
    hash = (Hashtable)((Hashtable)parent).Clone();
}
</Tab>
<Tab Name="VB">
Dim Hash As Hashtable

If Parent = Nothing
    Hash = New Hashtable()
Else
    Hash = CType(CType(parent, Hashtable).Clone(), Hashtable)
End If
</Tab>
</Acme:TabControl>




<!-- #include virtual="/quickstart/howto/include/footer.inc" -->