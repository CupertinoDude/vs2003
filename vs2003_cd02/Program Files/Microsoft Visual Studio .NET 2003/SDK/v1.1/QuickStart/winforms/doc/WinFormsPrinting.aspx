<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->


<span class="header">Printing with Windows Forms</span>
<p>
<span class="subhead">Important Printing Classes:</span>

<table class=mydd border=0 cellpadding=5>
 <tr>
  <td valign=top><strong>PrintDocument</strong></td>
  <td>
        <p><b>PrintDocument</b> is used to send output to a printer. You instantiate a <b>PrintDocument</b>, set some
        properties describing what to print, and call the <b>Print</b> method. The <b>PrintDocument</b> raises a
        <b>PrintPage</b> event for each page to be printed. You add your printing logic to an event handler for
        this event.</p>
  </td>
 </tr>
 <tr>
  <td valign=top><strong>PrinterSettings</strong></td>
  <td>
        <p>Information about how a document should be printed. This includes which printer to print it on.</p>
  </td>
 </tr>
 <tr>
  <td valign=top><strong>PageSettings</strong></td>
  <td valign=top>
        <p>Information about how a page should be printed.</p>
  </td>
 </tr>
 <tr>
  <td valign=top><strong>PrintPageEventArgs</strong></td>
  <td valign=top>
  <p>The data for the <b>PrintPage</b> event on <b>PrintDocument</b>. It
  provides a clipping rectangle and a <b>Graphics</b> object for the printing surface.</p>
  </td>
 </tr>
 <tr>
  <td valign=top>
  <strong>PrintEventArgs</strong></td>
  <td valign=top>
  <p>The data for the <b>BeginPrint</b> and <b>EndPrint</b> events on
  <b>PrintDocument</b>. Allows the print job to be cancelled.</p>
  </td>
 </tr>
 <tr>
  <td valign=top><strong>PrintDialog</strong></td>
  <td valign=top>
  <p>Printer selection dialog. Wraps the Win32 <i>PrintDlg</i> API.</p>
  </td>
 </tr>
 <tr>
  <td valign=top><strong>PageSetupDialog</strong></td>
  <td valign=top>
  <p>Page properties dialog. Wraps the Win32 <i>PageSetupDlg</i> API.</p>
  </td>
 </tr>
 <tr>
  <td valign=top><strong>PrintPreviewControl</strong></td>
  <td valign=top>
  <p>A control that displays a <b>PrintDocument</b>. Allows the
  creation of a print preview dialog.</p>
  </td>
 </tr>
 <tr>
  <td valign=top><strong>PrintPreviewDialog</strong></td>
  <td valign=top>
  <p>A dialog that displays a <b>PrintDocument</b> by using the <b>PrintPreviewControl</b>.</p>
  </td>
 </tr>
 <tr>
  <td valign=top><strong>PrintController</strong></td>
  <td valign=top>
  <p>A <b>PrintController</b> controls how a <b>PrintDocument</b> is printed. <b>PrintDocument.Print</b>
  uses a print control to render the document.</p>

  <p>The .NET Framework provides two print controllers:</p>
  <ul>
  <li><b>DefaultPrintController</b> renders to a printer.</li>
  <li><b>PreviewPrintController</b> renders to the <b>PrintPreviewControl</b>.</li>
  </ul>
  <p>Typically, you never have to implement a <b>PrintController</b>. You
  implement a <b>PrintController</b> only if you want to render to a different surface.</p>
  </td>
 </tr>
</table>
</>

<span class="subhead">Building an Application that Prints</span>
<p>The easiest way to understand how the printing classes fit
together is to work through a simple example that prints the contents of a text
file to a printer.</p>

<span class="subhead">Step 1: Print Logic</span>
<p>The first thing you need to do is to write your printing
logic. You do this by handling events on a <b>PrintDocument</b>. When the <b>PrintDocument.Print()</b> method is called,
the following events are raised:

<ul>
<li><b>BeginPrint</b></li>
<li><b>PrintPage</b> (one or more)</li>
<li><b>EndPrint</b></li>
</ul>

<p>The <b>PrintPage</b> event arguments type (<b>PrintPageEventArgs</b>) has a <b>HasMorePages</b> property. If this 
is set to <b>true</b> when your event handler returns, <b>PrintDocument</b> sets up a new page and raises the <b>PrintPage</b> event again.
<p>Therefore, the logic in your <b>PrintPage</b> event handler is basically the following:
<ul>
<li>Print the contents of the page using the information in the event arguments. The event
arguments contain the <b>Graphics</b> for the printer, the <b>PageSettings</b> for that page,
the bounds of the page, and the size of the margins.
<li>Determine whether there are more pages to print.
<li>If there are more pages, set <b>HasMorePages</b> to <b>true</b>.
<li>If there are not more pages, set <b>HasMorePages</b> to <b>false</b>.
</ul>
<p>In the simplest case, you can create a <b>PrintDocument</b> and handle the <b>PrintPage</b> event as part
of the <b>Form</b> that contains the print request.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
//Example Form that Prints</span>
  public class PrintCtl : Form {

      Private string[] printBuffer ;
      Private Font printFont;
      Private int startLine;

      //Event fired when the user presses the print button</span>
      private void print_Click(object sender, EventArgs e) {

          fileToPrint = new StreamReader ("PrintMe.Txt");
          try {
              printFont = new Font("Arial", 10);
              PrintDocument pd = new PrintDocument(); //Assumes the default printer</span>
              pd.PrintPage += new PrintPageEventHandler(this.pd_PrintPage);
              pd.Print();
          } finally {
              fileToPrint.Close() ;
          }

      }

      //Event fired for each page to print</span>
      private void pd_PrintPage(object sender, PrintPageEventArgs ev) {
         float lpp = 0 ;
         float yPos =  0 ;
         int count = 0 ;
         float leftMargin = ev.MarginBounds.Left;
         float topMargin = ev.MarginBounds.Top;
         String line=null;

         //Work out the number of lines per page </span>
         //Use the MarginBounds on the event to do this</span>
         lpp = ev.MarginBounds.Height  / printFont.GetHeight(ev.Graphics) ;</span>

         //Now iterate over the file printing out each line </span>
         //NOTE WELL: This assumes that a single line is not wider than the page width </span>
         //Check count first so that we don't read line that we won't print </span>
         while (count < lpp && ((line=streamToPrint.ReadLine()) != null)) {
             yPos = topMargin + (count * printFont.GetHeight(ev.Graphics));

             //Print Preview control will not work.
             ev.Graphics.DrawString (line, printFont, Brushes.Black, leftMargin,
                                     yPos, new StringFormat());

             count++;
         }

         //If we have more lines then print another page </span>
         if (line != null)
             ev.HasMorePages = true ;
         else
             ev.HasMorePages = false ;
      }

      ....
  }
</Tab>

<Tab Name="VB">
Public Class PrintingExample1
    Inherits System.Windows.Forms.Form

    ....

    private printFont As Font
    private streamToPrint As StreamReader

    Public Sub New ()
        MyBase.New
        InitializeComponent()
    End Sub

    'Event fired when the user presses the print button
    Private Sub printButton_Click(sender As object, e As System.EventArgs)

        Try
            streamToPrint = new StreamReader ("PrintMe.Txt")
            Try
                printFont = new Font("Arial", 10)
                Dim pd as PrintDocument = new PrintDocument() 'Assumes the default printer
                AddHandler pd.PrintPage, AddressOf Me.pd_PrintPage
                pd.Print()
            Finally
                streamToPrint.Close()
            End Try

        Catch ex As Exception
            MessageBox.Show("An error occurred printing the file - " + ex.Message)
        End Try

    End Sub

    'Event fired for each page to print
    Private Sub pd_PrintPage(sender As object, ev As System.Drawing.Printing.PrintPageEventArgs)

        Dim lpp As Single = 0
        Dim yPos As Single =  0
        Dim count As Integer = 0
        Dim leftMargin As Single = ev.MarginBounds.Left
        Dim topMargin As Single = ev.MarginBounds.Top
        Dim line as String

        'Work out the number of lines per page
        'Use the MarginBounds on the event to do this
        lpp = ev.MarginBounds.Height  / printFont.GetHeight(ev.Graphics)

        'Now iterate over the file printing out each line
        'NOTE WELL: This assumes that a single line is not wider than the page width
        'Check count first so that we don't read line that we won't print
        line=streamToPrint.ReadLine()
        while (count < lpp AND line <> Nothing)

            yPos = topMargin + (count * printFont.GetHeight(ev.Graphics))

            'Print Preview control will not work.
            ev.Graphics.DrawString (line, printFont, Brushes.Black, leftMargin, _
                                    yPos, new StringFormat())

            count = count + 1

            if (count < lpp) then
                line=streamToPrint.ReadLine()
            end if

        End While

        'If we have more lines then print another page
        If (line <> Nothing) Then
            ev.HasMorePages = True
        Else
            ev.HasMorePages = False
        End If

    End Sub

    ....

End Class
</Tab>

</Acme:TabControl><p>


<p>To view and run this sample.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example1/CS"
        ViewSource="/quickstart/winforms/Samples/Printing/Example1/PrintingExample1.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Simple Printing Sample1"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example1/VB"
        ViewSource="/quickstart/winforms/Samples/Printing/Example1/PrintingExample1.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Simple Printing Sample1"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>
<br>

<span class="subhead">Step 2: Defining Your Own Print Document</span>

<p>For a complex print job, or a print logic that you wish to reuse across multiple forms, you
can derive a new class from <b>PrintDocument</b> and encapsulate your printing logic in that class.
In this case, you handle the <b>PrintPage</b> event by overriding the <b>OnPrintPage</b> method, rather than using an
event handler.</p>
<br>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
public class TextFilePrintDocument : PrintDocument {

    private Font printFont           = null ;
    private StreamReader streamToPrint = null ;

    public TextFilePrintDocument(StreamReader streamToPrint) : base ()  {
        this.streamToPrint = streamToPrint ;
    }

    //Override OnBeginPrint to set up the font we are going to use</span>
    protected override void OnBeginPrint(PrintEventArgs ev) {
        base.OnBeginPrint(ev) ;
        printFont = new Font("Arial", 10);
    }

    //Override the OnPrintPage to provide the printing logic for the document</span>
    protected override void OnPrintPage(PrintPageEventArgs ev) {

        base.OnPrintPage(ev) ;

        float lpp = 0 ;
        float yPos =  0 ;
        int count = 0 ;
        float leftMargin = ev.MarginBounds.Left;
        float topMargin = ev.MarginBounds.Top;
        String line=null;

        //Work out the number of lines per page </span>
        //Use the MarginBounds on the event to do this </span>
        lpp = ev.MarginBounds.Height  / printFont.GetHeight(ev.Graphics) ;

        //Now iterate over the file printing out each line</span>
        //NOTE WELL: This assumes that a single line is not wider than the page width</span>
        //Check count first so that we don't read line that we won't print</span>
        while (count < lpp && ((line=streamToPrint.ReadLine()) != null)) {
            yPos = topMargin + (count * printFont.GetHeight(ev.Graphics));

            //Print Preview control will not work.
            ev.Graphics.DrawString (line, printFont, Brushes.Black, leftMargin,
                                    yPos, new StringFormat());

            count++;
        }

        //If we have more lines then print another page</span>
        if (line != null)
            ev.HasMorePages = true ;
        else
            ev.HasMorePages = false ;
    }

}












</Tab>

<Tab Name="VB">
Public Class TextFilePrintDocument
    Inherits PrintDocument

    Private printFont As Font
    Private streamToPrint As StreamReader

    Public Sub New(streamToPrint As StreamReader)
        MyBase.New
        Me.streamToPrint = streamToPrint
    End Sub

    'Override OnBeginPrint to set up the font we are going to use
    Overrides Protected Sub OnBeginPrint(ev As PrintEventArgs)
        MyBase.OnBeginPrint(ev)
        printFont = new Font("Arial", 10)
    End Sub

    'Override the OnPrintPage to provide the printing logic for the document
    Overrides Protected Sub OnPrintPage(ev As PrintPageEventArgs)

        MyBase.OnPrintPage(ev)

        Dim lpp As Single = 0
        Dim yPos As Single =  0
        Dim count As Integer = 0
        Dim leftMargin As Single = ev.MarginBounds.Left
        Dim topMargin As Single = ev.MarginBounds.Top
        Dim line as String

        'Work out the number of lines per page
        'Use the MarginBounds on the event to do this
        lpp = ev.MarginBounds.Height / printFont.GetHeight(ev.Graphics)

        'Now iterate over the file printing out each line
        'NOTE WELL: This assumes that a single line is not wider than the page width
        'Check count first so that we don't read line that we won't print
        line = streamToPrint.ReadLine()
        While (count < lpp And line <> Nothing)

            yPos = topMargin + (count * printFont.GetHeight(ev.Graphics))

            ev.Graphics.DrawString(line, printFont, Brushes.Black, leftMargin, _
                                   yPos, New StringFormat())

            count = count + 1

            If (count < lpp) Then
                line = streamToPrint.ReadLine()
            End If

        End While

        'If we have more lines then print another page
        If (line <> Nothing) Then
            ev.HasMorePages = True
        Else
            ev.HasMorePages = False
        End If

    End Sub

End Class
</Tab>

</Acme:TabControl><p>


<p>To view and run this sample.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example2/CS"
        ViewSource="/quickstart/winforms/Samples/Printing/Example2/PrintingExample2.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Simple Printing Sample2"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example2/VB"
        ViewSource="/quickstart/winforms/Samples/Printing/Example2/PrintingExample2.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Simple Printing Sample2"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>
<br>

<span class="subhead">Step 3: Allowing the User to Choose a Printer</span>

<p>When you have your print logic working, the next step is to allow the user to choose a printer with the
Windows <b>Print</b> dialog. To do this, you create a <b>PrintDocument</b> and pass it to the <b>PrintDialog</b>.
</p>
<br>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
//Event fired when the user presses the print button</span>
private void printButton_Click(object sender, EventArgs e) {
    StreamReader streamToPrint = new StreamReader ("PrintMe.Txt");
    try {
         //Assumes the default printer</span>
         TextFilePrintDocument pd = new TextFilePrintDocument(streamToPrint);

        PrintDialog dlg = new PrintDialog() ;
        dlg.Document = pd;
        DialogResult result = dlg.ShowDialog();

        if (result == DialogResult.OK) {
            pd.Print();
        }

    } finally {
        streamToPrint.Close() ;
    }
}






</Tab>

<Tab Name="VB">
Private Sub printButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    Try
        Dim streamToPrint As StreamReader = New StreamReader("PrintMe.Txt")
        Try
            'Assumes the default printer
            Dim pd As TextFilePrintDocument = New TextFilePrintDocument(streamToPrint)

            Dim dlg As New PrintDialog()
            dlg.Document = pd
            Dim result As DialogResult = dlg.ShowDialog()

            If (result = System.Windows.Forms.DialogResult.OK) Then
                pd.Print()
            End If

        Finally
            streamToPrint.Close()
        End Try

    Catch ex As Exception
        MessageBox.Show("An error occurred printing the file - " + ex.Message)
    End Try

End Sub
</Tab>
</Acme:TabControl><p>


<p>To view and run this sample.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example3/CS"
        ViewSource="/quickstart/winforms/Samples/Printing/Example3/PrintingExample3.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Simple Printing Sample3"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example3/VB"
        ViewSource="/quickstart/winforms/Samples/Printing/Example3/PrintingExample3.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Simple Printing Sample3"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>
<br>

<span class="subhead">Step 4: Allowing the User to Choose Page Settings</span>

<p>Once the user can choose a printer and print a document, you can allow them to choose
page settings, such as the orientation of the paper or the size of the margins. To do this, you create
a <b>PageSettings</b> instance and pass it to the <b>PageSetupDialog</b>.
</p>
<br>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
//Event fired when the user presses the page setup button</span>
private void pageSetupButton_Click(object sender, EventArgs e) {

    PageSetupDialog psDlg = new PageSetupDialog() ;

    if (storedPageSettings == null) {
        storedPageSettings =  new PageSettings();
    }

    psDlg.PageSettings = storedPageSettings ;
    psDlg.ShowDialog();
}





</Tab>

<Tab Name="VB">
'Event fired when the user presses the page setup button
Private Sub pageSetupButton_Click(sender As object, e As System.EventArgs)

    Try
        Dim psDlg As New PageSetupDialog

        If (storedPageSettings Is Nothing) Then
            storedPageSettings = new PageSettings()
        End If

        psDlg.PageSettings = storedPageSettings
        psDlg.ShowDialog
    Catch ex As Exception
        MessageBox.Show("An error occurred - " + ex.Message)
    End Try

End Sub
</Tab>

</Acme:TabControl><p>

<p>You can then use this custom <b>PageSettings</b> instance when the user prints the document.</p>
<br>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
//Event fired when the user presses the print button</span>
private void printButton_Click(object sender, EventArgs e) {
    StreamReader streamToPrint = new StreamReader ("PrintMe.Txt");
    try {
        TextFilePrintDocument pd = new TextFilePrintDocument(streamToPrint);

        if (storedPageSettings != null) {
            pd.DefaultPageSettings = storedPageSettings ;
        }

        PrintDialog dlg = new PrintDialog() ;
        dlg.Document = pd;
        DialogResult result = dlg.ShowDialog();

        if (result == DialogResult.OK) {
            pd.Print();
        }

    } finally {
        streamToPrint.Close() ;
    }
}









</Tab>

<Tab Name="VB">
'Event fired when the user presses the print button
Private Sub printButton_Click(sender As object, e As System.EventArgs)

    Try
        Dim streamToPrint As StreamReader = new StreamReader ("PrintMe.Txt")
        Try
            'Assumes the default printer
            Dim pd As TextFilePrintDocument = new TextFilePrintDocument(streamToPrint)

            If Not (storedPageSettings Is Nothing) Then
                pd.DefaultPageSettings = storedPageSettings
            End If


            Dim dlg As New PrintDialog()
            dlg.Document = pd
            Dim result As DialogResult = dlg.ShowDialog()

            If (result = System.Windows.Forms.DialogResult.OK) Then
                pd.Print()
            End If

        Finally
            streamToPrint.Close()
        End Try

    Catch ex As Exception
        MessageBox.Show("An error occurred printing the file - " + ex.Message)
    End Try

End Sub
</Tab>

</Acme:TabControl><p>


<p>To view and run this sample.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example4/CS"
        ViewSource="/quickstart/winforms/Samples/Printing/Example4/PrintingExample4.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Simple Printing Sample4"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example4/VB"
        ViewSource="/quickstart/winforms/Samples/Printing/Example4/PrintingExample4.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Simple Printing Sample4"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>
<br>

<a name="Example5">
<span class="subhead">Step 5: Displaying a Print Preview Window</span>

<p>The Print Preview window allows a user to preview their document before printing it. You can add
a Print Preview window to your application by creating a <b>PrintDocument</b> and passing it to the <b>PrintPreview</b> dialog.
</p>
<br>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
//Event fired when the user presses the print preview button</span>
private void printPreviewButton_Click(object sender, EventArgs e) {

    StreamReader streamToPrint = new StreamReader ("PrintMe.Txt");
    try {
        TextFilePrintDocument pd = new TextFilePrintDocument(streamToPrint);

        if (storedPageSettings != null) {
            pd.DefaultPageSettings = storedPageSettings ;
        }

        PrintPreviewDialog dlg = new PrintPreviewDialog() ;
        dlg.Document = pd;
        dlg.ShowDialog();

    } finally {
        streamToPrint.Close() ;
    }
}







</Tab>

<Tab Name="VB">
'Event fired when the user presses the print preview button
Private Sub printPreviewButton_Click(sender As object, e As System.EventArgs)

    Try
        Dim streamToPrint As StreamReader = new StreamReader ("PrintMe.Txt")
        Try
            'Assumes the default printer
            Dim pd As TextFilePrintDocument = new TextFilePrintDocument(streamToPrint)

            If Not (storedPageSettings Is Nothing) Then
                pd.DefaultPageSettings = storedPageSettings
            End If

            Dim dlg As New PrintPreviewDialog()
            dlg.Document = pd
            dlg.ShowDialog()

        Finally
            streamToPrint.Close()
        End Try

    Catch ex As Exception
        MessageBox.Show("An error occurred - " + ex.Message)
    End Try

End Sub
</Tab>

</Acme:TabControl><p>

<p>To view and run this sample.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example5/CS"
        ViewSource="/quickstart/winforms/Samples/Printing/Example5/PrintingExample5.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Simple Printing Sample5"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example5/VB"
        ViewSource="/quickstart/winforms/Samples/Printing/Example5/PrintingExample5.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Simple Printing Sample5"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>
<br>

<span class="subhead">Putting it All Together</span>

<p>The Windows Forms samples include a sample called <B>SimplePad</b> that shows how to build a simple
text editor that prints the file that is being edited.</p>
<br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/SimplePad/CS"
        ViewSource="/quickstart/winforms/Samples/Printing/SimplePad/SimplePad.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# SimplePad"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/SimplePad/VB"
        ViewSource="/quickstart/winforms/Samples/Printing/SimplePad/SimplePad.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB SimplePad"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>



<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
