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

import System;
import System.Data;
import System.Data.SqlClient;
import System.Web.UI;
import System.Web.UI.WebControls;
import System.Web.UI.HtmlControls;

public class MyCodeBehind extends Page {

    public var Name : TextBox;
    public var Category : DropDownList;
    public var MyList : DataList;

    public function SubmitBtn_Click(sender : Object, e : EventArgs) : void {

        if (Page.IsValid) {

           var myConnection : SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
           var  myCommand : SqlDataAdapter = new SqlDataAdapter("select * from Titles where type='" + Category.SelectedItem.Value + "'", myConnection);

           var ds : DataSet = new DataSet();
           myCommand.Fill(ds, "Titles");

           MyList.DataSource = ds.Tables("Titles").DefaultView;
           MyList.DataBind();
        }
    }
}