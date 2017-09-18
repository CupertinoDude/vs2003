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

#using <mscorlib.dll>
using namespace System;

#using <System.dll>
using namespace Text;
using namespace System::Runtime::InteropServices;
#using <StringTest2Lib.dll>

// remember to run regsvr32 StringTest2.dll first

void main()
{

	StringTest2Lib::ITestString * strServer = new StringTest2Lib::TestStringClass;
	
            String * param1 = S"String Sample 1";
            String * param2 = S"String Sample 2";
            String * param3 = S"String Sample 3";            
            
			
			Console::WriteLine(S"\nCalling PassBSTR with s = {0}", param1);
                strServer->PassBStr(param1);
				Console::WriteLine("After call s = {0}\n", param1);            
                
				Console::WriteLine(S"\nCalling PassLPStr with s = {0}", param2);
                strServer->PassLPStr(param2);
				Console::WriteLine(S"After call s = {0}\n", param2);
        
				Console::WriteLine(S"\nCalling PassLPWStr with s = {0}", param3);
                strServer->PassLPWStr(param3);
				Console::WriteLine(S"After call s = {0}\n", param3);


				Console::WriteLine(S"\nCalling PassBSTRRef with s = {0}", param1);
                strServer->PassBStrRef(&param1);
				Console::WriteLine(S"After call s = {0}\n", param1);    
         
				Console::WriteLine(S"\nCalling PassLPStrRef with s = {0}", param2);
               strServer->PassLPStrRef(&param2);
			   Console::WriteLine(S"After call s = {0}\n", param2);
        
			   Console::WriteLine(S"\nCalling PassLPWStrRef with s = {0}", param3);
                strServer->PassLPWStrRef(&param3);
				Console::WriteLine(S"After call s = {0}\n", param3);
        
    
				Console::Write(S"Press Enter to quit\n");    
				String * s = Console::ReadLine();                
            while (s != S"")
            {
				s = Console::ReadLine();
            }                    
}


  