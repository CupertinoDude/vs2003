'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports System
Imports System.Collections
Imports System.Configuration.Install
Imports System.ServiceProcess
Imports System.ComponentModel

<RunInstaller(true)> public class ProjectInstaller: inherits installer

	private serviceInstaller As ServiceInstaller
	private processInstaller As ServiceProcessInstaller

	public Sub New()
		MyBase.New()

        processInstaller = new ServiceProcessInstaller()
        serviceInstaller = new ServiceInstaller()

		' Service will run under system account
        processInstaller.Account = ServiceAccount.LocalSystem

		' Service will have Start Type of Manual
        serviceInstaller.StartType = ServiceStartMode.Manual

		serviceInstaller.ServiceName = "Hello-World Service"

        Installers.Add(serviceInstaller)
        Installers.Add(processInstaller)
	end sub
end class
