//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------


using System;
using System.ComponentModel;
using System.Windows.Forms;
using System.Resources;
using System.Drawing;

// <doc>
// <desc>
//     This class demonstrates the LinkLabel control.
// </desc>
// </doc>
//
public class LinkLabelCtl : System.Windows.Forms.Form {

    private System.ComponentModel.Container components;
    protected internal System.Windows.Forms.PropertyGrid propertyGrid1;
    protected internal System.Windows.Forms.LinkLabel linkLabel1;
    protected internal System.Windows.Forms.Panel panel1;
    protected internal System.Windows.Forms.GroupBox grpBehavior;

    public LinkLabelCtl() : base() {

        // This call is required for support of the Windows Forms Form Designer.
        InitializeComponent();

        //Set the properties window to point at the link label
        propertyGrid1.SelectedObject = linkLabel1 ;

        linkLabel1.Font = new Font(Control.DefaultFont.FontFamily, 12, FontStyle.Bold);
    }

    // <doc>
    // <desc>
    //     LinkLabelCtl overrides dispose so it can clean up the
    //     component list.
    // </desc>
    // </doc>
    //
    protected override void Dispose(bool disposing) {
        if (disposing) {
            if (components != null) {
                components.Dispose();
            }
        }
        base.Dispose(disposing);
    }

    // <doc>
    // <desc>
    //     Handle the click event on the button
    // </desc>
    // </doc>
    //
    private void linkLabel1_LinkClick(object sender, LinkLabelLinkClickedEventArgs e) {
        MessageBox.Show("You clicked on the test Link") ;
        linkLabel1.LinkVisited = true ;
    }

    // NOTE: The following code is required by the Windows Forms Form Designer
    // It can be modified using the Windows Forms Form Designer.
    // Do not modify it using the code editor.

    private void InitializeComponent() {

		ResourceManager resources = new System.Resources.ResourceManager(typeof(LinkLabelCtl));

		this.components = new System.ComponentModel.Container();
		this.linkLabel1 = new System.Windows.Forms.LinkLabel();
		this.panel1 = new System.Windows.Forms.Panel();
		this.propertyGrid1 = new System.Windows.Forms.PropertyGrid();
		this.grpBehavior = new System.Windows.Forms.GroupBox();

		linkLabel1.DisabledLinkColor = (Color)System.Drawing.Color.Blue;
		linkLabel1.ForeColor = (Color)System.Drawing.Color.Gainsboro;
		linkLabel1.Location = new System.Drawing.Point(32, 128);
		linkLabel1.BackColor = (Color)System.Drawing.Color.Transparent;
		linkLabel1.TabIndex = 0;
		linkLabel1.Text = "Click on the underlined text to fire the click event";
		linkLabel1.Size = new System.Drawing.Size(136, 96);
		linkLabel1.LinkClicked += new LinkLabelLinkClickedEventHandler(linkLabel1_LinkClick);

		this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
		this.ClientSize = new System.Drawing.Size(504, 445);
		this.Text = "Link Label";

		panel1.Location = new System.Drawing.Point(24, 40);
		panel1.BackgroundImage = (System.Drawing.Image)resources.GetObject("panel1.BackgroundImage");
		panel1.TabIndex = 1;
		panel1.Text = "panel1";
		panel1.Size = new System.Drawing.Size(200, 320);

		propertyGrid1.Dock = System.Windows.Forms.DockStyle.Fill;
		propertyGrid1.Location = new System.Drawing.Point(3, 16);
		propertyGrid1.CommandsVisibleIfAvailable = true;
		propertyGrid1.TabIndex = 0;
		propertyGrid1.Text = "propertyGrid1";
		propertyGrid1.Size = new System.Drawing.Size(242, 405);

		grpBehavior.Location = new System.Drawing.Point(248, 16);
		grpBehavior.TabIndex = 0;
		grpBehavior.Anchor = System.Windows.Forms.AnchorStyles.Bottom |
			System.Windows.Forms.AnchorStyles.Top |
			System.Windows.Forms.AnchorStyles.Left |
			System.Windows.Forms.AnchorStyles.Right;
		grpBehavior.TabStop = false;
		grpBehavior.Text = "LinkLabel Properties";
		grpBehavior.Size = new System.Drawing.Size(248, 424);

		grpBehavior.Controls.Add(propertyGrid1);
		panel1.Controls.Add(linkLabel1);
		this.Controls.Add(panel1);
		this.Controls.Add(grpBehavior);
    }

    // The main entry point for the application.
    [STAThread]
    public static void Main(string[] args) {
        Application.Run(new LinkLabelCtl());
    }

}
