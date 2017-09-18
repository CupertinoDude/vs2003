<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Writing Multiple Document Interface Applications</span>

<P>Multiple Document Interface (MDI) applications have a single, primary
window (the parent window) that contains a set of windows within
its client region (child windows).  Each child window is a form that is
constrained to appear only within the parent.
Children typically share the menu bar, tool bar, and other parts of the
parent's interface.  Secondary windows like dialog boxes are not
constrained to the parent window's client region.</P>

<span class="subhead">Creating an MDI Application</span>

 <P>You can create an MDI application by following these steps:
 <ol>
 <LI>Create a <b>Form</b> (<b>MainForm</b>) that represents the MDI parent window and
 set its <b>IsMdiContainer</b> property to <b>true</b>. The following code demonstrates
 how to set this property.<BR><BR>

<table  cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
this.IsMdiContainer = true;
</Tab>

<Tab Name="VB">
Me.IsMdiContainer = True
</Tab>

</Acme:TabControl>
</td>
</tr>
</table>

<p>
<br>


<LI>Create child forms and set the <b>MdiParent</b> property of each form to
reference the parent form. The following code demonstrates setting the MDI
parent for an instance of a child form. <BR><BR>

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>
<Acme:TabControl runat="server">

<Tab Name="C#">
doc.MdiParent = this;
</Tab>

<Tab Name="VB">
doc.MdiParent = Me
</Tab>

</Acme:TabControl><p>
</td>
</tr>
</table>

</ol>

If you have different types of data to display, you can have multiple
types of child forms. To display a child form, create an instance of the
child form and call its <b>Show</b> method.</P>

<span class="subhead">Standard MDI Menus</span>

<P>Typically, an MDI application has a <B>Windows</B> menu that allows the
user to arrange the open child windows through tiling or cascading. The
<b>Windows</b> menu also allows you to navigate to any of the open child windows.
To create a <b>Windows</b> menu, add the menu items for tiling and cascading to a
<b>Windows</b> menu in your parent form and set the <b>MdiList</b> property to <b>true</b> for
the top-level <b>Windows</b> menu.  The following code demonstrates how to create
a <b>Windows</b> menu in an MDI application.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
....
//Add Window Menu</span>
MenuItem miWindow = mainMenu.MenuItems.Add("&Window");
miWindow.MenuItems.Add("&Cascade", new EventHandler(this.WindowCascade_Clicked));
miWindow.MenuItems.Add("Tile &Horizontal", new EventHandler(this.WindowTileH_Clicked));
miWindow.MenuItems.Add("Tile &Vertical", new EventHandler(this.WindowTileV_Clicked));
miWindow.MdiList = true ; //Adds the MDI Window List to the bottom of the menu</span>

....

protected void WindowCascade_Clicked(object sender, System.EventArgs e) {
    this.LayoutMdi(MdiLayout.Cascade);
}


protected void WindowTileH_Clicked(object sender, System.EventArgs e) {
    this.LayoutMdi(MdiLayout.TileHorizontal);
}


protected void WindowTileV_Clicked(object sender, System.EventArgs e) {
    this.LayoutMdi(MdiLayout.TileVertical);
}

....
</Tab>

<Tab Name="VB">
....
'Add Window Menu
Dim miWindow As MenuItem = mainMenu.MenuItems.Add("&Window")
miWindow.MenuItems.Add("&Cascade", AddressOf Me.WindowCascade_Clicked)
miWindow.MenuItems.Add("Tile &Horizontal", AddressOf Me.WindowTileH_Clicked)
miWindow.MenuItems.Add("Tile &Vertical", AddressOf Me.WindowTileV_Clicked)
miWindow.MdiList = true  'Adds the AxHosting Window List to the bottom of the menu

....
'Window->Cascade Menu item handler
Protected Sub WindowCascade_Clicked(sender As object, e As System.EventArgs)
    Me.LayoutMdi(MdiLayout.Cascade)
End Sub

'Window->Tile Horizontally Menu item handler
Protected Sub WindowTileH_Clicked(sender As object, e As System.EventArgs)
    Me.LayoutMdi(MdiLayout.TileHorizontal)
End Sub


'Window->Tile Vertically Menu item handler
Protected Sub WindowTileV_Clicked(sender As object, e As System.EventArgs)
    Me.LayoutMdi(MdiLayout.TileVertical)
End Sub
....
</Tab>

</Acme:TabControl><p>
<br>

<span class="subhead">Child Window Activation</span>

<P>If you want your parent form to be notified when a child window is
activated by the user, you can register an event-handling method for the
<B>MdiChildActivate</B> event.  You can determine which child window is
active by using the <B>ActiveMdiChild</B> property of the <b>Form</b> class.  For
example, the following code updates a <b>StatusBar</b> control on the
parent form with the name of the child window.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
....

this.MdiChildActivate += new EventHandler(this.MdiChildActivated);

....

protected void MdiChildActivated(object sender, System.EventArgs e) {
    statusBar1.Text = this.ActiveMdiChild.Text;
}

....
</Tab>

<Tab Name="VB">
....

AddHandler Me.MdiChildActivate, AddressOf Me.MdiChildActivated

....

Protected Sub MdiChildActivated(sender As object, e As System.EventArgs)
    If (Me.ActiveMdiChild <> Nothing) Then statusBar1.Text = Me.ActiveMdiChild.Text
End Sub

....
</Tab>

</Acme:TabControl><p>
<br>


<span class="subhead">Menu Merging</span>

<P>If a child window has a set of menu items that you want to appear in the
parent window's main menu, you can create a <b>MainMenu</b> as part of
the child window form.  When the child window is activated, its <b>MainMenu</b>
is merged with the <b>MainMenu</b> of the parent window. For example, the
following code creates a <b>Format</b> menu item for each child
window.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
....
MainMenu mainMenu = new MainMenu();
this.Menu = mainMenu;

//Add Formatting Menu
MenuItem miFormat = mainMenu.MenuItems.Add("F&ormat (" + docName + ")");
miFormat.MergeType = MenuMerge.Add ;

//Font Face sub-menu
MenuItem miArial = new MenuItem("&Arial", new EventHandler(this.FormatFont_Clicked));
MenuItem miTimesNewRoman = new MenuItem("&Times New Roman",
                                         new EventHandler(this.FormatFont_Clicked));
MenuItem miTahoma = new MenuItem("&Courier New", new EventHandler(this.FormatFont_Clicked));
miArial.Checked = true ;
miFormatFontChecked = miArial ;
miArial.DefaultItem = true ;

miFormat.MenuItems.Add( "Font &Face"
        , new EventHandler(this.FormatFont_Clicked)
        , (new MenuItem[]{ miArial, miTimesNewRoman, miTahoma }));
....
</Tab>

<Tab Name="VB">
....
Dim mainMenu As MainMenu = New MainMenu()
Me.Menu = mainMenu

'Add Formatting Menu
Dim miFormat As MenuItem = mainMenu.MenuItems.Add("F&ormat (" + docName + ")")
miFormat.MergeType = MenuMerge.Add

'Font Face sub-menu
Dim miArial As MenuItem  = new MenuItem("&Arial", AddressOf Me.FormatFont_Clicked)
Dim miTimesNewRoman As MenuItem  = new MenuItem("&Times New Roman", _
                                                 AddressOf Me.FormatFont_Clicked)
Dim miCourier As MenuItem = new MenuItem("&Courier New", AddressOf Me.FormatFont_Clicked)
miArial.Checked = true
miFormatFontChecked = miArial
miArial.DefaultItem = true

miFormat.MenuItems.Add( "Font &Face" _
        , new EventHandler(AddressOf Me.FormatFont_Clicked)  _
        , (new MenuItem() {miArial, miTimesNewRoman, miCourier }))
....
</Tab>

</Acme:TabControl><p>
<br>

<P>By default, the child window menu is added to the parent window.  You
can control how the merge occurs by using the <B>MergeOrder</B> and
<B>MergeType</B> properties.  For example, the following code creates a
child window menu item called <b>File</b> that is merged with the parent window's <b>File</b>
menu item.</P>


<p><Acme:TabControl runat="server">

<Tab Name="C#">
....

Parent Form:

    //Add File Menu
    MenuItem miFile = mainMenu.MenuItems.Add("&File");
    miFile.MergeOrder=0;
    miFile.MergeType = MenuMerge.MergeItems;

    MenuItem miAddDoc = new MenuItem("&Add Document",
                                      new EventHandler(this.FileAdd_Clicked),
                                      Shortcut.CtrlA);
    miAddDoc.MergeOrder=100;

    MenuItem miExit = new MenuItem("E&xit",
                                    new EventHandler(this.FileExit_Clicked),
                                    Shortcut.CtrlX);
    miExit.MergeOrder=110;

    miFile.MenuItems.Add(miAddDoc);
    miFile.MenuItems.Add("-");     // Gives us a seperator
    miFile.MenuItems.Add(miExit);

....

Child Form:

    //Add File Menu
    MenuItem miFile = mainMenu.MenuItems.Add("&File");
    miFile.MergeType = MenuMerge.MergeItems;
    miFile.MergeOrder = 0;

    MenuItem miLoadDoc = miFile.MenuItems.Add( "&Load Document (" + docName + ")"
                                              , new EventHandler(this.LoadDocument_Clicked));
    miLoadDoc.MergeOrder = 105;

....
</Tab>

<Tab Name="VB">
....

Parent Form:

    'Add File Menu
    Dim miFile As MenuItem = mainMenu.MenuItems.Add("&File")
    miFile.MergeOrder=0
    miFile.MergeType = MenuMerge.MergeItems

    Dim miAddDoc As MenuItem = new MenuItem("&Add Document", _
                                             new EventHandler( AddressOf Me.FileAdd_Clicked), _
                                             Shortcut.CtrlA)
    miAddDoc.MergeOrder=100

    Dim miExit As MenuItem = new MenuItem("E&xit", _
                                           new EventHandler(AddressOf Me.FileExit_Clicked), _
                                           Shortcut.CtrlX)
    miExit.MergeOrder=110

    miFile.MenuItems.Add(miAddDoc)
    miFile.MenuItems.Add("-")     ' Gives us a seperator
    miFile.MenuItems.Add(miExit)

....

Child Form:

    'Add File Menu
    Dim miFile As MenuItem = mainMenu.MenuItems.Add("&File")
    miFile.MergeType = MenuMerge.MergeItems
    miFile.MergeOrder = 0

    Dim miLoadDoc As MenuItem = miFile.MenuItems.Add( "&Load Document (" + docName + ")", _
                                                       AddressOf Me.LoadDocument_Clicked)
    miLoadDoc.MergeOrder = 105

....
</Tab>

</Acme:TabControl><p>
<br>


<span class="subhead">A Simple MDI Application</span>
<P>The following sample illustrates the features mentioned previously.
<br><br>

<p>To view and run this sample:
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/MDI/CS"
        ViewSource="/quickstart/winforms/Samples/MDI/MDI.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# MDI Apps"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/MDI/VB"
        ViewSource="/quickstart/winforms/Samples/MDI/MDI.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB MDI Apps"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>

<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
