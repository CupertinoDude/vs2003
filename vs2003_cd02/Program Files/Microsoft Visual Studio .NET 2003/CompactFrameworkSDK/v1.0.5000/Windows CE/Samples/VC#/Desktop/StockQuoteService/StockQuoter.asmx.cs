//------------------------------------------------------------------------------
//  <copyright from='1997' to='2002' company='Microsoft Corporation'>
//   Copyright (c) Microsoft Corporation. All Rights Reserved.
//
//   This source code is intended only as a supplement to Microsoft
//   Development Tools and/or on-line documentation.  See these other
//   materials for detailed information regarding Microsoft code samples.
//
//   </copyright>
//-------------------------------------------------------------------------------
//
// File: StockQuoter.asmx.cs
//
// Purpose: This file contains a single web-service class with a single
//			web-method, getQuoteDataSet(). Please add this file to a
//			C# Web Service project on your development server and build it.
//			This service is used by StockQuote, an sample application
//			for the .NET Compact Framework built using Smart Device
//			Extensions for Visual Studio.NET.
// 
//			Detailed instructions are available in the samples documentation.
//

using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using System.Reflection;

/// <summary>
/// 
/// </summary>

namespace StockQuoteService
{
	/// <summary>
	/// StockQuoter 
	/// <c>Microsoft Corp 2002</c>.
	/// </summary>
	public class StockQuoter : System.Web.Services.WebService
	{
		public StockQuoter()
		{
			//CODEGEN: This call is required by the ASP.NET Web Services Designer
			InitializeComponent();
		}

		#region Component Designer generated code
		
		//Required by the Web Services Designer 
		private IContainer components = null;
				
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if(disposing && components != null)
			{
				components.Dispose();
			}
			base.Dispose(disposing);		
		}
		
		#endregion


		/// <summary>
		/// 
		/// </summary>



		[WebMethod]
		public DataSet getQuoteDataSet() 
		{
			DataSet dsIn = new DataSet();

			try 
			{	

				Stream	sIn = Assembly.GetExecutingAssembly().GetManifestResourceStream("StockQuoteService.stockdata.xml");
				StreamReader srXMLReader = new StreamReader(sIn);
				
				dsIn.ReadXml(srXMLReader);
				
				srXMLReader.Close();
				sIn.Close();
			}
			catch (Exception e)
			{
				throw new DataSetNotFoundException("Unable to access the dataset: " + e.Message);
			}

			return dsIn;

		}
	}
	
	public class DataSetNotFoundException : System.Exception
	{

		public DataSetNotFoundException () : base ()
		{
		}

		public DataSetNotFoundException (String m) : base (m) 
		{
		}
	}
}
