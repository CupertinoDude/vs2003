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

public class Customer
{
	protected string lastName;
	protected string firstName;
	
	public string LastName{
		get{
			return this.lastName;
		}
		set{
			this.lastName = value;
		}
	}

	public string FirstName{
		get{
			return this.firstName;
		}
		set{
			this.firstName = value;
		}
	}	

	public string FullName{
		get{
			return (FirstName + LastName);
		}
	}
}