Option Explicit
Option Strict

Imports System

Namespace CompVB

	Public Class StringComponent

		Private StringSet(3) As String

		Public Sub New()
			MyBase.New
			StringSet(0) = "Visual Basic String 0"
			StringSet(1) = "Visual Basic String 1"
			StringSet(2) = "Visual Basic String 2"
			StringSet(3) = "Visual Basic String 3"
		End Sub

		Public Function GetString(ByVal index as Integer) As String
			If ((index < 0) or (index >= Count)) then
				throw new IndexOutOfRangeException
			End If
			GetString = StringSet(index)
		End Function

		ReadOnly Property Count() As Long
			Get
				Count = StringSet.Length
			End Get
		End Property

	End Class

End Namespace