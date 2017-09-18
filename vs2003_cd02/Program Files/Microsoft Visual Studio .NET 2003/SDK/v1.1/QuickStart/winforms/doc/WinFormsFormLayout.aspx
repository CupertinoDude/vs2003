<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

      <span class="header">Dynamic Layout in Windows Forms</span>
      <P>The controls on a form can be dynamically resized as the form
      is resized.</P>
      <P>Windows Forms provides three ways to control the layout of your form:</P>
      <UL>
        <LI>Anchoring
        <LI>Docking
        <LI>Custom </LI></UL>

        <!-- --------------------------- ANCHORING ----------------------------- -->
      <span class="subhead">Anchoring</span>
      <P>When a control is anchored to the edge of its container, the distance
      between the control and the specified edge remains constant when the
      container is resized. A control can be anchored to any combination of the edges of the container. If
      the control is anchored to opposite edges of its container, it is resized when the container is resized.
      <P>For example, if you anchor a <b>TextBox</b> control to the left and right
      edges of a form, then as the form is resized the width of the <b>TextBox</b>
      changes.</P>
      <P>The following code anchors a <b>TextBox</b> to the upper, left, and right edges
      of its container:</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
textBox1.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
</Tab>

<Tab Name="VB">
textBox1.Anchor = AnchorStyles.Top Or AnchorStyles.Left Or AnchorStyles.Right
</Tab>

</Acme:TabControl><p>

<p>To view and run this sample:
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Layout/Anchoring/CS"
        ViewSource="/quickstart/winforms/Samples/Layout/Anchoring/Anchoring.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Anchoring"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Layout/Anchoring/VB"
        ViewSource="/quickstart/winforms/Samples/Layout/Anchoring/Anchoring.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Anchoring"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<!-- --------------------------- DOCKING ----------------------------- -->

<span class="subhead">Docking</span>

<P>When a control is docked to the edge of its container, it remains in
contact with that edge when the container is resized.  For example, in Windows
Explorer, the <b>TreeView</b> control is docked on the left edge of the window and the
<b>ListView</b> control is docked on the right edge of the window. If multiple controls
are docked to one edge, the first is docked to the edge of the container, and
the others are docked as close as possible to the edge without covering
the others.</P>

<P>The following code docks a <b>Panel</b> control on the left edge a the container.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
Panel1.Dock = DockStyle.Left;
</Tab>

<Tab Name="VB">
Panel1.Dock = DockStyle.Left
</Tab>

</Acme:TabControl><p>

<p>To view and run this sample:
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Layout/Docking/CS"
        ViewSource="/quickstart/winforms/Samples/Layout/Docking/Docking.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Docking"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Layout/Docking/VB"
        ViewSource="/quickstart/winforms/Samples/Layout/Docking/Docking.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Docking"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>

<!-- --------------------------- DockMan ----------------------------- -->

<span class="subhead">DockMan Sample</span>

<P>The following sample allows you to manipulate the anchoring and docking
properties of a <b>Button</b> at run time so that you can understand how they
interact.</P>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Layout/Dockman/CS"
        ViewSource="/quickstart/winforms/Samples/Layout/Dockman/Dockman.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Dockman"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Layout/Dockman/VB"
        ViewSource="/quickstart/winforms/Samples/Layout/Dockman/Dockman.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Dockman"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>

<span class="subhead">Custom Layout</span>


<P>You can write your own layout manager by using the <b>Layout</b> event that is exposed on 
the <b>Control</b> class.  The Layout event can be used as a place to add custom layout logic.</P>

<p>The Layout event is raised whenever an event or action causes a container to re-layout its 
child controls.  Such actions include, changing the size or location of a child control, adding 
or removing child controls from a container, changing a property on a child control that will 
affect its size or location (Achor, Dock, BorderStyle), and also resizing the container itself.</P>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
