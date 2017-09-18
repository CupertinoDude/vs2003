Option Strict On

Imports System.Threading
Imports System.Globalization
Imports System.Resources

'The console window is a an ANSI component, which means it does not display
'Unicode characters.  This means that you can only display characters correctly
'which are contains in your system default codepage. The valid combinations include:
'en - any localized system
'en, de, es, fr, it - Western European, 1252
'en, ja - Japanese, 932
'en, ko - Korean, 949
'en, zh-CHS - Simplified Chinese, 936
'en, zh-CHT - Traditional Chinese, 950
Module Module1

    Sub Main()
        'Override CurrentUICulture with the fallback culture.
        Thread.CurrentThread.CurrentUICulture = New CultureInfo("", False)

        Do
            'Create a resource manager.
            Dim MyResMgr As New ResourceManager("VBLocalizedHelloWorld.Strings", System.Reflection.Assembly.GetExecutingAssembly())

            'Print out the "HelloWorld" resource string & directions.
            Console.WriteLine(MyResMgr.GetString("HelloWorld"))
            Console.WriteLine(MyResMgr.GetString("EnterCulture"))
            Console.WriteLine(MyResMgr.GetString("AdditionalCulture"))

            'Get the new culture name.
            Dim NewCulture As String = Console.ReadLine()

            'Switch to the desired culture.
            Try
                Dim c As CultureInfo = New CultureInfo(NewCulture, False)
                Thread.CurrentThread.CurrentUICulture = c
            Catch 'Fallback to the default culture if an invalid culture is entered.
                Thread.CurrentThread.CurrentUICulture = New CultureInfo("", False)

            End Try

        Loop Until (False)

    End Sub

End Module
