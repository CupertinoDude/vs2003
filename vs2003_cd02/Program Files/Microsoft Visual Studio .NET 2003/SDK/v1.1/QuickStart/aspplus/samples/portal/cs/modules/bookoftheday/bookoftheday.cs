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
using System.Web;
using System.Collections;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class BookOfTheDay : PortalModuleControl
{
    public String GetBookIndex(int index) {
        String[] BookArray = { "TC7777","PC8888","TC3218", "MC3021", "PS2091", "BU7832" };
        return BookArray[index % 6];
    }

    protected void Page_Load(Object Src, EventArgs E )
    {
        String query = "select * from Titles where title_id = '" + GetBookIndex(DateTime.Now.Day) + "'";
        String dsn = (String) ((NameValueCollection) Context.GetConfig("system.web/dsnstore"))["pubs"];
        SqlConnection myConnection = new SqlConnection (dsn);
	try {
           SqlDataAdapter myCommand = new SqlDataAdapter (query, myConnection);

           DataSet ds = new DataSet();
           myCommand.Fill(ds, "Titles");

           DataView myData = ds.Tables["Titles"].DefaultView;
           TitleId = myData[0]["title_id"].ToString();
           Title = myData[0]["title"].ToString();
           Category = myData[0]["type"].ToString();
           Price = myData[0]["price"].ToString();

           DataBind();
	}
	catch (Exception ex){
    	   throw (ex);
	}
	finally{
    	   myConnection.Close();
	}
    }

    private String _TitleId = "";
    private String  _Title = "";
    private String _Category = "";
    private String _Price = "";

    public String TitleId {
      get { return _TitleId; }
      set { _TitleId = value;}
    }

    public String Title {
      get { return _Title; }
      set { _Title = value;}
    }

    public String Category {
      get { return _Category; }
      set { _Category = value;}
    }

    public String Price {
      get { return _Price; }
      set { _Price = value;}
    }
}