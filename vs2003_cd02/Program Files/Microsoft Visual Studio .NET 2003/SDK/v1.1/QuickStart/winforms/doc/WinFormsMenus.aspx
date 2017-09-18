<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Adding Menus to a Form</span>

<P>Windows Forms supports menus and context menus.  Main menus are displayed
on a menu bar that is located immediately below the title bar of a form.
The menu bar contains top-level menu items that are used to group related
submenu items.  For example, by clicking a <b>File</b> top-level menu item, you can display
menu items that are related to file operations.  Menu items typically
appear as commands for your application (such as <b>New</b> and <b>Open</b>), but
they can also appear as separator bars and submenu items.  You
can display a check mark next to a menu item to display the state of a
command or a the state of a feature in your application.  In Windows Forms, main menus are
represented by the <B>MainMenu</B> control.</P>

<P>Context menus can be displayed for a specific control or area of your
form.  They are typically accessed by clicking the right mouse button.  In Windows
Forms, context menus are represented by the <B>ContextMenu</B> control.</P>

<P><b>ContextMenu</b> and <b>MainMenu</b> derive from <b>Menu</b>. They
share many properties, methods, and events.</P>

<span class="subhead">Adding a <b>MainMenu</b> to a Form</span>

<P>The following code demonstrates how to add a <b>MainMenu</b> to a form.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
MainMenu mainMenu = new MainMenu();
this.Menu = mainMenu;
</Tab>

<Tab Name="VB">
Dim mainMenu As New MainMenu
Me.Menu = mainMenu
</Tab>

</Acme:TabControl><p>

<span class="subhead">Adding a Context Menu to a Control</span>

<P>The following code demonstrates how to create a <b>ContextMenu</b> and assign
it to a control.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
ContextMenu label1ContextMenu = new ContextMenu();
Label label1 = new Label();
label1.ContextMenu = label1ContextMenu;
</Tab>

<Tab Name="VB">
Dim label1ContextMenu As New ContextMenu
Dim label1 As New Label
label1.ContextMenu = label1ContextMenu
</Tab>

</Acme:TabControl><p>

<span class="subhead">Adding Menu Items</span>

<P>In the following example, a <b>File</b> menu item is added to the <b>MainMenu</b>. The <b>File</b> menu item
contains submenu items called <b>Open</b> and <b>Exit</b>.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
//Add File Menu
MenuItem miFile = mainMenu.MenuItems.Add("&File");
miFile.MenuItems.Add(new MenuItem("&Open..."));
miFile.MenuItems.Add("-");     // Gives us a seperator
miFile.MenuItems.Add(new MenuItem("E&xit"));
</Tab>

<Tab Name="VB">
'Add File Menu
Dim miFile As MenuItem = mainMenu.MenuItems.Add("&File")
miFile.MenuItems.Add(new MenuItem("&Open..."))
miFile.MenuItems.Add("-")     ' Gives us a seperator
miFile.MenuItems.Add(new MenuItem("E&xit"))
</Tab>

</Acme:TabControl><p>
<br>

<P>The following code demonstrates how to handle the <b>Click</b> event for both
the <b>Open</b> and <b>Exit</b> menu items created in the previous code example.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
....
//Add File Menu
MenuItem miFile = mainMenu.MenuItems.Add("&File");
miFile.MenuItems.Add(new MenuItem("&Open...", new EventHandler(this.FileOpen_Clicked), Shortcut.CtrlO));
miFile.MenuItems.Add("-");     // Gives us a seperator
miFile.MenuItems.Add(new MenuItem("E&xit", new EventHandler(this.FileExit_Clicked), Shortcut.CtrlX));
....

//File->Exit Menu item handler
private void FileExit_Clicked(object sender, System.EventArgs e) {
    this.Close();
}

//File->Open Menu item handler
private void FileOpen_Clicked(object sender, System.EventArgs e) {
    MessageBox.Show("And why would this open a file?");
}

....
</Tab>

<Tab Name="VB">
....
'Add File Menu
Dim miFile As MenuItem = mainMenu.MenuItems.Add("&File")
miFile.MenuItems.Add(new MenuItem("&Open...", new EventHandler(AddressOf Me.FileOpen_Clicked)))
miFile.MenuItems.Add("-")     ' Gives us a seperator
miFile.MenuItems.Add(new MenuItem("E&xit", new EventHandler(AddressOf Me.FileExit_Clicked)))
....

'File->Exit Menu item handler
Private Sub FileExit_Clicked(sender As object, e As System.EventArgs)
    Me.Close
End Sub

'File->Open Menu item handler
Private Sub FileOpen_Clicked(sender As object, e As System.EventArgs)
    MessageBox.Show("And why would this open a file?")
End Sub

....
</Tab>

</Acme:TabControl><p>
<br>

<P>The following example demonstrates how to define shortcut keys for the
menu items created in the previous example.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
....
//Add File Menu
MenuItem miFile = mainMenu.MenuItems.Add("&File");

miFile.MenuItems.Add(new MenuItem("&Open...",
        new EventHandler(this.FileOpen_Clicked), Shortcut.CtrlO));

miFile.MenuItems.Add("-");     // Gives us a seperator

miFile.MenuItems.Add(new MenuItem("E&xit",
        new EventHandler(this.FileExit_Clicked), Shortcut.CtrlX));
....
</Tab>

<Tab Name="VB">
....
'Add File Menu
Dim miFile As MenuItem = mainMenu.MenuItems.Add("&File")

miFile.MenuItems.Add(new MenuItem("&Open...", _
        New EventHandler(AddressOf Me.FileOpen_Clicked), Shortcut.CtrlO))

miFile.MenuItems.Add("-")     ' Gives us a seperator

miFile.MenuItems.Add(new MenuItem("E&xit", _
        New EventHandler(AddressOf Me.FileExit_Clicked), Shortcut.CtrlX))
....
</Tab>

</Acme:TabControl><p>

<span class="subhead">Adding Submenus</span>
<P>The following example demonstrates how to create submenus.</P>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
//Add Format Menu
MenuItem miFormat = mainMenu.MenuItems.Add("F&ormat");

//Font Face sub-menu
mmiSansSerif = new MenuItem("&1. " + sansSerifFontFamily.Name, new EventHandler(this.FormatFont_Clicked));
mmiSerif = new MenuItem("&2. " + serifFontFamily.Name, new EventHandler(this.FormatFont_Clicked));
mmiMonoSpace = new MenuItem("&3. " + monoSpaceFontFamily.Name, new EventHandler(this.FormatFont_Clicked));

miFormat.MenuItems.Add( "Font &Face",
                        (new MenuItem[]{ mmiSansSerif, mmiSerif, mmiMonoSpace })
                        );

//Font Size sub-menu
MenuItem miSmall = new MenuItem("&Small", new EventHandler(this.FormatSize_Clicked));
MenuItem miMedium = new MenuItem("&Medium", new EventHandler(this.FormatSize_Clicked));
MenuItem miLarge = new MenuItem("&Large", new EventHandler(this.FormatSize_Clicked));

miFormat.MenuItems.Add( "Font &Size"
                      , new EventHandler(this.FormatSize_Clicked)
                      , (new MenuItem[]{ miSmall, miMedium, miLarge }));
</Tab>

<Tab Name="VB">
'Add Format Menu
Dim miFormat As MenuItem = mainMenu.MenuItems.Add("F&ormat")

'Font Face sub-menu
mmiSansSerif = New MenuItem("&1. " & sansSerifFontFamily.Name, New EventHandler(AddressOf Me.FormatFont_Clicked))
mmiSerif = New MenuItem("&2. " & serifFontFamily.Name, New EventHandler(AddressOf Me.FormatFont_Clicked))
mmiMonoSpace = New MenuItem("&3. " & monoSpaceFontFamily.Name, New EventHandler(AddressOf Me.FormatFont_Clicked))

miFormat.MenuItems.Add("Font &Face" _
                      , (New MenuItem() {mmiSansSerif, mmiSerif, mmiMonoSpace}))

'Font Size sub-menu
mmiSmall = New MenuItem("&Small", AddressOf Me.FormatSize_Clicked)
mmiMedium = New MenuItem("&Medium", AddressOf Me.FormatSize_Clicked)
mmiLarge = New MenuItem("&Large", AddressOf Me.FormatSize_Clicked)

miFormat.MenuItems.Add( "Font &Size" _
                      , New EventHandler(AddressOf Me.FormatSize_Clicked) _
                      , (New MenuItem(){ mmiSmall, mmiMedium, mmiLarge }) _
                      )
</Tab>

</Acme:TabControl><p>
<br>

<span class="subhead">Adding Default Menu Items</span>

<P>The following example demonstrates how to specify a default menu item.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
//Add Format Menu
mmiSansSerif = new MenuItem("&1. " + sansSerifFontFamily.Name, new EventHandler(this.FormatFont_Clicked));
mmiSansSerif.DefaultItem = true ;
</Tab>

<Tab Name="VB">
'Font Face sub-menu
mmiSansSerif = New MenuItem("&1. " & sansSerifFontFamily.Name, New EventHandler(AddressOf Me.FormatFont_Clicked))
mmiSansSerif.DefaultItem = True
</Tab>

</Acme:TabControl><p>
<br>
<span class="subhead">Adding Check Marks to Menu Items</span>

<P>The following example demonstrates how to display a check mark next to
a menu item. The code also demonstrates how to track which item is
checked.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
//Add Format Menu
MenuItem miMedium = new MenuItem("&Medium", new EventHandler(this.FormatSize_Clicked));
miMedium.Checked = true;

....


private void FormatSize_Clicked(object sender, System.EventArgs e) {
    MenuItem miClicked = (MenuItem)sender;

    // Uncheck old selection
    miMainFormatSizeChecked.Checked = false;

    //Do Menu item action and make a new selection
    ....
    miMainFormatSizeChecked = miSmall;
    ....

    // Check the new selection
    miMainFormatSizeChecked.Checked = true;
}
</Tab>

<Tab Name="VB">
' Add Format Menu
Dim miMedium As MenuItem = new MenuItem("&Medium", AddressOf Me.FormatSize_Clicked)
miMedium.Checked = True

....


Private Sub FormatSize_Clicked(sender As object, e As System.EventArgs)
    Dim miClicked As MenuItem = CType(sender, MenuItem)

    ' Uncheck old selection
    miMainFormatSizeChecked.Checked = False

    ' Do Menu item action and make a new selection
    ....
    miMainFormatSizeChecked = miSmall
    ....

    ' Check the new selection
    miMainFormatSizeChecked.Checked = True
End Sub
</Tab>

</Acme:TabControl><p>
<br>

<span class="subhead">Cloning Menus</span>

<P>In many cases, the context menu for a control is a subset of the
main menu.  You cannot add the same menu items to multiple menus, but you
can clone a menu item or set of menu items.  The following code
demonstrates how to clone the <b>Format</b> menu created previously and add it
to the context menu of a <b>Label</b>.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
//Add Format to label context menu
//Note have to add a clone because menus can't belong to 2 parents

label1ContextMenu.MenuItems.Add(miFormat.CloneMenu());
</Tab>

<Tab Name="VB">
'Add Format to label context menu
'Note have to add a clone because menus can't belong to 2 parents

label1ContextMenu.MenuItems.Add(miFormat.CloneMenu)
</Tab>

</Acme:TabControl><p>
<br>

<span class="subhead">Menu Merging</span>

<P>In an MDI application, the main menu of each MDI child form is merged
into the main menu of the MDI parent form.  See the <a
href=WinFormsMDI.aspx>MDI QuickStart</a> for an example of menu merging.
<BR>

<br>

<span class="subhead">Menu Sample</span>
<P>The following sample illustrates the features mentioned previously.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Menus/CS"
        ViewSource="/quickstart/winforms/Samples/Menus/Menus.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Menus and Context Menus"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Menus/VB"
        ViewSource="/quickstart/winforms/Samples/Menus/Menus.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Menus and Context Menus"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
