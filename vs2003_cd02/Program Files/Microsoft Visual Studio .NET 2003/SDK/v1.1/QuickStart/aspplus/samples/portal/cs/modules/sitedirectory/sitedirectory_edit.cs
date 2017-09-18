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

public class SiteDirectoryEdit : PortalModulePage
{
  public DataGrid myDataGrid;

    protected void Page_Load(Object sender, EventArgs e)
    {
        ArrayList Source;
        String dsn = (String) ((NameValueCollection) Context.GetConfig("system.web/dsnstore"))["portaldb"];

        SqlDataAdapter myAdapter = new SqlDataAdapter();

        myAdapter.SelectCommand  = new SqlCommand();
        myAdapter.SelectCommand.Connection = new SqlConnection(dsn);
        myAdapter.SelectCommand.CommandText = "GetSiteLinks" ;
        myAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

        DataSet myDataSet = new DataSet();
	
	try {
            myAdapter.Fill(myDataSet, "Results");

            String [] LinkList = null;
            String LinkIndices= UserState["SiteDirectory_Links"];

            if (LinkIndices != null)
                LinkList = LinkIndices.Split(new char[] { ',' });

            DataRowCollection rows = myDataSet.Tables[0].Rows;
            // DataColumn [] columns  = myDataSet.Tables[0].Columns.All;

            int index = 0;
            Source = new ArrayList();

            for (int i=0; i<rows.Count; i++)
            {
                Hashtable propertyBag = new Hashtable();

                for (int j=0; j<myDataSet.Tables[0].Columns.Count;j++) {
                    Object value = myDataSet.Tables[0].Rows[i][myDataSet.Tables[0].Columns[j]];
                    if (String.Compare(myDataSet.Tables[0].Columns[j].ToString(), "LinkRef") == 0)
                        propertyBag[myDataSet.Tables[0].Columns[j].ToString()] = (value == null) ? "" : Request.ApplicationPath + '/' + value.ToString();
                    else
                        propertyBag[myDataSet.Tables[0].Columns[j].ToString()] = (value == null) ? "" : value.ToString();
                }

                propertyBag["IsChecked"] = false;
    
                if (LinkIndices != null)
                {
                    if ((index < LinkList.Length) && (i == (Int32.Parse(LinkList[index])-1)))
                    {
                        propertyBag["IsChecked"] = true;
                        index++;
                    }
                }
                Source.Add (propertyBag);
            }
    
            myDataGrid.DataSource = Source;
            if(! IsPostBack)
            DataBind();
	}
	catch (Exception ex){
    	    throw (ex);
	}
	finally{
    	    myAdapter.SelectCommand.Connection.Close();
	}
    }

    protected void Submit_Click(Object sender, EventArgs evt)
    {
        String s = "";

        for (int i=0; i<myDataGrid.Items.Count; i++)
        {
            if( ((HtmlInputCheckBox) myDataGrid.Items[i].FindControl("mSelected")).Checked )
               s += (i+1) + ",";
        }

        char[] comma = {','};
        UserState["SiteDirectory_Links"] = s.TrimEnd(comma);
        Response.Redirect("/quickstart/aspplus/samples/portal/CS/default.aspx");
    }
}
