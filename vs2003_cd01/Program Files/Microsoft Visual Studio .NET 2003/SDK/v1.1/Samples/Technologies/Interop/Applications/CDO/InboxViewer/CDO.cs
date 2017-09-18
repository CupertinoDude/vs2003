using System;
using System.Runtime.InteropServices;
using System.Reflection;
using System.Threading;
using System.Windows.Forms;

public class CDO
{
	static object currentSession; // MAPI.Session
	static Type t;
	static object messageCollection; // MAPI.Messages
	static int numMessages;
	static string m_name = null;

	//
	// CreateNewSession
	//
	public static Object CreateNewSession()
	{
		//
		// Step 1 - Set apartment model
		//
		Thread.CurrentThread.ApartmentState = ApartmentState.STA;

		//
		// Step 2 - Create instance
		//

		t = Type.GetTypeFromProgID("MAPI.Session");
		if (t == null)
		{
			MessageBox.Show("Unable to find ProgID \"MAPI.Session\".  CDO.DLL needs to be registered for this sample.", "Cannot Use Collaborative Data Objects");
			return null;
		}

		currentSession = Activator.CreateInstance(t);

		//
		// NOTE: We could early-bind to metadata generated from CDO.DLL, but instead this demonstrates late binding to a COM object.
		//

		//
		// Step 3 - Logon
		//

		Object [] args = new Object[7];
		args[0] = Missing.Value;	// ProfileName
		args[1] = Missing.Value;	// ProfilePassword
		args[2] = Missing.Value;	// ShowDialog
		args[3] = Missing.Value;	// NewSession
		args[4] = Missing.Value;	// ParentWindow
		args[5] = Missing.Value;	// NoMail
		args[6] = Missing.Value;	// ProfileInfo

		try
		{
			t.InvokeMember("Logon", BindingFlags.InvokeMethod, null, currentSession, args);
			m_name = (string)currentSession.GetType().InvokeMember("Name", BindingFlags.GetProperty, null, currentSession, null);
		}
		catch (TargetInvocationException e)
		{
			if (e.InnerException.GetType() == typeof(COMException))
			{
				COMException ce = (COMException)e.InnerException;
				if(ce.ErrorCode != unchecked((int)0x80040113) /* MAPI_E_USER_CANCEL */)
				{
					throw new ApplicationException("An exception was generated by MAPI.  Please check your installation settings. " + ce);
				}
			}
			else
			{
				throw new ApplicationException("Unable to log on to the Exchange server with the chosen profile.  Please check your installation settings.");
			}
		}

		return currentSession;
	}

	//
	// FillInMessages
	//
	public static void FillInMessages(InboxViewerForm form)
	{
		object inbox;		// MAPI.Folder
		object message;		// MAPI.Message

		object sender;
		object senderName;
		object itemType;
		object subject;
		object received;

		numMessages = 0;
		string [] subinfo = new string[3];

		form.Text = "C# Inbox Viewer - Populating ListView with messages.....";

		try
		{
			//
			// Get the messages from the inbox
			//
			inbox = t.InvokeMember("Inbox", BindingFlags.GetProperty, null, currentSession, null);
			messageCollection = inbox.GetType().InvokeMember("Messages", BindingFlags.GetProperty, null, inbox, null);
			form.BringToFront();

			//
			// Get the first message
			//

			message = messageCollection.GetType().InvokeMember("GetFirst", BindingFlags.InvokeMethod, null, messageCollection, null);

			while (message != null)
			{
				numMessages++;

				try
				{
					itemType = message.GetType().InvokeMember("Type", BindingFlags.GetProperty, null, message, null);

					if (itemType.Equals("IPM.Note"))
					{
						// Get the sender's name
						try
						{
							sender = message.GetType().InvokeMember("Sender", BindingFlags.GetProperty, null, message, null);
							senderName = sender.GetType().InvokeMember("Name", BindingFlags.GetProperty, null, sender, null);
						} catch { senderName = "Unknown"; }

						// Get the subject
						try
						{
							subject = message.GetType().InvokeMember("Subject", BindingFlags.GetProperty, null, message, null);
							subinfo[0] = subject.ToString();
						} catch { subinfo[0] = "Unknown"; }

						// Get the received date/time
						try
						{
							received = message.GetType().InvokeMember("TimeReceived", BindingFlags.GetProperty, null, message, null);
							subinfo[1] = received.ToString();
						} catch { subinfo[1] = "Unknown"; }

						subinfo[2] = numMessages.ToString();

    					ListViewItem l = form.listView1.Items.Insert(0, numMessages.ToString());
		                l.SubItems.Add(new ListViewItem.ListViewSubItem(l, senderName.ToString()));
		                l.SubItems.Add(new ListViewItem.ListViewSubItem(l, subinfo[0]));
		                l.SubItems.Add(new ListViewItem.ListViewSubItem(l, subinfo[1]));
		                l.SubItems.Add(new ListViewItem.ListViewSubItem(l, subinfo[2]));

					}

					// Let the window process other messages
					Application.DoEvents();
				}
				catch (Exception e) {
					MessageBox.Show("Fatal Error: " + e.ToString());
					goto done;
				}

				// Get the next message
				message = messageCollection.GetType().InvokeMember("GetNext", BindingFlags.InvokeMethod, null, messageCollection, null);
			}
		}
		catch
		{
		}
done:
		form.Text = "C# Inbox Viewer - " + numMessages.ToString() + " Messages";
	}

	//
	// GetMessageDetails
	//
	public static string [] GetMessageDetails(int index)
	{
		object message;		// MAPI.Message
		object recipients; 	// MAPI.Recipients
		object recipient;
		object recipientName;
		object recipientType;
		string [] details = new string[4];
		int count;
		bool	bFixedUp = false;	// Set to true if we have tried to fix it up

	retry:
		try
		{
			//
			// Get the requested message
			//
			object[] args = new object[1];
			args[0] = index;

			// Invoke the default property (Item)
			message = messageCollection.GetType().InvokeMember("Item", BindingFlags.GetProperty, null, messageCollection, args);

			// Get the message text
			details[0] = (string)message.GetType().InvokeMember("Text", BindingFlags.GetProperty, null, message, null);

			// Get the recipient(s)
			recipients = message.GetType().InvokeMember("Recipients", BindingFlags.GetProperty, null, message, null);
			count = (int)recipients.GetType().InvokeMember("Count", BindingFlags.GetProperty, null, recipients, null);

			details[1] = "";
			details[2] = "";

			for (int i = 1; i <= count; i++)
			{
				// Get the recipient's name
				args[0] = i;
				recipient = recipients.GetType().InvokeMember("Item", BindingFlags.GetProperty, null, recipients, args);
				if (recipient != null)
				{
					recipientName = recipient.GetType().InvokeMember("Name", BindingFlags.GetProperty, null, recipient, null);

					// Figure out if the recipient was on the To: or Cc:/Bcc: line

					recipientType = recipient.GetType().InvokeMember("Type", BindingFlags.GetProperty, null, recipient, null);

					if ((int)recipientType == 1) // CdoTo
					{
						if (details[1] == "")
							details[1] = (string)recipientName;
						else
							details[1] = details[1] + "; " + (string)recipientName;
					}
					else if ((int)recipientType == 2) // CdoCc
					{
						if (details[2] == "")
							details[2] = (string)recipientName;
						else
							details[2] = details[1] + "; " + (string)recipientName;
					}
					else // CdoBcc
					{
						if (details[2] == "")
							details[2] = "<BCC: " + (string)recipientName + ">";
						else
							details[2] = details[1] + "; " + "<BCC: " + (string)recipientName + ">";
					}
				}
			}

			// Get the sent date/time
			DateTime sent = (DateTime)message.GetType().InvokeMember("TimeSent", BindingFlags.GetProperty, null, message, null);
			details[3] = sent.ToString();
		}
		catch (System.Runtime.InteropServices.COMException)
		{
			if (bFixedUp) throw;			// Rethrow the exception

			// From time to time on Win 9X the connection fades away, resulting in an exception here.
			// So lets logon again and see if we can party.
			Retry();
			bFixedUp = true;
			goto retry;
		}
		catch (System.Reflection.TargetInvocationException)
		{
			if (bFixedUp) throw;			// Rethrow the exception

			// From time to time on Win 9X the connection fades away, resulting in an exception here.
			// So lets logon again and see if we can party.
			Retry();
			bFixedUp = true;
			goto retry;
		}
		catch (Exception e)
		{
			MessageBox.Show("Caught Exception: " + e.ToString(), "Unexpected Exception");
		}

		return details;
	}

	static void Retry()
	{
		t.InvokeMember("Logoff", BindingFlags.InvokeMethod, null, currentSession, null);
		object[] args = new Object[7];
		args[0] = m_name;			// ProfileName
		args[1] = Missing.Value;	// ProfilePassword
		args[2] = Missing.Value;	// ShowDialog
		args[3] = Missing.Value;	// NewSession
		args[4] = Missing.Value;	// ParentWindow
		args[5] = Missing.Value;	// NoMail
		args[6] = Missing.Value;	// ProfileInfo
		t.InvokeMember("Logon", BindingFlags.InvokeMethod, null, currentSession, args);
		object inbox = t.InvokeMember("Inbox", BindingFlags.GetProperty, null, currentSession, null);
		messageCollection = inbox.GetType().InvokeMember("Messages", BindingFlags.GetProperty, null, inbox, null);
	}


	//
	// Logoff
	//
	public static void Logoff()
	{
		t.InvokeMember("Logoff", BindingFlags.InvokeMethod, null, currentSession, null);
	}
}