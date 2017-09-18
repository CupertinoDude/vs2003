Imports System.Globalization

Public Class LanguageDropdown

    Private myLangValue As String
    Private myLangDisplay As String

    Public Sub New(ByVal strLangDisplay As String, ByVal strLangValue As String)
        MyBase.New()
        Me.myLangValue = strLangValue
        Me.myLangDisplay = strLangDisplay
    End Sub

    Public ReadOnly Property LangValue() As String
        Get
            Return myLangValue
        End Get
    End Property

    Public ReadOnly Property LangDisplay() As String
        Get
            Return myLangDisplay
        End Get
    End Property

    Public Overrides Function ToString() As String
        Return Me.LangValue & " - " & Me.LangDisplay
    End Function

End Class
