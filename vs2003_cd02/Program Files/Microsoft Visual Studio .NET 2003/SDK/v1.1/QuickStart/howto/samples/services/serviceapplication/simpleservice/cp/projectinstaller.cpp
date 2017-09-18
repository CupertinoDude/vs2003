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

// projectinstaller.cpp

#using <mscorlib.dll>
using namespace System;
using namespace System::Collections;

#using <System.dll>
using namespace System::ComponentModel;

#using <System.ServiceProcess.dll>
using namespace System::ServiceProcess;

#using <System.Configuration.Install.dll>
using namespace System::Configuration::Install;

[RunInstallerAttribute(true)]
__gc public class ProjectInstaller : public Installer
{
private:
	ServiceInstaller* serviceInstaller;
	ServiceProcessInstaller* processInstaller;

public:
	ProjectInstaller()
	{
		processInstaller = new ServiceProcessInstaller();
		serviceInstaller = new ServiceInstaller();

		// Service will run under system account
		processInstaller->Account = ServiceAccount::LocalSystem;

		// Service will have Start Type of Manual
		serviceInstaller->StartType = ServiceStartMode::Manual;

		serviceInstaller->ServiceName = S"Hello-World Service";

		get_Installers()->Add(serviceInstaller);
		get_Installers()->Add(processInstaller);
	}
};