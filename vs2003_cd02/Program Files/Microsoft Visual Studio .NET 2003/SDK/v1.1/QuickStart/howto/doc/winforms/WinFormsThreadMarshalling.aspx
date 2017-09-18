<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>


<!-- #include virtual="/quickstart/howto/include/WinFormsHeader.inc" -->

<h4>Making procedure calls across thread boundaries</h4>

<P>Windows Forms controls can only execute on the thread on which they were
created, that is, they are not thread-safe.  If you want to get or set properties,
or call methods, on a control from a background thread, the call must be
marshaled to the thread that created the control.</P>

<P>There are five functions on a control that are safe to call from any
thread: <b>InvokeRequired</b>, <b>Invoke</b>, <b>BeginInvoke</b>, <b>
EndInvoke</b> and <b>CreateGraphics</b>.  For all other method calls, you
should use one of the invoke methods.</P>

<P>By default, Windows marshals the calls for you.  However, if you are
making multiple calls to a control, it is much more efficient to create a
method that executes those calls and make the one cross-thread call
yourself.  You make the cross-thread call by calling one of the <b>
Control.Invoke</b> methods.  The <b>Invoke</b> methods take a reference to a
delegate. Typically, this delegate is an instance of the
<B>MethodInvoker</B> delegate.</P>

      <TABLE border=0 cellPadding=5 class=mydd>
        <TBODY>
        <TR>
          <TD vAlign=top><STRONG>InvokeRequired</STRONG></TD>
          <TD>
            <P>public bool InvokeRequired { get ; }</P>
            <P>Returns true if the caller must call Invoke when making method
            calls to this control.</P></TD></TR>
        <TR>
          <TD vAlign=top><STRONG>BeginInvoke</STRONG></TD>
          <TD>
            <P>public IAsyncResult BeginInvoke(Delegate method)<BR>public
            IAsyncResult BeginInvoke(Delegate method, Object[] args)</P>
            <P>Executes the given delegate on the thread that owns this
            Control's underlying window handle. The delegate is called
            asynchronously and this method returns immediately. You can call
            this from any thread, even the thread that owns the control's
            handle. If the control's handle does not exist yet, this will follow
            up the control's parent chain until it finds a control or form that
            does have a window handle. If no appropriate handle can be found,
            <b>BeginInvoke</b> will throw an exception. Exceptions within the delegate
            method are considered untrapped and will be sent to the
            application's untrapped exception handler. </P></TD></TR>
        <TR>
          <TD vAlign=top><STRONG>EndInvoke</STRONG></TD>
          <TD>
            <P>public Object EndInvoke(IAsyncResult
            asyncResult)<BR></P>Retrieves the return value of the asynchronous
            operation represented by the <b>IAsyncResult</b> interface passed. If the
            async operation has not been completed, this function will block
            until the result is available.
            <P></P></TD></TR>
        <TR>
          <TD vAlign=top><STRONG>Invoke</STRONG></TD>
          <TD>
            <P>public Object Invoke(Delegate method)<BR>public Object
            Invoke(Delegate method, Object[] args)<BR>
            <P>Executes the given delegate on the thread that owns this
            control's underlying window handle. The delegate is called
            synchronously and this method returns once the invoked method has
            returned. The return value is the result of the invoked method. It
            is an error to call this on the same thread that the control belongs
            to. </P></TD></TR></TBODY></TABLE><BR>
      <P>The following example demonstrates how to create a background thread that uses a
      <b>
      MethodInvoker</b> to update a <b>ProgressBar</b> control at regular
      intervals:</P>


<p><Acme:TabControl runat="server">
<Tab Name="C#">

 ....

 //Start the background thread
 timerThread = new Thread(new ThreadStart(ThreadProc));
 timerThread.IsBackground = true;
 timerThread.Start();

 ....

 //This function is executed on a background thread - it marshalls calls to
 //update the UI back to the foreground thread
 public void ThreadProc() {

     try {
         MethodInvoker mi = new MethodInvoker(this.UpdateProgress);
         while (true) {

             //Call BeginInvoke on the Form
             this.BeginInvoke(mi);
             Thread.Sleep(500) ;
         }
     }
     //Thrown when the thread is interupted by the main thread - exiting the loop
     catch (ThreadInterruptedException e) {
         //Simply exit....
     }
     catch (Exception we) {
     }
 }

 ....

 //This function is called from the background thread
 private void UpdateProgress() {

     //Reset to start if required
     if (progressBar1.Value == progressBar1.Maximum) {
         progressBar1.Value = progressBar1.Minimum ;
     }


     //Reset to start if required
     progressBar1.PerformStep() ;
 }

 ....

 //Make sure we clean up the background thread in Dispose
 public override void Dispose() {
    if (timerThread != null) {
        timerThread.Interrupt();
        timerThread = null;
    }

    base.Dispose();
}

</Tab>

<Tab Name="VB">

 ....

 ' Start the background thread
 timerThread = new Thread(new ThreadStart(AddressOf ThreadProc))
 timerThread.IsBackground = True
 timerThread.Start()

 ....

 ' This function is executed on a background thread - it marshalls calls to
 ' update the UI back to the foreground thread
 Public Sub ThreadProc()

     Try
         Dim mi As New MethodInvoker(AddressOf Me.UpdateProgress)
         Do While True

             ' Call BeginInvoke on the Form
             Me.BeginInvoke(mi)
             Thread.Sleep(500)
         Loop

     ' Thrown when the thread is interupted by the main thread - exiting the loop
     Catch e As ThreadInterruptedException
         ' Simply exit....

     Catch we As Exception
     End Try
 End Sub

 ....

 ' This function is called from the background thread
 Private Sub UpdateProgress()

     ' Reset to start if required
     If progressBar1.Value = progressBar1.Maximum
         progressBar1.Value = progressBar1.Minimum
     End If


     ' Reset to start if required
     progressBar1.PerformStep()
 End Sub

 ....

 ' Make sure we clean up the background thread in Dispose
 Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
     StopThread()        
     If disposing Then
         If Not (components Is Nothing) Then
             components.Dispose()
         End If
     End If
     MyBase.Dispose(disposing)
 End Sub

</Tab>

<Tab Name="C++">

 ....

Thread* timerThread ;

 ....

//This function is executed on a background thread - it marshalls calls to 
//update the UI back to the foreground thread
void ThreadProc()
{
	try
	{
		MethodInvoker* mi = new MethodInvoker(this, &ThreadMarshal::UpdateProgress) ;
		while(1)
		{
			//Call BeginInvoke on the form
			this->BeginInvoke(mi);
			Thread::Sleep(500) ;
		}
	}
	catch(System::Exception* e)
	{
		//Exit
	}
}

 ....

//This function is called from the background thread
void UpdateProgress()
{
	//Reset to start if required
	if(progressbar->Value == progressbar->Maximum)
	{
		progressbar->Value = progressbar->Minimum ;
	}
	progressbar->PerformStep();
}

 ....

 //Make sure we clean up the background thread in Dispose
~ThreadMarshal()
{
	StopThread();
	this->Dispose() ;
	components->Dispose();
}

</Tab>

</Acme:TabControl><p>

<br><br>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/Samples/WinForms/ThreadMarshal/CS"
        ViewSource="/quickstart/howto/Samples/WinForms/ThreadMarshal/ThreadMarshal.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Threading Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/Samples/WinForms/ThreadMarshal/VB"
        ViewSource="/quickstart/howto/Samples/WinForms/ThreadMarshal/ThreadMarshal.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Threading Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

    <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/Samples/WinForms/ThreadMarshal/CP"
        ViewSource="/quickstart/howto/Samples/WinForms/ThreadMarshal/ThreadMarshal.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C++ Threading Sample"
        MapRunSamplePath=true
        runat="server" />
    </CpTemplate>
</Acme:LangSwitch>



<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
