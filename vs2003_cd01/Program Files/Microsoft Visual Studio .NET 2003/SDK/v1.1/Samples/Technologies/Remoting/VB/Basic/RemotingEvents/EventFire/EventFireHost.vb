
Imports System
Imports System.IO
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.Http



Public Class Host
    
    'Entry point which delegates to C-style main Private Function
    Public Shared Sub Main()
        VBMain(System.Environment.GetCommandLineArgs())
    End Sub
    
    Public Shared Sub VBMain(args() As String)
        ' Register the wellknown server type. 
        RemotingConfiguration.Configure("eventfirehost.exe.config")
        
        ' We are done, wait until the user wants to exit
        Console.WriteLine("Host is ready to process remote messages.")
        Console.WriteLine("Press ENTER to exit")
        Dim keyState As [String] = Console.ReadLine()
    End Sub 'Main
End Class 'Host
