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

public class Customize : PortalModulePage
{
    public String           pageName;
    public HtmlInputControl txtPageName;
    public DataGrid         myDataGrid;

    private int             pageIndex;
    private String []       pageList;
    private ArrayList       Source;

    protected void Page_Load(Object sender, EventArgs e)
    {
        String dsn = (String) ((NameValueCollection) Context.GetConfig("system.web/dsnstore"))["portaldb"];

        SqlDataAdapter myAdapter = new SqlDataAdapter();
        myAdapter.SelectCommand = new SqlCommand();
        myAdapter.SelectCommand.Connection = new SqlConnection(dsn);
        myAdapter.SelectCommand.CommandText =  "GetPublicModules";
        myAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet myDataSet = new DataSet();
	
	try {
            myAdapter.Fill(myDataSet,"Results");
        	
            if (Request.Cookies["_PageIndex"] != null) {
                pageIndex = Int32.Parse(Request.Cookies["_PageIndex"].Value);
            }
            else
            {
                pageIndex = 0;
            }

            String pageNames = UserState["PageNames"];

            pageList = pageNames.Split(new char[] { ';' });
            pageName = pageList[pageIndex];
    
            Hashtable moduleHash = new Hashtable();
    
            String leftModules = UserState["PageModules_" + pageIndex + "L"];
            if (leftModules != null)
            {
                String [] leftModuleList = leftModules.Split(new char[] {';'});
                for (int i=0;i<leftModuleList.Length;i++)
                   moduleHash[leftModuleList[i]] = true;
            }
    
            String rightModules = UserState["PageModules_" + pageIndex + "R"];
            if (rightModules != null)
            {
                String [] rightModuleList = rightModules.Split(new char[] {';'});
                for (int i=0;i<rightModuleList.Length;i++)
                   moduleHash[rightModuleList[i]] = true;
            }
    
            DataRowCollection rows = myDataSet.Tables[0].Rows;
    
            Source = new ArrayList();
    
            for (int i=0; i<rows.Count; i++) {
    
               Hashtable propertyBag = new Hashtable();
    
               for (int j=0; j<myDataSet.Tables[0].Columns.Count;j++) {
                  Object value = myDataSet.Tables[0].Rows[i][myDataSet.Tables[0].Columns[j]];
                  propertyBag[myDataSet.Tables[0].Columns[j].ToString()] = (value== null) ? "" : value.ToString();
               }
    
               if (moduleHash[propertyBag["Source"]] != null)
                   propertyBag["IsChecked"] = true;
               else
                   propertyBag["IsChecked"] = false;
    
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

    public void Submit_Click(Object sender, EventArgs evt)
    {
        String sLeft = "";
        String sRight = "";
        for (int i=0; i<myDataGrid.Items.Count; i++)
        {
              if( ((HtmlInputCheckBox) myDataGrid.Items[i].FindControl("mSelected")).Checked )

                  if (String.Compare (((Label) myDataGrid.Items[i].FindControl("mType")).Text ,"L") == 0)
                      sLeft += ((Hashtable)Source[i])["Source"] + ";";
                  else
                      sRight += ((Hashtable)Source[i])["Source"] + ";";
            }

            if (Request.Cookies["_PageIndex"] == null)
                pageIndex = 0;

            char[] semi = {';'};
            if (String.Compare(UserState["UserId"],"ANONYMOUS") != 0)
            {
                UserState["PageModules_" + pageIndex + "L"] = sLeft.TrimEnd(semi);
                UserState["PageModules_" + pageIndex + "R"] = sRight.TrimEnd(semi);
            }

            pageList[pageIndex] = txtPageName.Value;
            String s = "";
            for (int i=0; i<pageList.Length; i++)
                s += pageList[i] + ";";

            UserState["PageNames"] = s.TrimEnd(semi);

            Response.Redirect("/quickstart/aspplus/samples/portal/CS/default.aspx");
    }
}