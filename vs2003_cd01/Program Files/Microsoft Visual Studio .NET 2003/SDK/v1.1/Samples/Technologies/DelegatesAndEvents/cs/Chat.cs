/*=====================================================================
  File:      Chat.cs

  Summary:   Demonstrates how to use delegates and events.

---------------------------------------------------------------------
  This file is part of the Microsoft .NET Framework SDK Code Samples.

  Copyright (C) Microsoft Corporation.  All rights reserved.

This source code is intended only as a supplement to Microsoft
Development Tools and/or on-line documentation.  See these other
materials for detailed information regarding Microsoft code samples.

THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.
=====================================================================*/

// Add the classes in the following namespaces to our namespace
using System;


///////////////////////////////////////////////////////////////////////////////


class DChatServer {
    // Declare a multicast delegate type
    public delegate void OnMsgArrived(String message);

    // Declare a reference to an OnGetString delegate
    private static OnMsgArrived onMsgArrived;

    // Private to prevent instances of this type from being instantiated.
    private DChatServer() {}

    // This function is necessary because we are not using an event
    public static void ClientConnect(OnMsgArrived onMsgArrived) {
        DChatServer.onMsgArrived = (OnMsgArrived)
            Delegate.Combine(DChatServer.onMsgArrived, onMsgArrived);
    }

    // This function is necessary because we are not using an event
    public static void ClientDisconnect(OnMsgArrived onMsgArrived) {
        DChatServer.onMsgArrived = (OnMsgArrived)
            Delegate.Remove(DChatServer.onMsgArrived, onMsgArrived);
    }

    public static void SendMsg(String msg) {
        // Send message to ALL clients
        SendMsg(msg, null);
    }

    public static void SendMsg(String msg, Object excludeClient) {
        // Send message to all clients except 'excludeClient'
        if (excludeClient == null) {
            onMsgArrived(msg);
        } else {
            Delegate[] DelegateList = onMsgArrived.GetInvocationList();
            for (int i = 0; i < DelegateList.Length; i++) {
                if (DelegateList[i].Target != excludeClient) {
                    ((OnMsgArrived) DelegateList[i])(msg);
                }
            }            
        }        
    }    
}


///////////////////////////////////////////////////////////////////////////////


class DChatClient {
    private void onMsgArrived(String msg) {
        Console.WriteLine("Msg arrived (Client {0}): {1}", clientName, msg);
    }

    private String clientName;

    public DChatClient(String clientName) {
        this.clientName = clientName;
        DChatServer.ClientConnect(new DChatServer.OnMsgArrived(onMsgArrived));
    }

    public void Dispose() {
        DChatServer.ClientDisconnect(new DChatServer.OnMsgArrived(onMsgArrived));
        GC.SuppressFinalize(this);
    }

    ~DChatClient() {
        Dispose();        
    }
}


///////////////////////////////////////////////////////////////////////////////


class EChatServer {
    // Declare a multicast (because return type is void) delegate type
    public delegate void OnMsgArrived(String message);

    // Declaring an event causes the compiler to generate a PRIVATE field 
    // (onMsgArrived) that references the tail of an OnMsgArrived delegate 
    // linked-list. The compiler also generates two PUBLIC methods, 
    // add_onMsgArrived and remove_onMsgArrived which are called when the 
    // += and -= operators are applied to the event's delegate.
    public static event OnMsgArrived onMsgArrived;

    // Private to prevent instances of this type from being instantiated.
    private EChatServer() {}

    public static void SendMsg(String msg) {
        // Send message to ALL clients
        SendMsg(msg, null);
    }

    public static void SendMsg(String msg, Object excludeClient) {
        // Send message to all clients except 'excludeClient'
        if (excludeClient == null) {
            onMsgArrived(msg);
        } else {
            Delegate[] DelegateList = onMsgArrived.GetInvocationList();
            for (int i = 0; i < DelegateList.Length; i++) {
                if (DelegateList[i].Target != excludeClient) {
                    ((OnMsgArrived) DelegateList[i])(msg);
                }
            }            
        }        
    }    
}


///////////////////////////////////////////////////////////////////////////////


class EChatClient {
    private void onMsgArrived(String msg) {
        Console.WriteLine("Msg arrived (Client {0}): {1}", clientName, msg);
    }

    private String clientName;

    public EChatClient(String clientName) {
        this.clientName = clientName;
        EChatServer.onMsgArrived += new EChatServer.OnMsgArrived(onMsgArrived);
    }

    public void Dispose() {
        EChatServer.onMsgArrived -= new EChatServer.OnMsgArrived(onMsgArrived);
        GC.SuppressFinalize(this);
    }

    ~EChatClient() {
        Dispose();        
    }
}


///////////////////////////////////////////////////////////////////////////////


class Application {
    private static void DelegateChatServerDemo() {
        Console.WriteLine("Demo start: Delegate Chat Server.");

        DChatClient cc1 = new DChatClient("1");
        DChatClient cc2 = new DChatClient("2");
        DChatClient cc3 = new DChatClient("3");

        DChatServer.SendMsg("Hi to all clients");
        DChatServer.SendMsg("Hi to all clients except client 2", cc2);

        // Explicitly disconnect the clients from the chat server.
        // If we didn't do this, the clients' memory could not be 
        // reclaimed until the server is collected (app shutdown time).
        cc1.Dispose();
        cc2.Dispose();
        cc3.Dispose();
        Console.WriteLine("Demo stop: Delegate Chat Server.");
    }

    private static void EventChatServerDemo() {
        Console.WriteLine("\n\nDemo start: Event Chat Server.");
        EChatClient cc1 = new EChatClient("1");
        EChatClient cc2 = new EChatClient("2");
        EChatClient cc3 = new EChatClient("3");

        EChatServer.SendMsg("Hi to all clients");
        EChatServer.SendMsg("Hi to all clients except client 2", cc2);

        // Explicitly disconnect the clients from the chat server.
        // If we didn't do this, the clients' memory could not be 
        // reclaimed until the server is collected (app shutdown time).
        cc1.Dispose();
        cc2.Dispose();
        cc3.Dispose();
        Console.WriteLine("Demo stop: Event Chat Server.");
    }

    public static void Main() {
        DelegateChatServerDemo();
        EventChatServerDemo();
    }
}


///////////////////////////////// End of File /////////////////////////////////
