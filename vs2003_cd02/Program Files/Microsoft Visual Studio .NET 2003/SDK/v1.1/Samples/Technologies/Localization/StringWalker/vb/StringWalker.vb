' --------------------------------------------------------------------------
'  StringWalker class: this string encapsulates string operations in order
'  to provide easy methods that handle surrogates and combining characters
' --------------------------------------------------------------------------

Imports System
Imports System.Globalization
Imports System.Text

  Public Class StringWalkerException
    Inherits Exception

    Public Sub New()
      MyBase.New()
    End Sub

    Public Sub New(ByVal str As String)
      MyBase.New(str)
      End Sub

   End Class

   Public Class StringWalker
      ' private members
      Private myString As String = String.Empty
      Private myIndex() As Integer
      Private myPos As Integer

      ' public property

      Public ReadOnly Property Length() As Integer
         Get
           If myIndex Is Nothing
             Return 0
           Else
             Return myIndex.Length
           End If
         End Get
      End Property

      ' constructor
      Public Sub New(ByVal str As String)
         Initialize(str)
      End Sub 'New

      ' ToString overriden method
      Public Overrides Function ToString() As String
         Return myString
      End Function 'ToString

      ' "easy" walking methods: GetFirst, GetNext, GetPrev, GetLast, Get
      ' these are basically wrapper around the GetSubString method
      Public Function GetFirst(ByRef str As String) As Boolean
         myPos = 0
         Return GetElement(myPos, str)
      End Function 'GetFirst

      Public Function GetLast(ByRef str As String) As Boolean
         myPos = Length - 1
         Return GetElement(myPos, str)
      End Function 'GetLast

      Public Function GetNext(ByRef str As String) As Boolean
       myPos = myPos + 1
        Return GetElement(myPos, str)
      End Function 'GetNext

      Public Function GetPrev(ByRef str As String) As Boolean
        myPos = myPos - 1
         Return GetElement(myPos, str)
      End Function 'GetPrev

      Public Function GetElement(ByVal index As Integer, ByRef str As String) As Boolean
         Return 0 <> GetSubString(index, 1, str)
      End Function 'Get

      ' GetSubString method
      Public Function GetSubString(ByVal index As Integer, ByVal count As Integer, ByRef str As String) As Integer
         ' check for index within bounds and non zero count
         If 1 <= count And 0 <= index And index < Length Then
            Try
               Dim lastindex As Integer = index + count

               ' if we are past the last char, then we get the string
               ' up to the last char and return the actual count
               If lastindex > Length - 1 Then
                  str = myString.Substring(myIndex(index))
                  Return Length - index
               Else
                  str = myString.Substring(myIndex(index), myIndex(lastindex) - myIndex(index))
                  Return count
               End If
            Catch ' catch all and throw our exception
              Throw (New StringWalkerException())
            End Try
         End If
         str = String.Empty
         Return 0
      End Function 'GetSubString

      ' Insert, Remove: both methods return true if the operation was succesful and false otherwise
      ' Insert: inserts a string at the specified position
      Public Function Insert(ByVal index As Integer, ByVal str As String) As Boolean
         If 0 <= index And index <= Length Then
            Try
               If index = Length Then
                  Initialize(myString.Insert(myString.Length, str))
               Else
                  Initialize(myString.Insert(myIndex(index), str))
               End If
               Return True
            Catch ' catch all and throw our exception
              Throw (New StringWalkerException())
            End Try
         End If
         Return False
      End Function 'Insert

      ' Remove: removes the specified number of text elements starting at the specified position
      Public Function Remove(ByVal index As Integer, ByVal count As Integer) As Boolean
         If count > 0 And 0 <= index And index < Length Then
            Try
               Dim idxLast As Integer = index + count
               Dim charcount As Integer

               If idxLast < Length Then
                  charcount = myIndex(idxLast) - myIndex(index)
               Else
                  charcount = myString.Length - myIndex(index)
               End If

               Initialize(myString.Remove(myIndex(index), charcount))
               Return True
            Catch ' catch all and throw our exception
              Throw (New StringWalkerException())
            End Try
         End If
         Return False
      End Function 'Remove

      ' IndexOf: 
      Public Function IndexOf(ByVal str As String, ByVal index As Integer) As Integer
         If 0 <= index And index < Length Then
            Try
               ' try and find the input string in the current string
               Dim position As Integer = myIndex(index)
               Dim foundAt As Integer = myString.IndexOf(str, position)

               ' if the string is found, then we need to see if it
               ' can be matched to a text element index.
               If -1 <> foundAt Then
                  Dim i As Integer
                  For i = 0 To myIndex.Length - 1
                     If myIndex(i) = foundAt Then
                        Return i
                     End If
                  Next i
               End If
            Catch ' catch all and throw our exception
              Throw (New StringWalkerException())
            End Try
         End If
         Return -1
      End Function 'IndexOf

      ' private initialization method
      Private Sub Initialize(ByVal str As String)
         Try
            myPos = 0
            myString = str
            myIndex = StringInfo.ParseCombiningCharacters(myString)

          Catch ' catch all and throw our exception
            Throw (New StringWalkerException())
          End Try
      End Sub 'Initialize

   End Class 'StringWalker
