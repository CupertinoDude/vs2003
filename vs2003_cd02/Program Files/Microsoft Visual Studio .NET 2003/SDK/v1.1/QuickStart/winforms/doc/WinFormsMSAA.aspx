<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

      <span class="header">Making Your Windows Forms Applications Accessible to People with
      Disabilities</span>
      <P>Microsoft Active Accessibility (MSAA) is a technology that makes
      computer programs more accessible to people who use accessibility aids.
      For developers, it also can expand the capabilities of testing tools and
      other specialized utilities. Detailed information on MSAA can be found at the
      MSAA web
      site.</P>
      <span class="subhead">What Does Active Accessibility Do?</span>
      <P>Active Accessibility provides a standard way for accessibility aids to
      get information about user interface elements, and for programs to expose
      that information to the aids. For example, Active Accessibility provides
      these individual pieces of information:
      <UL>
        <LI>Type of object
        <LI>Name of object
        <LI>Location of object
        <LI>Current state of object </LI></UL>
      <P>It also provides the following:
      <UL>
        <LI>Notification of changes in the user interface by use of Windows events, and
        navigation (spatial and logical)
        <LI>Standards that help program-developers and aid-developers
        ensure their products are compatible. </LI></UL>
      <span class="subhead">How Does Windows Forms Help?</span>
      <P>MSAA defines an interface called <b>IAccessible</b>. This interface is the
      mechanism through which information is provided to accessibility aids.
      Windows Forms implements this interface for all of its controls and exposes a
      set of accessibility properties on each control (these can easily
      be set at design time or run time). This makes it much easier to build
      accessible applications. The properties are the following:
      <UL>
        <LI><B>AccessibleName:</B> The name of the control - for example,
        <b>SaveButton</b>
        <LI><B>AccessibleDescription:</B> A description of the purpose of the control -
        for example, <b>"Press this button to save the customer"</b>
        <LI><B>AccessibleRole:</B> The role of the control - for example,
        <b>AccessibleRoles.PushButton</b> </LI></UL>
      <P>Windows Forms also maps other properties to their appropriate <b>IAccessible</b>
      properties - for instance, the <b>HelpProvider</b> property.</P>
      <P>The following code shows how to set the <b>AccessibleName</b> and
      <b>AccessibleDescription</b> properties on a <b>TextBox</b>.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
textBox1.Location = new System.Drawing.Point(16, 24);
textBox1.Text = "Hello Windows Forms World";
textBox1.AccessibleName = "TextEntryField";
textBox1.TabIndex = 0;
textBox1.AccessibleDescription = "Please enter some text in the box";
textBox1.Size = new System.Drawing.Size(360, 20);
</Tab>

<Tab Name="VB">
textBox1.Location = new System.Drawing.Point(16, 24)
textBox1.Text = "Hello Windows Forms World"
textBox1.AccessibleName = "TextEntryField"
textBox1.TabIndex = 0
textBox1.AccessibleDescription = "Please enter some text in the box"
textBox1.Size = new System.Drawing.Size(360, 20)
</Tab>

</Acme:TabControl><p>

<p>View and run this sample.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Accessible/CS"
        ViewSource="/quickstart/winforms/Samples/Accessible/Accessible.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Accessible"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Accessible/VB"
        ViewSource="/quickstart/winforms/Samples/Accessible/Accessible.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Accessible"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>

<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
