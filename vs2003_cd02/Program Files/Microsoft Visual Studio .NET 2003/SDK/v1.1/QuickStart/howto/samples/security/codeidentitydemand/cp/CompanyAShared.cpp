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
using namespace System::Security::Permissions;

[assembly:AssemblyKeyFile("../keypair.dat")];
//[assembly:System::Security::AllowPartiallyTrustedCallersAttribute];
namespace SharedSamples {

  [StrongNameIdentityPermission(SecurityAction::Demand, PublicKey="0024000004800000940000000602000000240000525341310004000001000100bf01b056b9778a08f3b7b7a573b1a6e6e1bf18af004f8f017997a28b4378ea7b389932c9f537df90190b994c1e0849a4222a6d87761bc96d2a16d8a36865c6d7d031fa3109ed9711d064d20e7059aa945dfe10cdd64d3249c10b76e2759556d3554f7708ade90c9453b1118f97a492b81ba33d193ee8df19b29af7dabae691d5")]
	 __gc public class SharedComponent {

	 public:
		String* GetInfo() {
			return S"Information only trusted callers should get.";
		};

	 };

}

