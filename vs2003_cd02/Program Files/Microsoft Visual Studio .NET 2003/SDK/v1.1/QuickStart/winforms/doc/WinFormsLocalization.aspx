<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

      <span class="header">Localizing Your Windows Forms</span>
      <P>Localization is the process of translating strings in your application to different languages. It also involves
      changing images and form layout.</P>
      <span class="subhead">Localization Features of Windows Forms</span>
      <P>In Visual Studio .NET, the Windows Forms Designer is the localization tool.  When you start an application, you change the
      <b>Localization</b> property on the <b>Form</b> to <b>true</b> and simply create your application in a normal fashion.
      Once the application is complete, you change the <b>Language</b> property of the <b>Form</b> to the language you choose.
      This generates a new .resx file for that language.  All property changes are
      written to this new .resx file.  When your application is run, the CLR checks the current locale and checks
      if the application has resources for that specific locale.
      <P>The following example shows how to get properties from a resource file. </P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
button1.Location = (System.Drawing.Point) resources.GetObject ("button1.Location");
button1.Size = (System.Drawing.Size) resources.GetObject ("button1.Size");
button1.TabIndex = (int) resources.GetObject ("button1.TabIndex");
button1.Image = (System.Drawing.Image) resources.GetObject ("button1.Image");
button1.Text = (string) resources.GetObject ("button1.Text");
</Tab>

<Tab Name="VB">
Button1.Location = CType(resources.GetObject("Button1.Location"), System.Drawing.Point)
Button1.Size = CType(resources.GetObject("Button1.Size"), System.Drawing.Size)
Button1.TabIndex = CType(resources.GetObject("Button1.TabIndex"), Integer)
Button1.Image = CType(resources.GetObject("Button1.Image"), System.Drawing.Image)
Button1.Text = CType(resources.GetObject("Button1.Text"), String)
</Tab>

</Acme:TabControl><p>
<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
