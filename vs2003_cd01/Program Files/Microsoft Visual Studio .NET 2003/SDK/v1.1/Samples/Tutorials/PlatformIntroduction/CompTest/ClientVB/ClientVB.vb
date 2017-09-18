Option Explicit
Option Strict

Imports System
Imports System.Collections

Imports CompCS
Imports CompVB
Imports CompVC

Public Module modmain

	'The main entry point for the application
	Sub Main()

		 Dim Count As Integer

		 ' Display result strings from C# Component
		 Dim MyCompCS As New CompCS.StringComponent
		 Console.WriteLine("Strings from C# StringComponent")
		 For Count = 0 To MyCompCS.Count - 1
			  Console.WriteLine(MyCompCS.GetString(Count))
		 Next
		 Console.WriteLine

		 ' Display result strings from Visual C++ Component
		 Dim MyCompVC As New CompVC.StringComponent
		 Console.WriteLine("Strings from Visual C++ StringComponent")
		 For Count = 0 To MyCompVC.Count - 1
			  Console.WriteLine(MyCompVC.GetString(Count))
		 Next
		 Console.WriteLine

		 ' Display result strings from Visual Basic Component
		 Dim MyCompVB As New CompVB.StringComponent
		 Console.WriteLine("Strings from Visual Basic StringComponent")
		 For Count = 0 To CInt(MyCompVB.Count) - 1
			  Console.WriteLine(MyCompVB.GetString(Count))
		 Next

	End Sub

End Module