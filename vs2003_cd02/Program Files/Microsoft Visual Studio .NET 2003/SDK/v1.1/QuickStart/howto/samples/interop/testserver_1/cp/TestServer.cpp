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
using namespace System::Reflection;
using namespace System::Runtime::CompilerServices;

[assembly:AssemblyKeyFile("TestKey.snk")];
[assembly:AssemblyVersion("1.0.0.0")];

namespace TestServer {

    public __gc __interface ITest {
        DateTime GetTime();
    };

    public __gc class Test : public ITest {
        DateTime  GetTime() {
            return DateTime::Now;
        }
    };
    
}

  