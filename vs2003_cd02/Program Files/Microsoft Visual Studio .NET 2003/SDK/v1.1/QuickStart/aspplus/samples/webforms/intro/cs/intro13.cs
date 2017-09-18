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
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public class MyCodeBehind : Page {

    public TextBox      Name;
    public DropDownList Category;
    public DataList     MyList;

    public void SubmitBtn_Click(Object sender, EventArgs e) {

        if (Page.IsValid) {

           SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
           SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where type='" + Category.SelectedItem.Value + "'", myConnection);

           DataSet ds = new DataSet();
           myCommand.Fill(ds, "Titles");

           MyList.DataSource = ds.Tables["Titles"].DefaultView;
           MyList.DataBind();
        }
    }
}