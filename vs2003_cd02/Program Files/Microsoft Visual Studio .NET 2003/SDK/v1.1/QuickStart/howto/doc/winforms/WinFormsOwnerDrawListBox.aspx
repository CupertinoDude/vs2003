<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>


<!-- #include virtual="/quickstart/howto/include/WinFormsHeader.inc" -->

<h4>Creating an Owner-Drawn Listbox</h4>

      <P>By default, Listboxes display strings. If you want to display something
      else, such as a bitmap for each item or paint each item in the
      list box in a different color, then you will need to draw each item in your code.
      This is known as an owner-drawn ListBox.</P>
      <P>In order to put a ListBox into owner-drawn mode, you must set the <b>
      DrawMode</b> property to <B>DrawMode.OwnerDrawVariable</B> or
      <B>DrawMode.OwnerDrawFixed</B>. OwnerDrawFixed indicates that the ListBox
      will be owner-drawn and each item in the ListBox will be the same height.
      <b>OwnerDrawVariable</b> indicates that the ListBox will be owner-drawn and each
      item in the ListBox can be a different height.
      <P>There are two events that you need to handle for an owner-drawn list
      box:</P>
      <TABLE border=0 cellPadding=5 class=mydd>
        <TBODY>
        <TR>
          <TD vAlign=top><STRONG>DrawItem</STRONG></TD>
          <TD>
            <P>This event is raised every time the list box needs to paint an
            item. The handler for this event is passed a <B>DrawItemEventArgs</B>
            object. This object contains the information needed to draw the
            ListBox item including a <b> Graphics</b> object, the index of the item to
            be painted, the state of the item to be painted, and the bounds of the
            item to be painted. It also includes utility methods for
            painting the background of the item and its focus
        rectangle.</P>
          </TD></TR>
        <TR>
          <TD vAlign=top><STRONG>MeasureItem</STRONG></TD>
          <TD>
            <P>This event is raised every time a ListBox item is created and the
            size of the list item needs to be determined. You only need to handle
            this event if the Listbox DrawMode is <B>OwnerDrawVariable</B>. The handler for this
            event is passed a
            <B>MeasureItemEventArgs</B> object. This object contains the
            information needed to determine the size of the item, a <b>Graphics</b>
            object, and the index of the item to be measured. To set the height
            and width of each item use the <b>ItemHeight</b> and <b>ItemWidth</b> properties on the <b>MeasureItemEventArgs</b>
            object.</TD></TR></TBODY></TABLE>
      <P>The following example demonstrates how to create an owner-drawn ListBox that displays
      each item in the ListBox in a different color:</P>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
....

//Set the DrawMode and add the event handlers
this.listBox1.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawVariable;
this.listBox1.MeasureItem += new System.Windows.Forms.MeasureItemEventHandler(listBox1_MeasureItem);
this.listBox1.DrawItem += new System.Windows.Forms.DrawItemEventHandler(listBox1_DrawItem);

....

//Return the height of the item to be drawn
private void listBox1_MeasureItem(object sender, MeasureItemEventArgs e) {
    //Work out what the text will be
    string displayText = "ITEM #" + e.Index;

    //Get width & height of string
    SizeF stringSize=e.Graphics.MeasureString(displayText, this.Font);

    //Account for top margin
    stringSize.Height += 6;

    //Now set height to taller of default and text height
    if (listBoxHeights[e.Index] > stringSize.Height)
        e.ItemHeight = listBoxHeights[e.Index];
    else
        e.ItemHeight = (int)stringSize.Height;
}

....

private void listBox1_DrawItem(object sender, DrawItemEventArgs e) {

    // The following method should generally be called before drawing.
    // It is actually superfluous here, since the subsequent drawing
    // will completely cover the area of interest.
    e.DrawBackground();

    //The system provides the context
    //into which the owner custom-draws the required graphics.
    //The context into which to draw is e.graphics.
    //The index of the item to be painted is e.Index.
    //The painting should be done into the area described by e.Bounds.
    Brush brush = listBoxBrushes[e.Index];
    e.Graphics.FillRectangle(brush, e.Bounds);
    e.Graphics.DrawRectangle(SystemPens.WindowText, e.Bounds);

    bool selected = ((e.State & DrawItemState.Selected) == DrawItemState.Selected) ? true : false;

    string displayText = "ITEM #" + e.Index;
    displayText = displayText + (selected ? " SELECTED" : "");

    e.Graphics.DrawString(displayText, this.Font, Brushes.Black, e.Bounds);

    e.DrawFocusRectangle();
}

....














</Tab>

<Tab Name="VB">
....

' Set the DrawMode and add the event handlers
Me.listBox1.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawVariable
AddHandler Me.listBox1.DrawItem, AddressOf Me.listBox1_DrawItem
AddHandler Me.listBox1.MeasureItem, AddressOf Me.listBox1_MeasureItem
....

'Return the height of the item to be drawn
Private Sub listBox1_MeasureItem(ByVal sender As Object, ByVal e As MeasureItemEventArgs)
    Dim displayText As String
    Dim stringSize As SizeF

    'Work out what the text will be
    displayText = "ITEM #" & e.Index

    'Get width & height of string
    stringSize = e.Graphics.MeasureString(displayText, Me.Font)

    'Account for top margin
    stringSize.Height += 6

    If listBoxHeights(e.Index) > stringSize.Height Then
        'Now set height to taller of default and text height
        e.ItemHeight = listBoxHeights(e.Index)
    Else
        e.ItemHeight = CInt(stringSize.Height)
    End If
End Sub

....

Private Sub listBox1_DrawItem(ByVal sender As Object, ByVal e As DrawItemEventArgs)
    Dim brush As Brush
    Dim selected As Boolean
    Dim displayText As String

    ' The following method should generally be called before drawing.
    ' It is actually superfluous here, since the subsequent drawing
    ' will completely cover the area of interest.
    e.DrawBackground()

    'The system provides the context
    'into which the owner custom-draws the required graphics.
    'The context into which to draw is e.graphics.
    'The index of the item to be painted is e.Index.
    'The painting should be done into the area described by e.Bounds.
    brush = listBoxBrushes(e.Index)
    e.Graphics.FillRectangle(brush, e.Bounds)
    e.Graphics.DrawRectangle(SystemPens.WindowText, e.Bounds)

    If (e.State BitAnd DrawItemState.Selected) = DrawItemState.Selected Then
        selected = True
    Else
        selected = False
    End If

    displayText = "ITEM #" & e.Index

    If (selected) Then
        displayText &= " SELECTED"
    End If

    e.Graphics.DrawString(displayText, Me.Font, Brushes.Black, e.Bounds.X, e.Bounds.Y)

    e.DrawFocusRectangle()
End Sub

....

</Tab>

<Tab Name="C++">
....
....

//Return the height of the item to be drawn
void listBox1_MeasureItem(System::Object* sender, System::Windows::Forms::MeasureItemEventArgs* args)
{
	System::String* displayText = new System::String(S"Item #") ;
	displayText = System::String::Concat(displayText, args->Index.ToString());
	//Get Width and height of string
	
	System::Drawing::SizeF stringSize = args->Graphics->MeasureString(displayText, this->Font);
	
	//Account for top margin
	stringSize.Height = stringSize.Height + 6 ;
	
	
	//Now set height to taller of default and text height
	if(listBoxHeights[args->Index] > stringSize.Height)
		{
			args->ItemHeight = listBoxHeights[args->Index] ;
	
		}
	else
		{
			args->ItemHeight = (int) stringSize.Height ;
		}
}

....

void listBox1_DrawItem(System::Object* sender, System::Windows::Forms::DrawItemEventArgs* args)
{
   // The following method should generally be called before drawing.
   // It is actually superfluous here, since the subsequent drawing
   // will completely cover the area of interest.

	args->DrawBackground() ;
	
	System::Drawing::Brush* brush = listBoxBrushes[args->Index] ;
	args->Graphics->FillRectangle(brush, args->Bounds) ;
	args->Graphics->DrawRectangle(System::Drawing::SystemPens::WindowText, args->Bounds) ;
	
	

	bool selected = ((args->State & System::Windows::Forms::DrawItemState::Selected) == System::Windows::Forms::DrawItemState::Selected)?true : false ;

	System::String* displayText = new System::String(S"Item #") ;

	displayText = System::String::Concat(displayText, args->Index.ToString());


	displayText = System::String::Concat(displayText, (selected ? S"SELECTED": "")) ;
		args->Graphics->DrawString(displayText, this->Font, System::Drawing::Brushes::Black, System::Drawing::RectangleF::op_Implicit(args->Bounds));


	args->DrawFocusRectangle() ;

}

....



</Tab>

</Acme:TabControl><p>

<br><br>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/Samples/WinForms/OwnerDrawListBox/CS"
        ViewSource="/quickstart/howto/Samples/WinForms/OwnerDrawListBox/OwnerDrawListBox.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# OwnerDraw ListBox Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/Samples/WinForms/OwnerDrawListBox/VB"
        ViewSource="/quickstart/howto/Samples/WinForms/OwnerDrawListBox/OwnerDrawListBox.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB OwnerDraw ListBox Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

    <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/Samples/WinForms/OwnerDrawListBox/CP"
        ViewSource="/quickstart/howto/Samples/WinForms/OwnerDrawListBox/OwnerDrawListBox.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C++ OwnerDraw ListBox Sample"
        MapRunSamplePath=true
        runat="server" />
    </CpTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
