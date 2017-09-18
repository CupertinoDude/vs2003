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
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class User : PortalModulePage
{
  public TextBox  userid;
  public TextBox  passwd;
  public TextBox  fn;
  public TextBox  ln;
  public TextBox  address;
  public TextBox  city;
  public TextBox  adrstate;
  public TextBox  zip;
  public TextBox  phone;
  public Label    Err;

    public void Cancel_Click(Object sender, EventArgs e)
    {
         Response.Redirect("/quickstart/aspplus/samples/portal/CS/default.aspx");
    }

    public void Create_User(Object sender, EventArgs e)
    {

      if  (Page.IsValid)
      {
          SqlCommand myCommand = new SqlCommand();
          String dsn = (String) ((NameValueCollection) Context.GetConfig("system.web/dsnstore"))["portaldb"];
          myCommand.Connection = new SqlConnection(dsn);
          myCommand.Connection.Open();

          myCommand.CommandType = CommandType.StoredProcedure;
          myCommand.CommandText = "sp_CreateProfile" ;

          SqlParameter myUserId = new SqlParameter("@UserId", SqlDbType.NVarChar, 20);
          myUserId.Value =  userid.Text;
          myCommand.Parameters.Add(myUserId);

          SqlParameter myPassword = new SqlParameter("@Password",SqlDbType.NVarChar, 15);
          myPassword.Value = passwd.Text;
          myCommand.Parameters.Add(myPassword);

          SqlParameter myFName = new SqlParameter("@FirstName",SqlDbType.NVarChar, 15);
          myFName.Value =  fn.Text;
          myCommand.Parameters.Add(myFName);

          SqlParameter myLName = new SqlParameter("@LastName",SqlDbType.NVarChar, 15);
          myLName.Value = ln.Text;
          myCommand.Parameters.Add(myLName);

          SqlParameter myAddress = new SqlParameter("@Address",SqlDbType.NVarChar, 50);
          myAddress.Value = address.Text ;
          myCommand.Parameters.Add(myAddress);

          SqlParameter myCity = new SqlParameter("@City",SqlDbType.NVarChar, 50);
          myCity.Value = city.Text ;
          myCommand.Parameters.Add(myCity);

          SqlParameter myState =  new SqlParameter("@State",SqlDbType.NVarChar, 2);
          myState.Value =  adrstate.Text;
          myCommand.Parameters.Add(myState);

          SqlParameter myZip = new SqlParameter("@Zip",SqlDbType.NVarChar,5);
          myZip.Value = zip.Text;
          myCommand.Parameters.Add(myZip);

          SqlParameter myPhone = new SqlParameter("@Phone",SqlDbType.NVarChar, 15 );
          myPhone.Value = phone.Text ;
          myCommand.Parameters.Add(myPhone);

          try
          {
              myCommand.ExecuteNonQuery();
              System.Web.Security.FormsAuthentication.SetAuthCookie(userid.Text, true);
              Response.Redirect("/quickstart/aspplus/samples/portal/CS/congrats.aspx");
          }
          catch(SqlException ex)
          {
             Err.Visible=true;
          }
	  finally {
             myCommand.Connection.Close();
	  }
        }
    }
}