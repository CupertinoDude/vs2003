'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Collections
Imports System.Collections.Specialized
Imports System.Globalization
Imports Microsoft.VisualBasic
Imports System.Reflection
Imports System.Text

< _
    Assembly : AssemblyTitle(""), _
    Assembly : AssemblyDescription("A QuickStart Tutorial Assembly"), _
    Assembly : AssemblyConfiguration(""), _
    Assembly : AssemblyCompany("Microsoft Corporation"), _
    Assembly : AssemblyProduct("Microsoft QuickStart Tutorials"), _
    Assembly : AssemblyCopyright(" Microsoft Corporation.  All rights reserved."), _
    Assembly : AssemblyTrademark(""), _
    Assembly : AssemblyCulture(""), _
    Assembly : AssemblyVersion("1.1.*"), _
    Assembly : AssemblyDelaySign(false), _
    Assembly : AssemblyKeyFile(""), _
    Assembly : AssemblyKeyName("") _
>
Namespace AcmeVB
    Public Class Calendar :
      Inherits Control :
      Implements IPostBackEventHandler, IPostBackDataHandler
        Dim Private monthNames(11) As String
        Dim Private currentDate As DateTime = DateTime.Now
        Dim private pBackColor As String = "#dcdcdc"
        Dim private pForeColor As String = "#eeeeee"

        Protected Overrides Sub OnInit(E As EventArgs)
            Page.RegisterRequiresPostBack(Me)

            currentDate = DateTime.Now

            monthNames(0) = "January"
            monthNames(1) = "February"
            monthNames(2) = "March"
            monthNames(3) = "April"
            monthNames(4) = "May"
            monthNames(5) = "June"
            monthNames(6) = "July"
            monthNames(7) = "August"
            monthNames(8) = "September"
            monthNames(9) = "October"
            monthNames(10) = "November"
            monthNames(11) = "December"
        End Sub

        Protected Overrides Sub LoadViewState(viewState As Object)
            'If we've done a post-back, the old date will be available to us

            If Not viewState Is Nothing
                currentDate = DateTime.Parse(CStr(viewState))
            End If
        End Sub

        Public Sub RaisePostBackEvent(eventArgument As String) Implements IPostBackEventHandler.RaisePostBackEvent
            If eventArgument = Nothing Then Exit Sub

            'Keep track of old date (for event firing purposes)

            Dim oldDate As DateTime = currentDate

            If String.Compare("NavNextMonth", eventArgument, true, CultureInfo.InvariantCulture) = 0
                currentDate = currentDate.AddMonths(1)
            ElseIf String.Compare("NavPrevMonth", eventArgument, true, CultureInfo.InvariantCulture) = 0
                currentDate = currentDate.AddMonths(-1)
            Else
                Dim daySelected As Integer = Int32.Parse(eventArgument)
                currentDate = new DateTime(currentDate.Year, currentDate.Month, daySelected)
            End If
        End Sub

        Protected Overrides Function SaveViewState() As Object
            'Save CurrentDate out as view state for postback scenarios
            SaveViewState = currentDate.ToString()
        End Function

        Protected Overrides Sub Render(output As HtmlTextWriter)
            If ((Not IsDBNull(Page.Request.UserAgent)) AndAlso _
                (Page.Request.Browser.Browser.ToUpper(CultureInfo.InvariantCulture).IndexOf("IE") > -1) AndAlso _
		(Double.Parse(Page.Request.Browser.Version) >= 5.5))
               RenderUpLevel(output)
            Else
               RenderDownLevel(output)
            End If
        End Sub

        Protected Sub RenderUpLevel(output As HtmlTextWriter)
            output.WriteLine("<input name='" & UniqueID & "_CurrentDate' id='" & UniqueID & "_CurrentDate' type=hidden>")
            output.WriteLine("<span id='" & UniqueID & "'></span>")
            output.WriteLine("<script language=jscript>drawcalendar('" & UniqueID & "', '" & currentDate.Year.ToString() & "/" & currentDate.Month.ToString() & "/" & currentDate.Day.ToString() & "');</script>")
        End Sub

        Protected Overrides Sub OnPreRender(E As EventArgs)

	    Dim DHTMLFunction As StringBuilder = new StringBuilder()

            DHTMLFunction.Append( "<script language='JavaScript'>" )
            DHTMLFunction.Append( "   function drawcalendar(calname, newDate) \n" )
            DHTMLFunction.Append( "   { \n" )
            DHTMLFunction.Append( "     var CurrentDate = new Date(newDate);\n" )
            DHTMLFunction.Append( "     var MonthArray = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');\n" )
            DHTMLFunction.Append( "     var MonthDays = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);\n" )
            DHTMLFunction.Append( "     var calText;\n" )
            DHTMLFunction.Append( "     calText = '<table bgcolor=#dcdcdc border=0 height=190 valign=top>';\n" )
            DHTMLFunction.Append( "     calText = calText + '<tr><td>';\n" )
            DHTMLFunction.Append( "     calText = calText + '<center>';\n" )
            DHTMLFunction.Append( "     calText = calText + ""<a href='javascript:drawcalendar(\"""" + calname + ""\"", \"""" + CurrentDate.getFullYear() + ""/"" + CurrentDate.getMonth() + ""/"" + CurrentDate.getDate() + ""\"")'>"";\n" )
            DHTMLFunction.Append( "     calText = calText + '<img src=/quickstart/aspplus/images/left4.gif width=11 height=11 border=0></a>';\n" )
            DHTMLFunction.Append( "     calText = calText + '    <b>' + MonthArray[CurrentDate.getMonth()] + ' ' + CurrentDate.getFullYear() + '</b>';\n" )
            DHTMLFunction.Append( "     calText = calText + ""   <a href='javascript:drawcalendar(\"""" + calname + ""\"", \"""" + CurrentDate.getFullYear() + ""/"" + (CurrentDate.getMonth() + 2) + ""/"" + CurrentDate.getDate() + ""\"")'>"";\n" )
            DHTMLFunction.Append( "     calText = calText + '<IMG SRC=/quickstart/aspplus/images/right4.gif width=11 height=11 border=0></a>';\n" )
            DHTMLFunction.Append( "     calText = calText + '</center>';\n" )
            DHTMLFunction.Append( "     calText = calText + '</td></tr>';\n" )
            DHTMLFunction.Append( "     calText = calText + '<tr valign=top><td valign=top>';\n" )
            DHTMLFunction.Append( "     calText = calText + '<table border=1 bgcolor=#eeeeee height=160>';\n" )
            DHTMLFunction.Append( "     calText = calText + '<tr height=20>';\n" )
            DHTMLFunction.Append( "     calText = calText + '   <td align=right width=23> Sun </td>';\n" )
            DHTMLFunction.Append( "     calText = calText + '   <td align=right width=23> Mon </td>';\n" )
            DHTMLFunction.Append( "     calText = calText + '   <td align=right width=23> Tue </td>';\n" )
            DHTMLFunction.Append( "     calText = calText + '   <td align=right width=23> Wed </td>';\n" )
            DHTMLFunction.Append( "     calText = calText + '   <td align=right width=23> Thu </td>';\n" )
            DHTMLFunction.Append( "     calText = calText + '   <td align=right width=23> Fri </td>';\n" )
            DHTMLFunction.Append( "     calText = calText + '   <td align=right width=23> Sat </td>';\n" )
            DHTMLFunction.Append( "     calText = calText + '</tr>';\n" )
            DHTMLFunction.Append( "     calText = calText + '<tr>';\n" )
            DHTMLFunction.Append( "     var numDays  = MonthDays[CurrentDate.getMonth()];\n" )
            DHTMLFunction.Append( "     var firstDayOfMonth = new Date(CurrentDate.getFullYear(),CurrentDate.getMonth(),1);\n" )
            DHTMLFunction.Append( "     firstDay = firstDayOfMonth.getDay();\n" )
            DHTMLFunction.Append( "     for (var x=0; x<firstDay; x++)\n" )
            DHTMLFunction.Append( "     {\n" )
            DHTMLFunction.Append( "         calText = calText + '<td align=right width=23></td>'\n" )
            DHTMLFunction.Append( "     }\n" )
            DHTMLFunction.Append( "     for (var x=1; x<=numDays; x++) \n" )
            DHTMLFunction.Append( "     { \n" )
            DHTMLFunction.Append( "         if (CurrentDate.getDate() == x) \n" )
            DHTMLFunction.Append( "         { \n" )
            DHTMLFunction.Append( "             calText = calText + '<td align=right width=23>';\n" )
            DHTMLFunction.Append( "             calText = calText + '<font color=red><b><u>' + x + '</u></b></font>';\n" )
            DHTMLFunction.Append( "             calText = calText + '</td>';\n" )
            DHTMLFunction.Append( "         }\n" )
            DHTMLFunction.Append( "         else \n" )
            DHTMLFunction.Append( "         { \n" )
            DHTMLFunction.Append( "             calText = calText + '<td align=right width=23>';\n" )
            DHTMLFunction.Append( "             calText = calText + ""<a href='javascript:drawcalendar(\"""" + calname + ""\"", \"""" + CurrentDate.getFullYear() + ""/"" + (CurrentDate.getMonth()+1) + ""/"" + x + ""\"")'>"" + x + ""</a>"";\n" )
            DHTMLFunction.Append( "             calText = calText + '</td>';\n" )
            DHTMLFunction.Append( "         }\n" )
            DHTMLFunction.Append( "         if (((firstDay+x) % 7) == 0)\n" )
            DHTMLFunction.Append( "         {\n" )
            DHTMLFunction.Append( "             calText = calText + '</tr><tr>';\n" )
            DHTMLFunction.Append( "         }\n" )
            DHTMLFunction.Append( "     }\n" )
            DHTMLFunction.Append( "     calText = calText + '</tr>';\n" )
            DHTMLFunction.Append( "     calText = calText + '</table></td></tr></table>';\n" )
            DHTMLFunction.Append( "     var CalendarSpan = document.all(calname);\n" )
            DHTMLFunction.Append( "     if (CalendarSpan != null)\n" )
            DHTMLFunction.Append( "        CalendarSpan.innerHTML = calText;\n" )
            DHTMLFunction.Append( "     var CalendarValue = document.all(calname + '_CurrentDate');\n" )
            DHTMLFunction.Append( "     if (CalendarValue != null)\n" )
            DHTMLFunction.Append( "        CalendarValue.value = '' + (CurrentDate.getMonth() + 1) + '/' + CurrentDate.getDate() + '/' + CurrentDate.getFullYear();\n" )
            DHTMLFunction.Append( "   } \n" )
            DHTMLFunction.Append( "</script>\n" )

            If ((Not IsDBNull(Page.Request.UserAgent)) AndAlso _
                (Page.Request.Browser.Browser.ToUpper(CultureInfo.InvariantCulture).IndexOf("IE") > -1) AndAlso _
		(Double.Parse(Page.Request.Browser.Version) >= 5.5))
               Page.RegisterClientScriptBlock("ACME_CALENDAR_DHTML", DHTMLFunction.ToString().Replace("\n", chr(10)))
            End If
        End Sub

        Protected Sub RenderDownLevel(output As HtmlTextWriter)
            'Output Calendar Header

            output.WriteLine("<table bgcolor=" & backColor & " border=0 height=190 valign=top><tr><td>")
            output.WriteLine("<table bgcolor=" & backColor & " border=0 height=190 valign=top>")
            output.WriteLine("<tr><td>")
            output.WriteLine("<center>")
            output.WriteLine("    <a href=""javascript:" & Page.GetPostBackEventReference(Me, "NavPrevMonth") & """>")
            output.WriteLine("<img src=/quickstart/aspplus/images/left4.gif width=11 height=11 border=0></a>")
            output.WriteLine("    <b>" & monthNames(currentDate.Month-1) & " " & currentDate.Year.ToString() & "</b>")
            output.WriteLine("    <a href=""javascript:" & Page.GetPostBackEventReference(Me, "NavNextMonth") & """>")
            output.WriteLine("<IMG SRC=/quickstart/aspplus/images/right4.gif width=11 height=11 border=0></a>")
            output.WriteLine("</center>")
            output.WriteLine("</td></tr>")
            output.WriteLine("<tr valign=top><td valign=top>")
            output.WriteLine("<table border=1 bgcolor=" & foreColor & " height=160>")
            output.WriteLine("<tr height=20>")
            output.WriteLine("   <td align=right width=23> Sun </td>")
            output.WriteLine("   <td align=right width=23> Mon </td>")
            output.WriteLine("   <td align=right width=23> Tue </td>")
            output.WriteLine("   <td align=right width=23> Wed </td>")
            output.WriteLine("   <td align=right width=23> Thu </td>")
            output.WriteLine("   <td align=right width=23> Fri </td>")
            output.WriteLine("   <td align=right width=23> Sat </td>")
            output.WriteLine("</tr>")
            output.WriteLine("<tr>")

            'Calculate how many days are in the month

            Dim numDays As Integer = DateTime.DaysInMonth(currentDate.Year, currentDate.Month)

            'Calculate what day of week the first day of the month is on

            Dim firstDay As Integer = New DateTime(currentDate.Year, currentDate.Month, 1).DayOfWeek

            'Pre-Day Padding
            Dim x As Integer

            For x = 0 To firstDay - 1
                output.WriteLine("<td align=right width=23></td>")
            Next

            'Output each day

            For x = 1 To numDays
                If currentDate.Day = x
                    output.Write("<td align=right width=23>")
                    output.Write("<font color=red><b><u>" & x.ToString() & "</u></b></font>")
                    output.WriteLine("</td>")
                Else
                    output.Write("<td align=right width=23>")
                    output.Write("<a href=""javascript:" & Page.GetPostBackEventReference(Me, x.ToString()) & """>")
                    output.Write(x.ToString() & "</a>")
                    output.WriteLine("</td>")
                End If

                'PerPage row break as appropriate
                If ((firstDay+x) Mod 7) = 0
                    output.WriteLine("</tr><tr>")
                End If
            Next

            output.WriteLine("</tr>")
            output.WriteLine("</table></td></tr></table></table>")
        End Sub

        Public Property [Date] As DateTime
            Get
                Return currentDate
            End Get
            Set
                currentDate = Value
            End Set
        End Property

        Public Property BackColor As String
            Get
                Return pBackColor
            End Get
            Set
                pBackColor = Value
            End Set
        End Property

        Public Property ForeColor As String
            Get
                Return pForeColor
            End Get
            Set
                pForeColor = Value
            End Set
        End Property

        Public Function LoadPostData(postDataKey As String, values As NameValueCollection) As Boolean Implements IPostBackDataHandler.LoadPostData
            Dim clientDate As String = values(UniqueID & "_CurrentDate")

            If Not clientDate = Nothing
                Try
                    currentDate = DateTime.Parse(clientDate)
                Catch
                    currentDate = DateTime.Now
                End Try
            End If

            Return False
        End Function

        Public Sub RaisePostDataChangedEvent() Implements IPostBackDataHandler.RaisePostDataChangedEvent
        End Sub
    End Class
End Namespace
