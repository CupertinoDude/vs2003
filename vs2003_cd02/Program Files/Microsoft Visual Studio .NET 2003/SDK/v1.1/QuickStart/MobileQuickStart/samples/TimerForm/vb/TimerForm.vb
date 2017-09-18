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

Imports Microsoft.VisualBasic
Imports System
Imports System.Collections
Imports System.Web.UI.MobileControls
Imports System.Web.UI.MobileControls.Adapters

Namespace Acme

    ' ====================================================================
    '
    ' TimerForm Control Class
    '
    ' The TimerForm control inherits from Form, and adds the ability
    ' to make the browser navigate to a URL or post back to the server
    ' after a specified time.
    '
    ' To set the specified delay, set the Delay property.
    '
    ' To make the browser navigate to a URL, set the AutoNavigateUrl
    ' property.
    '
    ' To make the browser post back, leave AutoNavigateUrl blank. To
    ' handle the resulting event, set an event handler for the Timer
    ' event, or override OnTimer in an inheriting class.
    '
    ' ====================================================================

    Public Class TimerFormVB : Inherits System.Web.UI.MobileControls.Form

        ' ================================================================
        '
        ' Delay property
        '
        ' Defines, in seconds, how long to delay before executing action.
        ' Defaults to ten seconds.
        '
        ' ================================================================

        Public Property Delay As Integer

            Get
                Dim o As Object = ViewState("Delay")
                If o is Nothing
                    Return 10
                Else
                    Return CType(o, Integer)
                End If
            End Get

            Set
                ViewState("Delay") = value
            End Set
        
        End Property

        ' ================================================================
        '
        ' AutoNavigateUrl property 
        '
        ' If defined, renders markup to make the browser automatically 
        ' navigate to the given URL after the specified time.
        '
        ' ================================================================

        Public Property AutoNavigateUrl As String

            Get
                Dim o As Object = ViewState("AutoNavigateUrl")
                If o is Nothing
                    Return String.Empty
                Else
                    Return CType(o, String)
                End If
            End Get

            Set
                ViewState("AutoNavigateUrl") = value
            End Set

        End Property

        ' ================================================================
        '
        ' Timer event
        '
        ' This event is raised when the timer elapses, and the browser
        ' posts back to the server. If AutoNavigateUrl is defined, no
        ' postback happens.
        '
        ' ================================================================

        Public Event Timer(sender As Object, e As EventArgs)

        ' ================================================================
        '
        ' OnTimer method
        '
        ' This protected method allows inheriting classes to internally 
        ' handle a post back following the specified delay. The default
        ' implementation raises the Timer event.
        '
        ' ================================================================

        Protected Overridable Sub OnTimer(e As EventArgs)

            RaiseEvent Timer(Me, e)

        End Sub

        ' ================================================================
        '
        ' RaiseTimer method
        '
        ' Called by the adapters to raise the timer event.
        '
        ' ================================================================

        Public Sub RaiseTimer()

            OnTimer(New EventArgs())

        End Sub

    End Class

    ' ====================================================================
    '
    ' WmlTimerFormAdapter Class
    '
    ' The WmlTimerFormAdapter class renders a TimerForm control on
    ' WML devices. The timer functionality is rendered using an
    ' <onevent type="timer"> construct. All other behavior
    ' is inherited from WmlFormAdapter.
    '
    ' ====================================================================

    Public Class WmlTimerFormAdapterVB : Inherits WmlFormAdapter

        Private Const TimerEventArgument As String = "$timer"

        Protected Shadows ReadOnly Property Control As TimerFormVB

            Get
                Return CType(MyBase.Control, TimerFormVB)
            End Get

        End Property

        ' ================================================================
        '
        ' RenderExtraCardElements method
        '
        ' By overriding this method, the adapter can render additional
        ' content immediately after the <card> tag in the WML output.
        '
        ' ================================================================

        Overrides Protected Sub RenderExtraCardElements(writer As WmlMobileTextWriter)

            Dim autoNavigateUrl As String = Control.AutoNavigateUrl

            ' A URL to another form on the same page will also cause a postback.

            Dim renderAsPostBack As Boolean = False
            If autoNavigateUrl.Length = 0
                renderAsPostBack = True
            ElseIf Not (DeterminePostBack(autoNavigateUrl) Is Nothing)
                renderAsPostBack = True
            End If

            writer.WriteBeginTag("onevent")
            writer.WriteAttribute("type", "ontimer")
            writer.Write(">")
                
            If (renderAsPostBack)
                
                writer.RenderGoAction(Control.UniqueID, TimerEventArgument, WmlPostFieldType.Normal, False) 
            
            Else
            
                ' Resolve the URL relative to the page.
                autoNavigateUrl = Control.ResolveUrl(autoNavigateUrl)

                writer.WriteBeginTag("go")
                writer.Write(" href=")
                writer.Write(Chr(34))
                writer.WriteEncodedUrl(autoNavigateUrl)
                writer.Write(Chr(34))
                writer.Write(">")
            
            End If

            writer.WriteEndTag("onevent")
            writer.WriteLine()

            writer.WriteBeginTag("timer")
            ' WML timer lengths are in 10th of seconds.
            writer.WriteAttribute("value", (Control.Delay * 10).ToString())
            writer.WriteLine("/>")

        End Sub

        ' ================================================================
        '
        ' HandlePostBackEvent method
        '
        ' By overriding this method, the adapter can handle the postback
        ' generated from the timer.
        '
        ' ================================================================

        Overrides Public Function HandlePostBackEvent(eventArgument as String) as Boolean

            If (eventArgument = TimerEventArgument)

                Dim autoNavigateUrl As String = Control.AutoNavigateUrl
                If autoNavigateUrl.Length > 0

                    If (autoNavigateUrl.Length > 1) And (autoNavigateUrl.Chars(0) = "#")
                        Page.ActiveForm = Control.ResolveFormReference(autoNavigateUrl.Substring(1))
                    End If

                Else

                    Control.RaiseTimer()

                End If

                HandlePostBackEvent = True
            Else

                ' Let the base adapter class handle any events.

                HandlePostBackEvent = MyBase.HandlePostBackEvent(eventArgument)

            End If

        End Function
    
    End Class

    ' ====================================================================
    '
    ' HtmlTimerFormHelper Class
    '
    ' The HtmlTimerFormHelper class is a helper class used by both
    ' HtmlTimerFormAdapter and ChtmlTimerFormAdapter. Although both
    ' these classes require identical functionality, they have different
    ' base classes, making a helper class useful.
    '
    ' On HTML devices, the timer functionality is rendered using a
    ' <meta http-equiv="refresh"> construct. All other behavior
    ' is inherited from the base form adapter.
    '
    ' ====================================================================

    Class HtmlTimerFormHelperVB

        Private Const TimerEventArgument As String = "$timer"

        ' ================================================================
        '
        ' RenderTimerMetaTag method
        '
        ' Renders the metatag for the timer behavior.
        '
        ' ================================================================

        Public Shared Sub RenderTimerMetaTag(form As TimerFormVB, writer As HtmlMobileTextWriter)

            Dim autoNavigateUrl As String = form.AutoNavigateUrl

            ' A URL to another form on the same page will also cause a postback.

            Dim renderAsPostBack As Boolean = False
            If autoNavigateUrl.Length = 0
                renderAsPostBack = True
            ElseIf autoNavigateUrl.Chars(0) = "#"
                renderAsPostBack = True
            End If

            writer.WriteBeginTag("meta") 
            writer.WriteAttribute("http-equiv", "refresh") 
            writer.Write(" content=") 
            writer.Write(Chr(34))
            writer.Write(form.Delay.ToString()) 
            writer.Write(";url=") 
            If renderAsPostBack

                Dim pageAdapter As HtmlPageAdapter = CType(form.MobilePage.Adapter, HtmlPageAdapter)
                pageAdapter.RenderUrlPostBackEvent(writer, form.UniqueID, TimerEventArgument)
            
            Else

                writer.WriteEncodedUrl(autoNavigateUrl)
            
            End If
            writer.Write(Chr(34))
            writer.WriteLine(">")
        
        End Sub

        ' ================================================================
        '
        ' HandlePostBackEvent method
        '
        ' Handles a timer postback event.
        '
        ' ================================================================

        Public Shared Function HandlePostBackEvent(form As TimerFormVB, eventArgument As String) As Boolean

            If (eventArgument = TimerEventArgument)

                Dim autoNavigateUrl As String = form.AutoNavigateUrl

                If (autoNavigateUrl.Length > 0)

                    If (autoNavigateUrl.Length > 1) And (autoNavigateUrl.Chars(0) = "#")

                        form.MobilePage.ActiveForm = form.ResolveFormReference(autoNavigateUrl.Substring(1))
                    
                    End If

                Else

                    form.RaiseTimer()

                End If

                HandlePostBackEvent = True

            Else

                HandlePostBackEvent = False
            
            End If
            
        End Function
        
    End Class

    ' ====================================================================
    '
    ' HtmlTimerFormAdapter Class
    '
    ' The HtmlTimerFormAdapter class renders a TimerForm control on
    ' HTML devices. The timer functionality is rendered using a
    ' <meta http-equiv="refresh"> construct. All other behavior
    ' is inherited from HtmlFormAdapter.
    '
    ' ====================================================================

    Public Class HtmlTimerFormAdapterVB : Inherits HtmlFormAdapter
    
        Protected Shadows ReadOnly Property Control As TimerFormVB
            
            Get
                Return CType(MyBase.Control, TimerFormVB)
            End Get

        End Property

        ' ================================================================
        '
        ' RenderExtraHeadElements method
        '
        ' By overriding this method, the adapter can render additional
        ' content inside the <head> tag of the rendered page. The adapter
        ' must call the base class implementation.
        '
        ' ================================================================

        Overrides Protected Function RenderExtraHeadElements(writer As HtmlMobileTextWriter) As Boolean

            MyBase.RenderExtraHeadElements(writer)

            ' The method is called twice - once with the writer set to null,
            ' to determine if there is anything to be written; and once with
            ' a valid writer.

            If Not (writer Is Nothing)

                HtmlTimerFormHelperVB.RenderTimerMetaTag(Control, writer)
            
            End If

            RenderExtraHeadElements = True

        End Function

        ' ================================================================
        '
        ' HandlePostBackEvent method
        '
        ' By overriding this method, the adapter can handle the postback
        ' generated from the timer.
        '
        ' ================================================================

        Overrides Public Function HandlePostBackEvent(eventArgument As String) As Boolean

            If (HtmlTimerFormHelperVB.HandlePostBackEvent(Control, eventArgument) = True)

                HandlePostBackEvent = True
            
            Else

                ' Let the base adapter class handle any events.

                HandlePostBackEvent = MyBase.HandlePostBackEvent(eventArgument)

            End If

        End Function
        
    End Class

    ' ====================================================================
    '
    ' ChtmlTimerFormAdapter Class
    '
    ' The ChtmlTimerFormAdapter class renders a TimerForm control on
    ' scriptless HTML devices. The timer functionality is rendered using 
    ' a <meta http-equiv="refresh"> construct. All other behavior
    ' is inherited from ChtmlFormAdapter.
    '
    ' ====================================================================

    Public Class ChtmlTimerFormAdapterVB : Inherits ChtmlFormAdapter
    End Class

End Namespace
