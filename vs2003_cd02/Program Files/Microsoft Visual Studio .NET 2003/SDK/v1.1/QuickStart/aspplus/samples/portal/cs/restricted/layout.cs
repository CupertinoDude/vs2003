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

public class Layout : PortalModulePage {
    public int                  selectSize = 5;
    public HtmlContainerControl pageName;
    public HtmlSelect           mySelect;
    public HtmlSelect           mySelect2;

    private Hashtable   moduleTable;
    private int         pageIndex = 0;

    private void BuildModuleList(HtmlSelect list, String Modules) {

        if ((Modules == null)||(Modules == "")||(Modules == "System.DBNull"))
           return;

        String [] ModuleList = Modules.Split(new char[] {';'});

        for (int i=0;i<ModuleList.Length;i++) {
           String moduleSource = ModuleList[i];
           if (moduleSource != null &&  moduleSource !="") {
                list.Items.Add( new ListItem(moduleTable[moduleSource].ToString(), moduleSource));
           }
        }
    }

    protected void Page_Load(Object sender, EventArgs e) {

    if (Request.Cookies["_PageIndex"] != null)
        pageIndex = Int32.Parse(Request.Cookies["_PageIndex"].Value);

        if (String.Compare(Request.HttpMethod,"Post" , true) != 0 ) {
            String dsn = (String) ((NameValueCollection) Context.GetConfig("system.web/dsnstore"))["portaldb"];
            SqlDataAdapter myAdapter = new SqlDataAdapter();

            myAdapter.SelectCommand = new SqlCommand();
            myAdapter.SelectCommand.Connection = new SqlConnection(dsn);
            myAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            myAdapter.SelectCommand.CommandText = "GetPublicModules";

            DataSet myDataSet = new DataSet();
	    try {
                myAdapter.Fill(myDataSet, "Results");

                DataView Source = myDataSet.Tables[0].DefaultView;

                moduleTable = new Hashtable();
                for (int i=0; i<Source.Count; i++) {
                    String moduleName = Source[i]["Name"].ToString();
                    String moduleSource = Source[i]["Source"].ToString();
                    moduleTable[moduleSource] = moduleName;
                }

                BuildModuleList(mySelect, UserState["PageModules_" + pageIndex + "L"]);
                BuildModuleList(mySelect2, UserState["PageModules_" + pageIndex + "R"]);

                String pageNames = UserState["PageNames"];

                if (pageNames == null)
                    return;

                String [] pageList = pageNames.Split(new char[] { ';' });
                pageName.InnerHtml = pageList[pageIndex];
	    }
	    catch (Exception ex){
    		throw (ex);
	    }
	    finally{
	        myAdapter.SelectCommand.Connection.Close();
	    }
        } else if(! IsPostBack) {
            char[] semi = {';'};
            String [] leftModuleList = {""};
            String leftModules = Request.Form["mySelect"];

            if (leftModules != null)
                leftModuleList = leftModules.Split(new char[] {','});

            String sLeft = "";

            for (int i=0; i<leftModuleList.Length; i++)
                sLeft += leftModuleList[i] + ";";

            String [] rightModuleList = {""};
            String rightModules = Request.Form["mySelect2"];

            if (rightModules != null)
                rightModuleList = rightModules.Split(new char[] {','});

            String sRight = "";

            for (int i=0; i<rightModuleList.Length; i++)
                sRight += rightModuleList[i] + ";";

            if (String.Compare(UserState["UserId"],"ANONYMOUS") != 0) {
                UserState["PageModules_" + pageIndex + "L"] = sLeft.TrimEnd(semi);
                UserState["PageModules_" + pageIndex + "R"] = sRight.TrimEnd(semi);
            }
            Response.Redirect("/quickstart/aspplus/samples/portal/CS/default.aspx");
        }
    }
}