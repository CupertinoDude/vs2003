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
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Resources;

/// <summary>
///    This class demonstrates the Button control.
/// </summary>
public class ButtonCtl : System.Windows.Forms.Form {

    /// <summary>
    ///    Required designer variables.
    /// </summary>
    private System.Windows.Forms.CheckBox chkImage;
    private System.Windows.Forms.ComboBox cmbImageAlign;
    private System.Windows.Forms.Label label3;
    private System.Windows.Forms.ComboBox cmbTextAlign;
    private System.Windows.Forms.Label label2;
    private System.Windows.Forms.ComboBox cmbFlatStyle;
    private System.Windows.Forms.Label label1;
    private System.Windows.Forms.CheckBox chkBGImage;
    private System.Windows.Forms.Button button1;
    private System.Windows.Forms.Panel panel1;
    private System.Windows.Forms.GroupBox grpBehavior;

    public ButtonCtl() : base() {
        //
        // Required for Windows Form Designer support
        //
        InitializeComponent();

        // Set up combo-boxes

        object[] cmbitems;

        cmbitems = (object[])new StringIntObject[] {
                        new StringIntObject("Flat",(int)FlatStyle.Flat),
                        new StringIntObject("Popup",(int)FlatStyle.Popup),
                        new StringIntObject("Standard",(int)FlatStyle.Standard),
                        new StringIntObject("System",(int)FlatStyle.System)};

        cmbFlatStyle.Items.AddRange(cmbitems) ;
        cmbFlatStyle.SelectedIndex = 0 ;

        cmbitems = (object[])new StringIntObject[] {
                            new StringIntObject("TopLeft",(int)ContentAlignment.TopLeft),
                            new StringIntObject("TopCenter",(int)ContentAlignment.TopCenter),
                            new StringIntObject("TopRight",(int)ContentAlignment.TopRight),
                            new StringIntObject("MiddleLeft",(int)ContentAlignment.MiddleLeft),
                            new StringIntObject("MiddleCenter",(int)ContentAlignment.MiddleCenter),
                            new StringIntObject("MiddleRight",(int)ContentAlignment.MiddleRight),
                            new StringIntObject("BottomLeft",(int)ContentAlignment.BottomLeft),
                            new StringIntObject("BottomCenter",(int)ContentAlignment.BottomCenter),
                            new StringIntObject("BottomRight",(int)ContentAlignment.BottomRight)};

        cmbTextAlign.Items.AddRange(cmbitems);
        cmbTextAlign.SelectedIndex = 1 ;

        cmbImageAlign.Items.AddRange(cmbitems);
        cmbImageAlign.SelectedIndex = 0 ;

    }


    /// <summary>
    ///    Clean up any resources being used.
    /// </summary>
    protected override void Dispose(bool disposing) {
        if (disposing) {

        }
        base.Dispose(disposing);
    }

    /// <summary>
    ///    Required method for Designer support - do not modify
    ///    the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent() {
		System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(ButtonCtl));
		this.grpBehavior = new System.Windows.Forms.GroupBox();
		this.chkImage = new System.Windows.Forms.CheckBox();
		this.cmbImageAlign = new System.Windows.Forms.ComboBox();
		this.cmbTextAlign = new System.Windows.Forms.ComboBox();
		this.label2 = new System.Windows.Forms.Label();
		this.cmbFlatStyle = new System.Windows.Forms.ComboBox();
		this.label1 = new System.Windows.Forms.Label();
		this.chkBGImage = new System.Windows.Forms.CheckBox();
		this.label3 = new System.Windows.Forms.Label();
		this.panel1 = new System.Windows.Forms.Panel();
		this.button1 = new System.Windows.Forms.Button();
		this.grpBehavior.SuspendLayout();
		this.panel1.SuspendLayout();
		this.SuspendLayout();
		// 
		// grpBehavior
		// 
		this.grpBehavior.AccessibleDescription = resources.GetString("grpBehavior.AccessibleDescription");
		this.grpBehavior.AccessibleName = resources.GetString("grpBehavior.AccessibleName");
		this.grpBehavior.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("grpBehavior.Anchor")));
		this.grpBehavior.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("grpBehavior.BackgroundImage")));
		this.grpBehavior.Controls.AddRange(new System.Windows.Forms.Control[] {
																				  this.chkImage,
																				  this.cmbImageAlign,
																				  this.cmbTextAlign,
																				  this.label2,
																				  this.cmbFlatStyle,
																				  this.label1,
																				  this.chkBGImage,
																				  this.label3});
		this.grpBehavior.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("grpBehavior.Dock")));
		this.grpBehavior.Enabled = ((bool)(resources.GetObject("grpBehavior.Enabled")));
		this.grpBehavior.Font = ((System.Drawing.Font)(resources.GetObject("grpBehavior.Font")));
		this.grpBehavior.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("grpBehavior.ImeMode")));
		this.grpBehavior.Location = ((System.Drawing.Point)(resources.GetObject("grpBehavior.Location")));
		this.grpBehavior.Name = "grpBehavior";
		this.grpBehavior.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("grpBehavior.RightToLeft")));
		this.grpBehavior.Size = ((System.Drawing.Size)(resources.GetObject("grpBehavior.Size")));
		this.grpBehavior.TabIndex = ((int)(resources.GetObject("grpBehavior.TabIndex")));
		this.grpBehavior.TabStop = false;
		this.grpBehavior.Text = resources.GetString("grpBehavior.Text");
		this.grpBehavior.Visible = ((bool)(resources.GetObject("grpBehavior.Visible")));
		// 
		// chkImage
		// 
		this.chkImage.AccessibleDescription = resources.GetString("chkImage.AccessibleDescription");
		this.chkImage.AccessibleName = resources.GetString("chkImage.AccessibleName");
		this.chkImage.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("chkImage.Anchor")));
		this.chkImage.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("chkImage.Appearance")));
		this.chkImage.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("chkImage.BackgroundImage")));
		this.chkImage.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("chkImage.CheckAlign")));
		this.chkImage.Checked = true;
		this.chkImage.CheckState = System.Windows.Forms.CheckState.Checked;
		this.chkImage.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("chkImage.Dock")));
		this.chkImage.Enabled = ((bool)(resources.GetObject("chkImage.Enabled")));
		this.chkImage.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("chkImage.FlatStyle")));
		this.chkImage.Font = ((System.Drawing.Font)(resources.GetObject("chkImage.Font")));
		this.chkImage.Image = ((System.Drawing.Image)(resources.GetObject("chkImage.Image")));
		this.chkImage.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("chkImage.ImageAlign")));
		this.chkImage.ImageIndex = ((int)(resources.GetObject("chkImage.ImageIndex")));
		this.chkImage.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("chkImage.ImeMode")));
		this.chkImage.Location = ((System.Drawing.Point)(resources.GetObject("chkImage.Location")));
		this.chkImage.Name = "chkImage";
		this.chkImage.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("chkImage.RightToLeft")));
		this.chkImage.Size = ((System.Drawing.Size)(resources.GetObject("chkImage.Size")));
		this.chkImage.TabIndex = ((int)(resources.GetObject("chkImage.TabIndex")));
		this.chkImage.Text = resources.GetString("chkImage.Text");
		this.chkImage.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("chkImage.TextAlign")));
		this.chkImage.Visible = ((bool)(resources.GetObject("chkImage.Visible")));
		this.chkImage.CheckedChanged += new System.EventHandler(this.chkImage_CheckedChanged);
		// 
		// cmbImageAlign
		// 
		this.cmbImageAlign.AccessibleDescription = resources.GetString("cmbImageAlign.AccessibleDescription");
		this.cmbImageAlign.AccessibleName = resources.GetString("cmbImageAlign.AccessibleName");
		this.cmbImageAlign.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("cmbImageAlign.Anchor")));
		this.cmbImageAlign.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("cmbImageAlign.BackgroundImage")));
		this.cmbImageAlign.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("cmbImageAlign.Dock")));
		this.cmbImageAlign.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
		this.cmbImageAlign.Enabled = ((bool)(resources.GetObject("cmbImageAlign.Enabled")));
		this.cmbImageAlign.Font = ((System.Drawing.Font)(resources.GetObject("cmbImageAlign.Font")));
		this.cmbImageAlign.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("cmbImageAlign.ImeMode")));
		this.cmbImageAlign.IntegralHeight = ((bool)(resources.GetObject("cmbImageAlign.IntegralHeight")));
		this.cmbImageAlign.ItemHeight = ((int)(resources.GetObject("cmbImageAlign.ItemHeight")));
		this.cmbImageAlign.Location = ((System.Drawing.Point)(resources.GetObject("cmbImageAlign.Location")));
		this.cmbImageAlign.MaxDropDownItems = ((int)(resources.GetObject("cmbImageAlign.MaxDropDownItems")));
		this.cmbImageAlign.MaxLength = ((int)(resources.GetObject("cmbImageAlign.MaxLength")));
		this.cmbImageAlign.Name = "cmbImageAlign";
		this.cmbImageAlign.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("cmbImageAlign.RightToLeft")));
		this.cmbImageAlign.Size = ((System.Drawing.Size)(resources.GetObject("cmbImageAlign.Size")));
		this.cmbImageAlign.TabIndex = ((int)(resources.GetObject("cmbImageAlign.TabIndex")));
		this.cmbImageAlign.Text = resources.GetString("cmbImageAlign.Text");
		this.cmbImageAlign.Visible = ((bool)(resources.GetObject("cmbImageAlign.Visible")));
		this.cmbImageAlign.SelectedIndexChanged += new System.EventHandler(this.cmbImageAlign_SelectedIndexChanged);
		// 
		// cmbTextAlign
		// 
		this.cmbTextAlign.AccessibleDescription = resources.GetString("cmbTextAlign.AccessibleDescription");
		this.cmbTextAlign.AccessibleName = resources.GetString("cmbTextAlign.AccessibleName");
		this.cmbTextAlign.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("cmbTextAlign.Anchor")));
		this.cmbTextAlign.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("cmbTextAlign.BackgroundImage")));
		this.cmbTextAlign.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("cmbTextAlign.Dock")));
		this.cmbTextAlign.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
		this.cmbTextAlign.Enabled = ((bool)(resources.GetObject("cmbTextAlign.Enabled")));
		this.cmbTextAlign.Font = ((System.Drawing.Font)(resources.GetObject("cmbTextAlign.Font")));
		this.cmbTextAlign.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("cmbTextAlign.ImeMode")));
		this.cmbTextAlign.IntegralHeight = ((bool)(resources.GetObject("cmbTextAlign.IntegralHeight")));
		this.cmbTextAlign.ItemHeight = ((int)(resources.GetObject("cmbTextAlign.ItemHeight")));
		this.cmbTextAlign.Location = ((System.Drawing.Point)(resources.GetObject("cmbTextAlign.Location")));
		this.cmbTextAlign.MaxDropDownItems = ((int)(resources.GetObject("cmbTextAlign.MaxDropDownItems")));
		this.cmbTextAlign.MaxLength = ((int)(resources.GetObject("cmbTextAlign.MaxLength")));
		this.cmbTextAlign.Name = "cmbTextAlign";
		this.cmbTextAlign.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("cmbTextAlign.RightToLeft")));
		this.cmbTextAlign.Size = ((System.Drawing.Size)(resources.GetObject("cmbTextAlign.Size")));
		this.cmbTextAlign.TabIndex = ((int)(resources.GetObject("cmbTextAlign.TabIndex")));
		this.cmbTextAlign.Text = resources.GetString("cmbTextAlign.Text");
		this.cmbTextAlign.Visible = ((bool)(resources.GetObject("cmbTextAlign.Visible")));
		this.cmbTextAlign.SelectedIndexChanged += new System.EventHandler(this.cmbTextAlign_SelectedIndexChanged);
		// 
		// label2
		// 
		this.label2.AccessibleDescription = resources.GetString("label2.AccessibleDescription");
		this.label2.AccessibleName = resources.GetString("label2.AccessibleName");
		this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("label2.Anchor")));
		this.label2.AutoSize = ((bool)(resources.GetObject("label2.AutoSize")));
		this.label2.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("label2.Dock")));
		this.label2.Enabled = ((bool)(resources.GetObject("label2.Enabled")));
		this.label2.Font = ((System.Drawing.Font)(resources.GetObject("label2.Font")));
		this.label2.Image = ((System.Drawing.Image)(resources.GetObject("label2.Image")));
		this.label2.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label2.ImageAlign")));
		this.label2.ImageIndex = ((int)(resources.GetObject("label2.ImageIndex")));
		this.label2.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("label2.ImeMode")));
		this.label2.Location = ((System.Drawing.Point)(resources.GetObject("label2.Location")));
		this.label2.Name = "label2";
		this.label2.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("label2.RightToLeft")));
		this.label2.Size = ((System.Drawing.Size)(resources.GetObject("label2.Size")));
		this.label2.TabIndex = ((int)(resources.GetObject("label2.TabIndex")));
		this.label2.Text = resources.GetString("label2.Text");
		this.label2.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label2.TextAlign")));
		this.label2.Visible = ((bool)(resources.GetObject("label2.Visible")));
		// 
		// cmbFlatStyle
		// 
		this.cmbFlatStyle.AccessibleDescription = resources.GetString("cmbFlatStyle.AccessibleDescription");
		this.cmbFlatStyle.AccessibleName = resources.GetString("cmbFlatStyle.AccessibleName");
		this.cmbFlatStyle.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("cmbFlatStyle.Anchor")));
		this.cmbFlatStyle.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("cmbFlatStyle.BackgroundImage")));
		this.cmbFlatStyle.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("cmbFlatStyle.Dock")));
		this.cmbFlatStyle.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
		this.cmbFlatStyle.Enabled = ((bool)(resources.GetObject("cmbFlatStyle.Enabled")));
		this.cmbFlatStyle.Font = ((System.Drawing.Font)(resources.GetObject("cmbFlatStyle.Font")));
		this.cmbFlatStyle.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("cmbFlatStyle.ImeMode")));
		this.cmbFlatStyle.IntegralHeight = ((bool)(resources.GetObject("cmbFlatStyle.IntegralHeight")));
		this.cmbFlatStyle.ItemHeight = ((int)(resources.GetObject("cmbFlatStyle.ItemHeight")));
		this.cmbFlatStyle.Location = ((System.Drawing.Point)(resources.GetObject("cmbFlatStyle.Location")));
		this.cmbFlatStyle.MaxDropDownItems = ((int)(resources.GetObject("cmbFlatStyle.MaxDropDownItems")));
		this.cmbFlatStyle.MaxLength = ((int)(resources.GetObject("cmbFlatStyle.MaxLength")));
		this.cmbFlatStyle.Name = "cmbFlatStyle";
		this.cmbFlatStyle.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("cmbFlatStyle.RightToLeft")));
		this.cmbFlatStyle.Size = ((System.Drawing.Size)(resources.GetObject("cmbFlatStyle.Size")));
		this.cmbFlatStyle.TabIndex = ((int)(resources.GetObject("cmbFlatStyle.TabIndex")));
		this.cmbFlatStyle.Text = resources.GetString("cmbFlatStyle.Text");
		this.cmbFlatStyle.Visible = ((bool)(resources.GetObject("cmbFlatStyle.Visible")));
		this.cmbFlatStyle.SelectedIndexChanged += new System.EventHandler(this.cmbFlatStyle_SelectedIndexChanged);
		// 
		// label1
		// 
		this.label1.AccessibleDescription = resources.GetString("label1.AccessibleDescription");
		this.label1.AccessibleName = resources.GetString("label1.AccessibleName");
		this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("label1.Anchor")));
		this.label1.AutoSize = ((bool)(resources.GetObject("label1.AutoSize")));
		this.label1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("label1.Dock")));
		this.label1.Enabled = ((bool)(resources.GetObject("label1.Enabled")));
		this.label1.Font = ((System.Drawing.Font)(resources.GetObject("label1.Font")));
		this.label1.Image = ((System.Drawing.Image)(resources.GetObject("label1.Image")));
		this.label1.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label1.ImageAlign")));
		this.label1.ImageIndex = ((int)(resources.GetObject("label1.ImageIndex")));
		this.label1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("label1.ImeMode")));
		this.label1.Location = ((System.Drawing.Point)(resources.GetObject("label1.Location")));
		this.label1.Name = "label1";
		this.label1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("label1.RightToLeft")));
		this.label1.Size = ((System.Drawing.Size)(resources.GetObject("label1.Size")));
		this.label1.TabIndex = ((int)(resources.GetObject("label1.TabIndex")));
		this.label1.Text = resources.GetString("label1.Text");
		this.label1.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label1.TextAlign")));
		this.label1.Visible = ((bool)(resources.GetObject("label1.Visible")));
		// 
		// chkBGImage
		// 
		this.chkBGImage.AccessibleDescription = resources.GetString("chkBGImage.AccessibleDescription");
		this.chkBGImage.AccessibleName = resources.GetString("chkBGImage.AccessibleName");
		this.chkBGImage.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("chkBGImage.Anchor")));
		this.chkBGImage.Appearance = ((System.Windows.Forms.Appearance)(resources.GetObject("chkBGImage.Appearance")));
		this.chkBGImage.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("chkBGImage.BackgroundImage")));
		this.chkBGImage.CheckAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("chkBGImage.CheckAlign")));
		this.chkBGImage.Checked = true;
		this.chkBGImage.CheckState = System.Windows.Forms.CheckState.Checked;
		this.chkBGImage.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("chkBGImage.Dock")));
		this.chkBGImage.Enabled = ((bool)(resources.GetObject("chkBGImage.Enabled")));
		this.chkBGImage.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("chkBGImage.FlatStyle")));
		this.chkBGImage.Font = ((System.Drawing.Font)(resources.GetObject("chkBGImage.Font")));
		this.chkBGImage.Image = ((System.Drawing.Image)(resources.GetObject("chkBGImage.Image")));
		this.chkBGImage.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("chkBGImage.ImageAlign")));
		this.chkBGImage.ImageIndex = ((int)(resources.GetObject("chkBGImage.ImageIndex")));
		this.chkBGImage.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("chkBGImage.ImeMode")));
		this.chkBGImage.Location = ((System.Drawing.Point)(resources.GetObject("chkBGImage.Location")));
		this.chkBGImage.Name = "chkBGImage";
		this.chkBGImage.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("chkBGImage.RightToLeft")));
		this.chkBGImage.Size = ((System.Drawing.Size)(resources.GetObject("chkBGImage.Size")));
		this.chkBGImage.TabIndex = ((int)(resources.GetObject("chkBGImage.TabIndex")));
		this.chkBGImage.Text = resources.GetString("chkBGImage.Text");
		this.chkBGImage.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("chkBGImage.TextAlign")));
		this.chkBGImage.Visible = ((bool)(resources.GetObject("chkBGImage.Visible")));
		this.chkBGImage.CheckedChanged += new System.EventHandler(this.chkBGImage_CheckChanged);
		// 
		// label3
		// 
		this.label3.AccessibleDescription = resources.GetString("label3.AccessibleDescription");
		this.label3.AccessibleName = resources.GetString("label3.AccessibleName");
		this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("label3.Anchor")));
		this.label3.AutoSize = ((bool)(resources.GetObject("label3.AutoSize")));
		this.label3.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("label3.Dock")));
		this.label3.Enabled = ((bool)(resources.GetObject("label3.Enabled")));
		this.label3.Font = ((System.Drawing.Font)(resources.GetObject("label3.Font")));
		this.label3.Image = ((System.Drawing.Image)(resources.GetObject("label3.Image")));
		this.label3.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label3.ImageAlign")));
		this.label3.ImageIndex = ((int)(resources.GetObject("label3.ImageIndex")));
		this.label3.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("label3.ImeMode")));
		this.label3.Location = ((System.Drawing.Point)(resources.GetObject("label3.Location")));
		this.label3.Name = "label3";
		this.label3.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("label3.RightToLeft")));
		this.label3.Size = ((System.Drawing.Size)(resources.GetObject("label3.Size")));
		this.label3.TabIndex = ((int)(resources.GetObject("label3.TabIndex")));
		this.label3.Text = resources.GetString("label3.Text");
		this.label3.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("label3.TextAlign")));
		this.label3.Visible = ((bool)(resources.GetObject("label3.Visible")));
		// 
		// panel1
		// 
		this.panel1.AccessibleDescription = resources.GetString("panel1.AccessibleDescription");
		this.panel1.AccessibleName = resources.GetString("panel1.AccessibleName");
		this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("panel1.Anchor")));
		this.panel1.AutoScroll = ((bool)(resources.GetObject("panel1.AutoScroll")));
		this.panel1.AutoScrollMargin = ((System.Drawing.Size)(resources.GetObject("panel1.AutoScrollMargin")));
		this.panel1.AutoScrollMinSize = ((System.Drawing.Size)(resources.GetObject("panel1.AutoScrollMinSize")));
		this.panel1.BackColor = System.Drawing.Color.DarkGoldenrod;
		this.panel1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("panel1.BackgroundImage")));
		this.panel1.Controls.AddRange(new System.Windows.Forms.Control[] {
																			 this.button1});
		this.panel1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("panel1.Dock")));
		this.panel1.Enabled = ((bool)(resources.GetObject("panel1.Enabled")));
		this.panel1.Font = ((System.Drawing.Font)(resources.GetObject("panel1.Font")));
		this.panel1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("panel1.ImeMode")));
		this.panel1.Location = ((System.Drawing.Point)(resources.GetObject("panel1.Location")));
		this.panel1.Name = "panel1";
		this.panel1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("panel1.RightToLeft")));
		this.panel1.Size = ((System.Drawing.Size)(resources.GetObject("panel1.Size")));
		this.panel1.TabIndex = ((int)(resources.GetObject("panel1.TabIndex")));
		this.panel1.Text = resources.GetString("panel1.Text");
		this.panel1.Visible = ((bool)(resources.GetObject("panel1.Visible")));
		// 
		// button1
		// 
		this.button1.AccessibleDescription = resources.GetString("button1.AccessibleDescription");
		this.button1.AccessibleName = resources.GetString("button1.AccessibleName");
		this.button1.Anchor = ((System.Windows.Forms.AnchorStyles)(resources.GetObject("button1.Anchor")));
		this.button1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button1.BackgroundImage")));
		this.button1.Dock = ((System.Windows.Forms.DockStyle)(resources.GetObject("button1.Dock")));
		this.button1.Enabled = ((bool)(resources.GetObject("button1.Enabled")));
		this.button1.FlatStyle = ((System.Windows.Forms.FlatStyle)(resources.GetObject("button1.FlatStyle")));
		this.button1.Font = ((System.Drawing.Font)(resources.GetObject("button1.Font")));
		this.button1.Image = ((System.Drawing.Image)(resources.GetObject("button1.Image")));
		this.button1.ImageAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("button1.ImageAlign")));
		this.button1.ImageIndex = ((int)(resources.GetObject("button1.ImageIndex")));
		this.button1.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("button1.ImeMode")));
		this.button1.Location = ((System.Drawing.Point)(resources.GetObject("button1.Location")));
		this.button1.Name = "button1";
		this.button1.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("button1.RightToLeft")));
		this.button1.Size = ((System.Drawing.Size)(resources.GetObject("button1.Size")));
		this.button1.TabIndex = ((int)(resources.GetObject("button1.TabIndex")));
		this.button1.Text = resources.GetString("button1.Text");
		this.button1.TextAlign = ((System.Drawing.ContentAlignment)(resources.GetObject("button1.TextAlign")));
		this.button1.Visible = ((bool)(resources.GetObject("button1.Visible")));
		this.button1.Click += new System.EventHandler(this.button1_Click);
		// 
		// ButtonCtl
		// 
		this.AccessibleDescription = resources.GetString("$this.AccessibleDescription");
		this.AccessibleName = resources.GetString("$this.AccessibleName");
		this.AutoScaleBaseSize = ((System.Drawing.Size)(resources.GetObject("$this.AutoScaleBaseSize")));
		this.AutoScroll = ((bool)(resources.GetObject("$this.AutoScroll")));
		this.AutoScrollMargin = ((System.Drawing.Size)(resources.GetObject("$this.AutoScrollMargin")));
		this.AutoScrollMinSize = ((System.Drawing.Size)(resources.GetObject("$this.AutoScrollMinSize")));
		this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
		this.ClientSize = ((System.Drawing.Size)(resources.GetObject("$this.ClientSize")));
		this.Controls.AddRange(new System.Windows.Forms.Control[] {
																	  this.panel1,
																	  this.grpBehavior});
		this.Enabled = ((bool)(resources.GetObject("$this.Enabled")));
		this.Font = ((System.Drawing.Font)(resources.GetObject("$this.Font")));
		this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
		this.ImeMode = ((System.Windows.Forms.ImeMode)(resources.GetObject("$this.ImeMode")));
		this.Location = ((System.Drawing.Point)(resources.GetObject("$this.Location")));
		this.MaximumSize = ((System.Drawing.Size)(resources.GetObject("$this.MaximumSize")));
		this.MinimumSize = ((System.Drawing.Size)(resources.GetObject("$this.MinimumSize")));
		this.Name = "ButtonCtl";
		this.RightToLeft = ((System.Windows.Forms.RightToLeft)(resources.GetObject("$this.RightToLeft")));
		this.StartPosition = ((System.Windows.Forms.FormStartPosition)(resources.GetObject("$this.StartPosition")));
		this.Text = resources.GetString("$this.Text");
		this.grpBehavior.ResumeLayout(false);
		this.panel1.ResumeLayout(false);
		this.ResumeLayout(false);

	}

    /// <summary>
    ///    Handle button1.Click
    /// </summary>
    private void button1_Click(object sender, EventArgs e) {
        MessageBox.Show("You pressed the test button") ;
    }

    /// <summary>
    ///    Handle cmbImageAlign.SelectedIndexChanged
    /// </summary>
    private void cmbImageAlign_SelectedIndexChanged(object sender, EventArgs e) {
        int i = ((StringIntObject)cmbImageAlign.SelectedItem).i;
            button1.ImageAlign = (ContentAlignment)i ;
    }

    /// <summary>
    ///    Handle cmbTextAlign.SelectedIndexChanged
    /// </summary>
    private void cmbTextAlign_SelectedIndexChanged(object sender, EventArgs e) {
      int i = ((StringIntObject)cmbTextAlign.SelectedItem).i;
        button1.TextAlign = (ContentAlignment)i ;
    }

    /// <summary>
    ///    Handle cmbFlatStyle.SelectedIndexChanged
    /// </summary>
    private void cmbFlatStyle_SelectedIndexChanged(object sender, EventArgs e) {
      FlatStyle i = (FlatStyle)(((StringIntObject)cmbFlatStyle.SelectedItem).i);
        button1.FlatStyle = i ;
    }

    /// <summary>
    ///    Handle chkImage.CheckedChanged
    /// </summary>
    private void chkImage_CheckedChanged(object sender, EventArgs e) {
        if (chkImage.Checked) {
            ResourceManager resources = new ResourceManager(typeof(ButtonCtl));
            button1.Image = (System.Drawing.Image)resources.GetObject("button1.Image");
            cmbImageAlign.Enabled=true;
        } else {
            button1.Image = null ;
            cmbImageAlign.Enabled=false;
        }
    }

    /// <summary>
    ///    Handle chkBGImage.CheckedChanged
    /// </summary>
    private void chkBGImage_CheckChanged(object sender, EventArgs e) {
        if (chkBGImage.Checked) {
            ResourceManager resources = new ResourceManager(typeof(ButtonCtl));
            button1.BackgroundImage = (System.Drawing.Image)resources.GetObject("button1.BackgroundImage");
        } else {
            button1.BackgroundImage = null ;
        }
    }


    /// <summary>
    /// The main entry point for the application.
    /// </summary>
    [STAThread]
    public static void Main(string[] args) {
        Application.Run(new ButtonCtl());
    }

}
