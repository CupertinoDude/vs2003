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
using System.Collections;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public class Login : PortalModuleControl {
    public TextBox              UserName;
    public HtmlInputText        Password;
    public HtmlContainerControl ErrorMsg;

    private bool Authenticate(String user, String pass) {
      bool authenticated = false;
      String dsn = (String) ((NameValueCollection) Context.GetConfig("system.web/dsnstore"))["portaldb"];
      SqlCommand myCommand = new SqlCommand();
      myCommand.Connection = new SqlConnection(dsn) ;
        try {
            myCommand.Connection.Open();
            myCommand.CommandText = "sp_ValidateUser" ;
            myCommand.CommandType = CommandType.StoredProcedure ;

            SqlParameter myUserId = new SqlParameter("@UserId", SqlDbType.NVarChar, 20);
            myUserId.Value =  user.Trim();
            myCommand.Parameters.Add(myUserId);

            SqlParameter myPassword = new SqlParameter("@Password",SqlDbType.NVarChar, 15);
            myPassword.Value = pass.Trim();
            myCommand.Parameters.Add(myPassword);

            SqlParameter IsValid = new SqlParameter("@IsValid",SqlDbType.Int);
            IsValid.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(IsValid);
            myCommand.ExecuteNonQuery();

            if (((int)IsValid.Value) == 1)
               authenticated =true;
        }
        catch(Exception e) {
        }
	finally {
	    myCommand.Connection.Close();
	}
      return authenticated;
    }

    protected void SubmitBtn_Click(Object sender, EventArgs e) {
        if (Authenticate(UserName.Text, Password.Value)) {
            System.Web.Security.FormsAuthentication.SetAuthCookie(UserName.Text, true);
            Response.Redirect("/quickstart/aspplus/samples/portal/CS/default.aspx");
        }
        else {
            ErrorMsg.Visible = true;
        }
    }
}