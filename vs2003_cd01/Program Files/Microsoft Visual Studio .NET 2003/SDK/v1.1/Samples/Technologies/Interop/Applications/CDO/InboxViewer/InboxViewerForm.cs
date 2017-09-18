using System.ComponentModel;
using System.Diagnostics;
using System;
using System.Windows.Forms;
using System.Drawing;

public class InboxViewerForm : System.Windows.Forms.Form {
	private System.ComponentModel.Container components;
	private System.Windows.Forms.ColumnHeader columnIndex;
	private System.Windows.Forms.ColumnHeader columnReceived;
	private System.Windows.Forms.ColumnHeader columnSubject;
	private System.Windows.Forms.ColumnHeader columnFrom;
	public System.Windows.Forms.ListView listView1;

	private bool Starting;

	public InboxViewerForm()
	{
		InitializeComponent();
	}


	protected override void OnLoad(EventArgs e)
	{
		Starting = true;
		this.Show();
		CDO.FillInMessages(this);
		Starting = false;
	}

	protected override void Dispose( bool disposing )
	{
		if( disposing )
		{
			if (components != null)
			{
				components.Dispose();
			}
		}
		base.Dispose( disposing );
	}

	private void InitializeComponent()
	{
		this.components = new System.ComponentModel.Container();
		this.columnFrom = new System.Windows.Forms.ColumnHeader();
		this.columnReceived = new System.Windows.Forms.ColumnHeader();
		this.columnIndex = new System.Windows.Forms.ColumnHeader();
		this.listView1 = new System.Windows.Forms.ListView();
		this.columnSubject = new System.Windows.Forms.ColumnHeader();

		columnFrom.Text = "From";
		columnFrom.Width = 157;
		columnFrom.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;

		columnIndex.Text = ">";
		columnIndex.Width = 30;
		columnIndex.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;

		columnReceived.Text = "Received";
		columnReceived.Width = 125;
		columnReceived.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;

		columnSubject.Text = "Subject";
		columnSubject.Width = this.ClientSize.Width - columnFrom.Width - columnReceived.Width - columnIndex.Width - 25;
		columnSubject.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;

		listView1.Text = "listView1";
		listView1.Size = new System.Drawing.Size(592, 416);
		listView1.ForeColor = System.Drawing.SystemColors.WindowText;
		listView1.TabIndex = 0;
		listView1.View = System.Windows.Forms.View.Details;
		listView1.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {columnIndex, columnFrom, columnSubject, columnReceived});
		listView1.FullRowSelect = true;
		listView1.MultiSelect = false;

		this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
		this.Text = "C# Inbox Viewer";
		this.ClientSize = new System.Drawing.Size(592, 413);
		columnSubject.Width = this.ClientSize.Width - columnFrom.Width - columnReceived.Width - columnIndex.Width - 25;

		this.Controls.Add(listView1);

		// Event handlers
		this.Resize += new System.EventHandler(InboxViewerForm_Resize);
		listView1.ItemActivate += new System.EventHandler(listView1_ItemActivate);
	}

	private void InboxViewerForm_Resize(object sender, System.EventArgs e)
	{
		listView1.Width = this.ClientSize.Width;
		listView1.Height = this.ClientSize.Height;
		columnSubject.Width = this.ClientSize.Width - columnFrom.Width - columnReceived.Width - columnIndex.Width - 25;
	}

	private void listView1_ItemActivate(object sender, System.EventArgs e)
	{
		// If we are populating the inbox then do not allow message viewing
		if(Starting) return;

		// Get more details about the message from the ID
		string [] info = CDO.GetMessageDetails(((IConvertible)listView1.FocusedItem.SubItems[0].Text).ToInt32(null));

		ListViewItem i = listView1.FocusedItem;

		MessageForm form = new MessageForm(i.SubItems[2].Text, info[3], info[2], info[1], i.SubItems[1].Text, info[0]);
		form.Show();
	}

    /**
     * The main entry point for the application.
     *
     * @param args Array of parameters passed to the application
     * via the command line.
	*/
	[STAThread()]
	public static void Main(string[] args)
	{
		try
		{
			// Create a new Session
			if (CDO.CreateNewSession() != null)
			{
				InboxViewerForm f = new InboxViewerForm();
				Application.Run(f);
			}
		}
		catch (System.Runtime.InteropServices.COMException ex)
		{
			if ((uint)ex.ErrorCode == 0x80040113)
				MessageBox.Show("Logon has been canceled, so the progam will now exit.", "InboxViewer");
			else
				MessageBox.Show("Unexpected Error: " + ex.ToString(), "InboxViewer");

			Application.Exit();
		}
		catch (Exception ex)
		{
			MessageBox.Show("Unexpected Error: " + ex.ToString(), "InboxViewer");
			Application.Exit();
		}
	}
}
