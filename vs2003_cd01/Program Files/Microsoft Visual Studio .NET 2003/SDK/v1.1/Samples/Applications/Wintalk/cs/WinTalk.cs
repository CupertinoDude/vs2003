/*=====================================================================
  File:      Wintalk.cs

  Summary:   Demonstrates how to create a socket chat application
             using various .NET Framework library types.

---------------------------------------------------------------------
  This file is part of the Microsoft .NET Framework SDK Code Samples.

  Copyright (C) 2000 Microsoft Corporation.  All rights reserved.

This source code is intended only as a supplement to Microsoft
Development Tools and/or on-line documentation.  See these other
materials for detailed information regarding Microsoft code samples.

THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.
=====================================================================*/

using System;
using System.Globalization;
using System.IO;
using System.Text;
using System.Threading;
using System.Net;
using System.Net.Sockets;
using System.Drawing;
using System.Windows.Forms;

class App{        
    // Entry point
    public static void Main(String[] args){        
        // If the args parse in known way then run the app
        if(ParseArgs(args)){           
            // Create a custom Talker object
            Talker talker = new Talker(endPoint, client);
            // Pass the object reference to a new form object
            TalkForm form = new TalkForm(talker);                   
            // Start the talker "talking"
            talker.Start();

            // Run the applications message pump
            Application.Run(form);
        }        
    }

    // Parsed Argument Storage
    private static IPEndPoint endPoint;
    private static bool client;

    // Parse command line arguments
    private static bool ParseArgs(String[] args){
        try{        
            if(args.Length == 0){
                client = false;
                endPoint = new IPEndPoint(IPAddress.Any,5150);
                return true;
            }
			if (args[0][0]!='/' && args[0][0]!='-') 
			{
				ShowUsage();
				return false;
			}
            switch(Char.ToUpper(args[0][1], CultureInfo.InvariantCulture)){
            case 'L':
                int port = 5150;
                if(args.Length > 1){
                   port = Convert.ToInt32(args[1]);    
                }
                endPoint = new IPEndPoint(IPAddress.Any,port);
                client = false;
                break;
            case 'C':
                port = 5150;
                String address = "127.0.0.1";
                client = true;
                if(args.Length > 1){
                    address = args[1];
                    port = Convert.ToInt32(args[2]);                                        
                }                
                endPoint = new IPEndPoint(Dns.Resolve(address).AddressList[0], port);
                break;
            default:
                ShowUsage();
                return false;
            }
        }catch{
            ShowUsage();
            return false;
        }    
    
        return true;
    }

    // Show sample usage
    private static void ShowUsage(){
        MessageBox.Show("WinTalk [switch] [parameters...]\n\n"+
            "  /L  [port]\t\t-- Listens on a port.  Default:  5150\n"+
            "  /C  [address] [port]\t-- Connects to an address and port.\n\n"+
            "Example Server - \n"+
            "Wintalk /L\n\n"+
            "Example Client - \n"+
            "Wintalk /C ServerMachine 5150","WinTalk Usage");
    }
}

// UI class for the sample
class TalkForm:Form {    
    public TalkForm(Talker talker) {
        // Associate for method with the talker object
        this.talker = talker;
        talker.Notifications += new 
                Talker.NotificationCallback(HandleTalkerNotifications);

        // Create a UI elements
        Splitter talkSplitter = new Splitter();
        Panel talkPanel = new Panel();        

        receiveText = new TextBox();
        sendText = new TextBox(); 
        
        // we'll support up to 64k data in our text box controls
        receiveText.MaxLength = sendText.MaxLength = 65536;
        statusText = new Label();
     
        // Initialize UI elements
        receiveText.Dock = DockStyle.Top;
        receiveText.Multiline = true;
        receiveText.ScrollBars = ScrollBars.Both;
        receiveText.Size = new Size(506, 192);
        receiveText.TabIndex = 1;
        receiveText.Text = "";
        receiveText.WordWrap = false;
        receiveText.ReadOnly = true;
        
        talkPanel.Anchor = (AnchorStyles.Top|AnchorStyles.Bottom
                    |AnchorStyles.Left|AnchorStyles.Right);
        talkPanel.Controls.AddRange(new Control[] {sendText,
                    talkSplitter,
                    receiveText});
        talkPanel.Size = new Size(506, 371);
        talkPanel.TabIndex = 0;

        talkSplitter.Dock = DockStyle.Top;
        talkSplitter.Location = new Point(0, 192);
        talkSplitter.Size = new Size(506, 6);
        talkSplitter.TabIndex = 2;
        talkSplitter.TabStop = false;
        
        statusText.Dock = DockStyle.Bottom;
        statusText.Location = new Point(0, 377);
        statusText.Size = new Size(507, 15);
        statusText.TabIndex = 1;
        statusText.Text = "Status:";

        sendText.Dock = DockStyle.Fill;
        sendText.Location = new Point(0, 198);
        sendText.Multiline = true;
        sendText.ScrollBars = ScrollBars.Both;
        sendText.Size = new Size(506, 173);
        sendText.TabIndex = 0;
        sendText.Text = "";
        sendText.WordWrap = false;
        sendText.TextChanged += new EventHandler(HandleTextChange);
        sendText.Enabled = false;

        AutoScaleBaseSize = new Size(5, 13);
        ClientSize = new Size(507, 392);
        Controls.AddRange(new Control[] {statusText,
                    talkPanel});
        Text = "WinTalk";
    }    

    // When the app closes, dispose of the talker object
    protected override void OnClosed(EventArgs e){
        if(talker!=null){
            // remove our notification handler
            talker.Notifications -= new 
                Talker.NotificationCallback(HandleTalkerNotifications);
            
            talker.Dispose();
        }
        base.OnClosed(e);
    }

    // Handle notifications from the talker object
    private void HandleTalkerNotifications(
        Talker.Notification notify, Object data){
        switch(notify){
        case Talker.Notification.Initialized:
            break;
        // Respond to status changes
        case Talker.Notification.StatusChange:
            Talker.Status status = (Talker.Status)data;
            statusText.Text = String.Format("Status: {0}", status);
            if(status == Talker.Status.Connected){
                sendText.Enabled = true;
				sendText.Focus();
            }
            break;
        // Respond to received text
        case Talker.Notification.ReceivedAppend:
            receiveText.AppendText(data.ToString());
            //receiveText.SelectionStart = Int32.MaxValue;
            //receiveText.ScrollToCaret();        
            break;
        case Talker.Notification.ReceivedRefresh:
            receiveText.Text = data.ToString();
            receiveText.SelectionStart = Int32.MaxValue;
            receiveText.ScrollToCaret();        
            break;
        // Respond to error notifications
        case Talker.Notification.Error:            
            Close(data.ToString());        
            break;
        // Respond to end
        case Talker.Notification.End:                                    
			// Don't send any more text
			sendText.TextChanged -= new EventHandler(HandleTextChange); 
			MessageBox.Show(this, data.ToString(), "Closing WinTalk");             
            Close();
            break;
        default:
            Close();
            break;
        }
    }

    // Handle text change notifications and send talk
    private void HandleTextChange(Object sender, EventArgs e){
        if(talker != null){
            talker.SendTalk((sender as TextBox).Text);
        }        
    }   

    // Close with an explanation
    private void Close(String message){   
        MessageBox.Show(message, "Error!");        
        Close();
    }

    // Private UI elements
    private TextBox receiveText;        
    private TextBox sendText;    
    private Label statusText;
    private Talker talker;   
}

// An encapsulation of the Sockets class used for socket chatting
class Talker:IDisposable{
    // Construct a talker 
    public Talker(IPEndPoint endPoint, bool client){
        this.endPoint = endPoint;
        this.client = client;

        socket = null;
        reader = null;
        writer = null;

        statusText = prevSendText = prevReceiveText = String.Empty;
    }

    // Finalize a talker
    ~Talker(){
        Dispose();
    }

    // Dispose of resources and surpress finalization
    public void Dispose(){        
        GC.SuppressFinalize(this);
        if(reader != null){
            reader.Close();
            reader = null;
        }
        if(writer != null){
            writer.Close();
            writer = null;
        }
        if(socket != null){
            socket.Close();
            socket = null;
        }        
    }

    // Nested delegat class and matchine event
    public delegate 
       void NotificationCallback(Notification notify, Object data);
    public event NotificationCallback Notifications;

    // Nested enum for notifications
    public enum Notification{
        Initialized = 1,
        StatusChange,
        ReceivedRefresh,
		ReceivedAppend,
        End,
        Error
    }

    // Nested enum for supported states
    public enum Status{
        Listening,
        Connected
    }

    // Start up the talker's functionality
    public void Start(){
        ThreadPool.QueueUserWorkItem(new WaitCallback(EstablishSocket));
    }

    // Send text to remote connection
    public void SendTalk(String newText){                
        String send;
        // Is this an append
        if((prevSendText.Length <= newText.Length) && String.CompareOrdinal(
            newText, 0, prevSendText, 0, prevSendText.Length)==0){
            String append = newText.Substring(prevSendText.Length);
            send = String.Format("A{0}:{1}", append.Length, append);
        // or a complete replacement
        }else{
            send = String.Format("R{0}:{1}", newText.Length, newText);
        }   
        // Send the data and flush it out
        writer.Write(send);
        writer.Flush();
        // Save the text for future comparison
        prevSendText = newText;
    }

    // Send a status notification
    private void SetStatus(Status status){
        this.status = status;
        Notifications(Notification.StatusChange, status);
    }

    // Establish a socket connection and start receiving
    private void EstablishSocket(Object state){               
		NetworkStream stream = null;
        try{
            // If not client, setup listner
            if(!client){
                Socket listener;
                
                try{
                    listener = new Socket(AddressFamily.InterNetwork,
                        SocketType.Stream, ProtocolType.Tcp);
                    listener.Blocking = true;
                    listener.Bind(endPoint);
                    SetStatus(Status.Listening);                    
                    listener.Listen(0);
                    socket = listener.Accept();
					listener.Close();          
					stream = new NetworkStream(socket);
					reader = new StreamReader(stream);
					writer = new StreamWriter(stream);
					writer.Write("WINTALK .NET");
					writer.Flush();
                }catch(SocketException e){
                    // If there is already a listener on this port try client
                    if(e.ErrorCode == 10048){
                        client = true;
                        endPoint = new IPEndPoint(
                            Dns.Resolve("127.0.0.1").AddressList[0], endPoint.Port);
                    }else{
                        Notifications(
                            Notification.Error, 
                            "Error Initializing Socket:\n"+e.ToString());                        
                    }
                }                                    
            }

            // Try a client connection
            if(client){
                Socket temp = new 
                    Socket(AddressFamily.InterNetwork,
                    SocketType.Stream,ProtocolType.Tcp);
                temp.Blocking = true;
                temp.Connect(endPoint);
                socket = temp;
				socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.ReceiveTimeout, 5000);
				socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.SendTimeout, 5000);
				stream = new NetworkStream(socket);
				reader = new StreamReader(stream);
				writer = new StreamWriter(stream);
				char[] handshake = new char[12];
				try
				{
					if (!(reader.Read(handshake,0,12)>0 && new string(handshake)=="WINTALK .NET"))
					{
						socket.Close();
						socket = null;
					}
					else
					{
						socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.ReceiveTimeout , 0);
						socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.SendTimeout, 0);
					}
				}
				catch
				{
					socket.Close();
					socket = null;
				}
            }

            // If it all worked out, create stream objects
            if(socket != null){
                SetStatus(Status.Connected);                 
                Notifications(Notification.Initialized, this);                
				// Start receiving talk
				// Note: on w2k and later platforms, the NetworkStream.Read()
				// method called in ReceiveTalk will generate an exception when
				// the remote connection closes. We handle this case in our
				// catch block below.
				ReceiveTalk();

				// On Win9x platforms, NetworkStream.Read() returns 0 when
				// the remote connection closes, prompting a graceful return
				// from ReceiveTalk() above. We will generate a Notification.End
				// message here to handle the case and shut down the remaining
				// WinTalk instance.
				Notifications(Notification.End, "Remote connection has closed.");
			}
			else
			{
                Notifications(Notification.Error, 
                    "Failed to Establish Socket, did you specify the correct port?");
            }
        }catch(IOException e){ 
            SocketException sockExcept = e.InnerException as SocketException; 
            if(sockExcept != null && 10054 == sockExcept.ErrorCode){
                Notifications(Notification.End, "Remote connection has closed.");
            }else{
				if (Notifications != null)
					Notifications(Notification.Error, "Socket Error:\n"+e.Message);
            }                
        }catch(Exception e){              
            Notifications(Notification.Error, "Socket Error:\n"+e.Message);
        }
    }

    // Receive chat from remote client
    private void ReceiveTalk(){
        char[] commandBuffer = new char[20];
        char[] oneBuffer = new char[1];
        int readMode = 1;
        int counter = 0;        
        StringBuilder text = new StringBuilder();

        while(readMode != 0){
            if(reader.Read(oneBuffer, 0, 1)==0){
                readMode = 0;
                continue;
            }

            switch(readMode){
            case 1:        
                if(counter == commandBuffer.Length){
                    readMode = 0;
                    continue;
                }
                if(oneBuffer[0] != ':'){
                    commandBuffer[counter++] = oneBuffer[0];
                }else{
                    counter = Convert.ToInt32(
                        new String(commandBuffer, 1, counter-1));
                    if(counter>0){
                        readMode = 2;                            
                        text.Length = 0;
                    }else if(commandBuffer[0] == 'R'){
                        counter = 0;
                        prevReceiveText = String.Empty;
                        Notifications(Notification.ReceivedRefresh, prevReceiveText);
                    }
                }
                break;
            case 2:
                text.Append(oneBuffer[0]);
                if(--counter == 0){
                    switch(commandBuffer[0]){
                    case 'R':
                        prevReceiveText = text.ToString();
						Notifications(Notification.ReceivedRefresh, prevReceiveText);                    
                        break;
                    default:
						string newText = text.ToString();
                        prevReceiveText += newText;
                        Notifications(Notification.ReceivedAppend, newText);                    
						break;
                    }                    
                    readMode = 1;
                    
                }
                break;
            default:
                readMode = 0;
                continue;
            }            
        }        
    }

    private Socket socket;

    private TextReader reader;
    private TextWriter writer;
    
    bool client;
    IPEndPoint endPoint;

    private String prevSendText;
    private String prevReceiveText;
    private String statusText;

    private Status status;    
}
