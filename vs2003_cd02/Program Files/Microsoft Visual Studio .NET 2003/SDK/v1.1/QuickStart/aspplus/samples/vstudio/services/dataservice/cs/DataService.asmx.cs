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

using System.Reflection;

[assembly: AssemblyTitle("")]
[assembly: AssemblyDescription("A QuickStart Tutorial Assembly")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Microsoft Corporation")]
[assembly: AssemblyProduct("Microsoft QuickStart Tutorials")]
[assembly: AssemblyCopyright(" Microsoft Corporation.  All rights reserved.")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]
[assembly: AssemblyVersion("1.1.*")]

namespace DataService.Cs
{
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Data;
	using System.Data.SqlClient;
    using System.Diagnostics;
    using System.Web;
    using System.Web.Services;

    /// <summary>
    ///    Summary description for DataService.
    /// </summary>
    public class DataServiceService : System.Web.Services.WebService
    {
        public DataServiceService()
        {
            //CODEGEN: This call is required by the XML Web services created using ASP.NET Designer
            InitializeComponent();
        }

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
        }

        /// <summary>
        ///    Clean up any resources being used.
        /// </summary>
        protected override void Dispose(bool disposing)
        {
        }

		[WebMethod]
		public DataSet GetTitleAuthors()
		{

			SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
			SqlDataAdapter myCommand1 = new SqlDataAdapter ("select * from Authors", myConnection);
			SqlDataAdapter myCommand2 = new SqlDataAdapter("select * from Titles", myConnection);

			DataSet ds = new DataSet();
			try {
				myCommand1.Fill(ds, "Authors");
				myCommand2.Fill(ds, "Titles");

				return ds;
			}
			catch (Exception ex){
    				throw (ex);
			}
			finally{
    				myConnection.Close();
			}

		}

		[WebMethod]
		public int PutTitleAuthors(DataSet ds)
		{
			return ds.Tables[0].Rows.Count;
		}
	}
}
