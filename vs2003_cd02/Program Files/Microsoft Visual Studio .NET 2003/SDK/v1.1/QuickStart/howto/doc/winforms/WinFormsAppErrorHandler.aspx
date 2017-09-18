<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>


<!-- #include virtual="/quickstart/howto/include/WinFormsHeader.inc" -->

<h4>Adding an error handler for untrapped exceptions</h4>

<P>In your application design you might want to register an exception
handler for any exceptions you have not handled in your application.  You
can create an exception handler for your unhandled exceptions by
calling the <B>Application.AddOnThreadException</B> method and passing in
a reference to a method in your application.  This method will then be
called for any unhandled exceptions on that thread.  The
<B>OnThreadException</B> event is raised when the Windows Forms window
procedure receives an exception.</P>

<P>Windows Forms provides a default exception handler and exception handling
dialog named <B>ThreadExceptionDialog</B>.  This dialog can be used during
development, but you will want to supply your own custom exception handlers
for your application when it is near completion.</P>

<P>The following example demonstrates how to create a very simple custom
exception handler that displays the exception message and stack trace in a
<b>MessageBox</b>:</P>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
//The Error Handler class
//We need a class because event handling methods can't be static
internal class CustomExceptionHandler {

    //Handle the exception event
    public void OnThreadException(object sender, ThreadExceptionEventArgs t) {

        DialogResult result = DialogResult.Cancel;
        try {
            result = this.ShowThreadExceptionDialog(t.Exception);
        }
        catch {
            try {
                MessageBox.Show("Fatal Error",
                                "Fatal Error",
                                MessageBoxButtons.AbortRetryIgnore,
                                MessageBoxIcon.Stop);
            }
            finally {
                Application.Exit();
            }
        }

        if (result == DialogResult.Abort)
            Application.Exit();

    }

    //The simple dialog that is displayed when this class catches and exception
    private DialogResult ShowThreadExceptionDialog(Exception e) {
        string errorMsg = "An error occurred please contact the adminstrator with" +
                          " the following information:\n\n";
        errorMsg += e.Message + "\n\nStack Trace:\n" + e.StackTrace;
        return MessageBox.Show(errorMsg,
                                "Application Error",
                                MessageBoxButtons.AbortRetryIgnore,
                                MessageBoxIcon.Stop);
    }
}

....

//Register the custom error handler as soon as we can in Main
//to make sure that we catch as many exceptions as possible
public static void Main(string[] args) {
    CustomExceptionHandler eh = new CustomExceptionHandler();
    Application.ThreadException += new ThreadExceptionEventHandler(eh.OnThreadException);
    Application.Run(new ErrorHandler());
}
</Tab>

<Tab Name="VB">
' The Error Handler class
' We need a class because event handling methods can't be static
Friend Class CustomExceptionHandler

    ' Handle the exception event
    Public Sub OnThreadException(Sender As Object , t As ThreadExceptionEventArgs)

        Dim result As DialogResult = DialogResult.Cancel
        Try
            result = Me.ShowThreadExceptionDialog(t.Exception)
        Catch
            Try
                MessageBox.Show("Fatal Error", 
                                "Fatal Error", 
                                MessageBoxButtons.AbortRetryIgnore, 
                                MessageBoxIcon.Stop)
            Finally
                Application.Exit()
            End Try
        End Try

        If (result = DialogResult.Abort) Then
            Application.Exit()
        End If

    End Sub

    ' The simple dialog that is displayed when this class catches and exception
    Private Function ShowThreadExceptionDialog(ByVal e As Exception) As DialogResult
        Dim errorMsg As String = "An error occurred please contact the adminstrator with" & _
                                 " the following information:" & vbCrLf & vbCrLf
        errorMsg &= e.Message & vbCrLf & vbCrLf & "Stack Trace:" & _
                    vbCrLf & e.StackTrace
        Return MessageBox.Show(errorMsg, _
                                "Application Error", _
                                MessageBoxButtons.AbortRetryIgnore, _
                                MessageBoxIcon.Stop)
    End Function
End Class

....

' Register the custom error handler as soon as we can in Main
' to make sure that we catch as many exceptions as possible
Public Shared Sub Main()
    'Explicitly set apartment state to Single Thread Apartment (STA)
    System.Threading.Thread.CurrentThread.ApartmentState = System.Threading.ApartmentState.STA
    Dim eh As New CustomExceptionHandler()
    AddHandler Application.ThreadException, AddressOf eh.OnThreadException
    Application.Run(New ErrorHandler())
End Sub
</Tab>

<Tab Name="C++">
//The Error Handler class

__gc class CustomExceptionHandler
{
private:
	DialogResult ShowThreadExceptionDialog(System::Exception* e)
	{
		System::String* errorMsg = S"An error occurred please contact the adminstrator with the following information:\n\n" ;
	
		errorMsg = System::String::Concat(errorMsg, e->Message);
		errorMsg = System::String::Concat(errorMsg, S"\nStack Trace: \n\n");
		errorMsg = System::String::Concat(errorMsg, e->StackTrace);
			
		return MessageBox::Show(errorMsg, "Application Error", MessageBoxButtons::AbortRetryIgnore, MessageBoxIcon::Stop);
	}

public:
	void OnThreadException(System::Object* sender, System::Threading::ThreadExceptionEventArgs* t)
	{
		DialogResult result = DialogResult::Cancel ;
		try
		{
			result = this->ShowThreadExceptionDialog(t->Exception);
		}
		catch(System::Exception* e)
		{
			
			MessageBox::Show("Fatal Error", "Fatal Error", MessageBoxButtons::AbortRetryIgnore, MessageBoxIcon::Stop) ;
	
			Application::Exit();
			
		}

		if(result == DialogResult::Abort)
		{
			Application::Exit();
		
		}
	}

};

....

//Register the custom error handler as soon as we can in Main
//to make sure that we catch as many exceptions as possible
#ifdef _UNICODE
int wmain(void)
#else
int main(void)
#endif
{
	
	CustomExceptionHandler* eh = new CustomExceptionHandler();
	
	ErrorHandler* errorhandler = new ErrorHandler();
	Application::add_ThreadException(new System::Threading::ThreadExceptionEventHandler(eh, &CustomExceptionHandler::OnThreadException ));


	Application::Run(errorhandler) ;
	
	return 0;
}
</Tab>

</Acme:TabControl><p>

<br><Br>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/Samples/WinForms/ErrorHandler/CS"
        ViewSource="/quickstart/howto/Samples/WinForms/ErrorHandler/ErrorHandler.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Error Handling Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/Samples/WinForms/ErrorHandler/VB"
        ViewSource="/quickstart/howto/Samples/WinForms/ErrorHandler/ErrorHandler.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Error Handling Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

    <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/Samples/WinForms/ErrorHandler/CP"
        ViewSource="/quickstart/howto/Samples/WinForms/ErrorHandler/ErrorHandler.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C++ Error Handling Sample"
        MapRunSamplePath=true
        runat="server" />
    </CpTemplate>

</Acme:LangSwitch>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
