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
using System.Runtime.InteropServices;
using ExplorerLib;

namespace TestClient
{
	public class Test 
	{
		public static void Main()
		{
			ExplorerLib.InternetExplorer explorer;
			IWebBrowserApp webBrowser;			
			
			explorer = new ExplorerLib.InternetExplorer();
			webBrowser = (IWebBrowserApp) explorer;
			
			//Title Change event
			DWebBrowserEvents2_TitleChangeEventHandler dTitleChangeE
				= new DWebBrowserEvents2_TitleChangeEventHandler(OnTitleChange);
			
			explorer.TitleChange += dTitleChangeE;	
						
			webBrowser.Visible = true;
			webBrowser.GoHome();	
			
			Console.WriteLine("Press Enter to quit");	
			String s = Console.ReadLine();	
					
			while (s != "")
			{
				s = Console.ReadLine();
			}
				
            try 
            {
            	webBrowser.Quit();
            }
            catch(COMException)	
            {
            	Console.WriteLine("Explorer closed");
            }		
		}
		
		static void OnTitleChange(String text)
		{
			Console.WriteLine("Title changes to {0}", text);
		}
	}
}


