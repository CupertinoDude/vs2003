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
using System.Messaging;
	
public class SendObject
{
        public static void Main(String[] args) 
	{
		string mqPath = ".\\MQSendSample";

		if(!MessageQueue.Exists(mqPath))
		{
			MessageQueue.Create(mqPath);
		}
		
		MessageQueue mq = new MessageQueue(mqPath);

		Customer customer = new Customer();
		customer.LastName = "Copernicus";
		customer.FirstName = "Nicolaus";		
		mq.Send(customer);	
        }
}