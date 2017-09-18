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



namespace Microsoft.Samples.Windows.Forms.Cs.UpDownCtl {
    using System;

	/// <summary>
        //     This class defines the objects in the DomainUpDown controls that drive
        //     the properties of the UpDown controls ComboBoxes.
	/// </summary>
	public class StringIntObject 
	{
		public string s;
		public int i;

		public StringIntObject(string sz, int n) 
		{
			s=sz;
			i=n;
		}

		public override string ToString() 
		{
			return s;
		}
	}
}
