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
Imports System.Messaging

public class Formatters

    public shared sub Main()
        Dim mqPath As String = ".\FormattersSample"
        if(not MessageQueue.Exists(mqPath)) then
            MessageQueue.Create(mqPath)
        end if
		
        Dim mq As MessageQueue = new MessageQueue(mqPath)
		
        Dim order As Order = new Order()
        order.OrderId = 102
        order.ItemDescription = "MS Visual Studio 7"

        mq.Formatter = new XmlMessageFormatter()    	
        mq.Send(order)

        mq.Formatter = new BinaryMessageFormatter()		
        mq.Send(order)

        mq.Formatter = new ActiveXMessageFormatter()
        mq.Send(10)
    end sub

end class