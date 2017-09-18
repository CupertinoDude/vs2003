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



imports System
imports System.ComponentModel
imports System.Drawing
imports System.Windows.Forms

namespace Microsoft.Samples.WinForms.VB.HostApp

    public class HostApp
        inherits System.Windows.Forms.Form

        private components As System.ComponentModel.Container
    	private LicensedControl1 As LicensedControl

        public sub New()
            MyBase.New

            '  Required by the Windows Forms Designer
            InitializeComponent()

       end sub

        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub


        private sub InitializeComponent()
		    Me.components = new System.ComponentModel.Container()
		    Me.LicensedControl1 = new LicensedControl()

		    LicensedControl1.Dock = System.Windows.Forms.DockStyle.Fill
		    LicensedControl1.Size = new System.Drawing.Size(600, 450)
		    LicensedControl1.TabIndex = 0
		    LicensedControl1.Text = "Hello from the licensed control!"

		    Me.AutoScaleBaseSize = new System.Drawing.Size(5, 13)
		    Me.Text = "Control Example"
		    Me.ClientSize = new System.Drawing.Size(600, 450)

		    Me.Controls.Add(LicensedControl1)
	    end sub


        <STAThread()> Shared Public Sub Main()
            Application.Run(new HostApp())
        End Sub

    end class	' HostApp

end namespace	' Microsoft.Samples.WinForms.VB.HostApp
