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
using System.Drawing;
using System.Windows.Forms;
using System.Diagnostics;


public class ChangeToolTips : System.Windows.Forms.Form {
    internal ImageList imgList;
    internal string[] toolTips;

    public ChangeToolTips(ImageList smlImageList, string[] toolTips) : base() {
        //
        // Required for Windows Form Designer support
        //
        InitializeComponent();

        this.imgList = smlImageList;
        this.toolTips = toolTips;
        listView1.SmallImageList = smlImageList;
        SetToolTipRows();
    }

    private void SetToolTipRows() {
        Debug.Assert(imgList.Images.Count == toolTips.Length,
            "Incorrect number of images or tooltips");

        listView1.Columns.Add("ToolTip Text", listView1.Size.Width - 5,
            HorizontalAlignment.Left);
        for (int i = 0; i < toolTips.Length; i++) {
            ListViewItem item = new ListViewItem(toolTips[i],i);
            listView1.Items.Add(item);
        }
    }

    public virtual string[] GetToolTips() {
        return toolTips;
    }

    /// <summary>
    ///    Clean up any resources being used.
    /// </summary>
    protected override void Dispose(bool disposing)
    {
        if (disposing) {
            if (components != null) {
                components.Dispose();
            }
        }
        base.Dispose(disposing);
    }

    private void ListView1_afterLabelEdit(object source, LabelEditEventArgs e) {
        if (e.Label == null) {
            e.CancelEdit = true;
            return;
        }
        toolTips[e.Item] = e.Label;
    }

    /// <summary>
    ///    Required designer variable.
    /// </summary>
    protected internal System.ComponentModel.Container components;
    protected internal System.Windows.Forms.Button btnOk;
    protected internal System.Windows.Forms.ListView listView1;
    protected internal System.Windows.Forms.Label label1;

    /// <summary>
    ///    Required method for Designer support - do not modify
    ///    the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.btnOk = new System.Windows.Forms.Button();
        this.listView1 = new System.Windows.Forms.ListView();
        this.label1 = new System.Windows.Forms.Label();
        this.SuspendLayout();

        // 
        // btnOk
        // 
        this.btnOk.DialogResult = System.Windows.Forms.DialogResult.OK;
        this.btnOk.Location = new System.Drawing.Point(16, 272);
        this.btnOk.Name = "btnOk";
        this.btnOk.TabIndex = 1;
        this.btnOk.Text = "&Ok";

        // 
        // listView1
        // 
        this.listView1.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
        this.listView1.LabelEdit = true;
        this.listView1.Location = new System.Drawing.Point(16, 48);
        this.listView1.MultiSelect = false;
        this.listView1.Name = "listView1";
        this.listView1.Size = new System.Drawing.Size(272, 192);
        this.listView1.TabIndex = 0;
        this.listView1.Text = "listView1";
        this.listView1.View = System.Windows.Forms.View.Details;
        this.listView1.AfterLabelEdit += 
            new System.Windows.Forms.LabelEditEventHandler(this.ListView1_afterLabelEdit);

        // 
        // label1
        // 
        this.label1.Location = new System.Drawing.Point(16, 8);
        this.label1.Name = "label1";
        this.label1.Size = new System.Drawing.Size(272, 24);
        this.label1.TabIndex = 3;
        this.label1.Text = "To change the text for a tooltip, click on a selected label.";

        // 
        // ChangeToolTips
        // 
        this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
        this.ClientSize = new System.Drawing.Size(302, 302);
        this.Controls.AddRange(new System.Windows.Forms.Control[] {
            this.label1, this.listView1,this.btnOk});
        this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
        this.MaximizeBox = false;
        this.MinimizeBox = false;
        this.Name = "ChangeToolTips";
        this.ShowInTaskbar = false;
        this.Text = "ChangeToolTips";
        this.ResumeLayout(false);
    }
}
