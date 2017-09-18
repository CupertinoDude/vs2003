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
using System.Text;
using System.Runtime.InteropServices;

namespace StringClient
{
	public class StringLibTest 
	{
		public static void Main()
		{
			StringTest2Lib.ITestString strServer;
			strServer = new StringTest2Lib.TestString();	
			
			String param1 = "String Sample 1";
			String param2 = "String Sample 2";
			String param3 = "String Sample 3";			
			
			
		        Console.WriteLine("\nCalling PassBSTR with s = {0}", param1);
		        strServer.PassBStr(param1);
		        Console.WriteLine("After call s = {0}\n", param1);			
				
		        Console.WriteLine("\nCalling PassLPStr with s = {0}", param2);
		        strServer.PassLPStr(param2);
		        Console.WriteLine("After call s = {0}\n", param2);
		
		        Console.WriteLine("\nCalling PassLPWStr with s = {0}", param3);
		        strServer.PassLPWStr(param3);
		        Console.WriteLine("After call s = {0}\n", param3);


		        Console.WriteLine("\nCalling PassBSTRRef with s = {0}", param1);
		        strServer.PassBStrRef(ref param1);
		        Console.WriteLine("After call s = {0}\n", param1);	
		 
		        Console.WriteLine("\nCalling PassLPStrRef with s = {0}", param2);
		   	strServer.PassLPStrRef(ref param2);
		        Console.WriteLine("After call s = {0}\n", param2);
		
		        Console.WriteLine("\nCalling PassLPWStrRef with s = {0}", param3);
		        strServer.PassLPWStrRef(ref param3);
		        Console.WriteLine("After call s = {0}\n", param3);
		
	
			Console.Write("Press Enter to quit\n");	
			String s = Console.ReadLine();				
			while (s != "")
			{
				s = Console.ReadLine();
			}					
		}
	}
}


