//------------------------------------------------------------------------------
/// <copyright company='Microsoft Corporation'>
///    Copyright (c) Microsoft Corporation. All Rights Reserved.
///
///    This source code is intended only as a supplement to Microsoft
///    Development Tools and/or on-line documentation.  See these other
///    materials for detailed information regarding Microsoft code samples.
///
/// </copyright>
//------------------------------------------------------------------------------
namespace Microsoft.CLR.Interop.Sample.ActiveDirectory
{

	using System;
	using System.Drawing;
	using System.Windows.Forms;
	using System.Diagnostics;
	using System.Collections;
	using System.Globalization;
	using System.Runtime.InteropServices;
	using System.Threading;
	using ActiveDIS;


	public class MTNode : TreeNode
	{
		public MTNode(String text, IADs iAds) : base(text)
		{
			bInfoAdded = false;
			mIADs = iAds;
		}

		public virtual void AddContentsToSibling(System.Windows.Forms.GroupBox GrpBox)
		{
			GrpBox.Controls.Clear();
			GrpBox.Text = null;
			if (mContents != null )
			{
				for (int i = 0; i < mContents.Length; ++i)
					GrpBox.Controls.Add(mContents[i]);
				GrpBox.Text = sTitle;
			}
		}

		public virtual void QueryInformation()
		{}

		public int nNodeIndex = 0;
		public System.Windows.Forms.Label [] mContents;
		public String sTitle;
		public bool bInfoAdded;
		public IADs mIADs;
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public class ComputerNode : MTNode
	{
		public ComputerNode(String text, String sCompName, IADs iAds) : base(text, iAds)
		{
			nNodeIndex = 0;
			sComputerName = sCompName;
			mContents = new Label[12];
			sTitle = "Computer Information";
		}

		public override void QueryInformation()
		{
			if (bInfoAdded || mIADs == null)
				return;

			bInfoAdded = true;

			try
			{
				IADsComputer iAdsComp = (IADsComputer) mIADs;
				sProcArch = iAdsComp.Processor;
				sNumberProc = iAdsComp.ProcessorCount;
				sOperatingSystem = iAdsComp.OperatingSystem;
				sOSVersion = iAdsComp.OperatingSystemVersion;
				sOwner = iAdsComp.Owner;

			}
			catch(Exception )
			{
			}

			//Now build the labels
			for (int i = 0; i < 12; ++i)
				mContents[i] = new System.Windows.Forms.Label();

			int xStart1 = 10, yStart1 = 25;
			int xSize = 110, ySize = 16;
			mContents[0].Location = new System.Drawing.Point(xStart1, yStart1);
			mContents[0].Text = "Computer Name:";
			mContents[0].Size = new System.Drawing.Size(xSize, ySize);
			mContents[0].TabIndex = 7;

			mContents[1].Location = new System.Drawing.Point(xStart1 + xSize, yStart1);
			mContents[1].Text = sComputerName.ToLower(CultureInfo.InvariantCulture);
			mContents[1].Size = new System.Drawing.Size(xSize + 70, ySize);
			mContents[1].TabIndex = 8;

			mContents[2].Location = new System.Drawing.Point(xStart1, yStart1 + ySize);
			mContents[2].Text = "Computer Model:";
			mContents[2].Size = new System.Drawing.Size(xSize, ySize);
			mContents[2].TabIndex = 9;

			mContents[3].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + ySize );
			mContents[3].Text = sProcArch;
			mContents[3].Size = new System.Drawing.Size(xSize + 70, ySize);
			mContents[3].TabIndex = 10;

			mContents[4].Location = new System.Drawing.Point(xStart1, yStart1 + 2 * ySize);
			mContents[4].Text = "CPU Count:";
			mContents[4].Size = new System.Drawing.Size(xSize, ySize);
			mContents[4].TabIndex = 11;

			mContents[5].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 2 * ySize);
			mContents[5].Text = sNumberProc;
			mContents[5].Size = new System.Drawing.Size(xSize + 70, ySize);
			mContents[5].TabIndex = 11;

			mContents[6].Location = new System.Drawing.Point(xStart1, yStart1 + 3 * ySize);
			mContents[6].Text = "Operating System:";
			mContents[6].Size = new System.Drawing.Size(xSize, ySize);
			mContents[6].TabIndex = 12;

			mContents[7].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 3 * ySize);
			mContents[7].Text = sOperatingSystem;
			mContents[7].Size = new System.Drawing.Size(xSize + 70, ySize);
			mContents[7].TabIndex = 13;

			mContents[8].Location = new System.Drawing.Point(xStart1, yStart1 + 4 * ySize);
			mContents[8].Text = "OS Version:";
			mContents[8].Size = new System.Drawing.Size(xSize, ySize);
			mContents[8].TabIndex = 14;

			mContents[9].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 4 * ySize);
			mContents[9].Text = sOSVersion;
			mContents[9].Size = new System.Drawing.Size(xSize + 70, ySize);
			mContents[9].TabIndex = 15;

			mContents[10].Location = new System.Drawing.Point(xStart1, yStart1 + 5 * ySize);
			mContents[10].Text = "Owner:";
			mContents[10].Size = new System.Drawing.Size(xSize, ySize);
			mContents[10].TabIndex = 16;

			mContents[11].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 5 * ySize);
			mContents[11].Text = sOwner.ToLower(Thread.CurrentThread.CurrentCulture);
			mContents[11].Size = new System.Drawing.Size(xSize + 70, ySize);
			mContents[11].TabIndex = 17;

		}

		private String sComputerName;
		private String sProcArch;
		private String sNumberProc;
		private String sOperatingSystem;
		private String sOSVersion;
		private String sOwner;

	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public class MServiceNode : MTNode
	{
		public MServiceNode(String text, IADs iads) : base(text, iads)
		{
			nNodeIndex = 2;
			sTitle = text;
			sTitle += " Information";
		}

		public override void QueryInformation()
		{
			if (bInfoAdded || mIADs == null)
				return;

			bInfoAdded = true;

			try
			{
				IADsContainer iadsContainer = (IADsContainer) mIADs;
				iadsContainer.Filter = "Service";
				foreach (Object o in iadsContainer)
				{
					try
					{	IADsService iADserv = (IADsService) o;
						ServiceNode scNode = new ServiceNode(iADserv.Name, iADserv);
						Nodes.Add(scNode);
					}
					catch(Exception )
					{
					}
				}
			}
			catch(Exception )
			{
			}
		}

	}

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public class ServiceNode : MTNode
	{

		public ServiceNode(String text, IADs iads) : base(text, iads)
		{
			nNodeIndex = 3;
			sTitle = text;
			sServiceName = sTitle;
			sTitle += " Information";
			mContents = new Label[14];
			base.ImageIndex = 4;
			base.SelectedImageIndex = 5;

		}

		private String GetServiceStatus(IADsService o)
		{
			IADsServiceOperations iADsservOp = (IADsServiceOperations) o;
			String sType = " ";
			switch(iADsservOp.Status)
			{
			case 1: sType = "Stopped";
					break;
			case 2: sType = "Start Pending";
					break;
			case 3: sType = "Stop Pending";
					break;
			case 4: sType = "Running";
					break;
			case 5: sType = "Continue Pending";
					break;
			case 6: sType = "Pause Pending";
					break;
			case 7: sType = "Paused";
					break;
			default:
					break;
			}

			return sType;
		}

		public override void QueryInformation()
		{
			if (bInfoAdded || mIADs == null)
				return;

			bInfoAdded = true;


			try
			{
				IADsService iAdsServ = (IADsService) mIADs;
				sServiceName = iAdsServ.Name;
				sHostComputer = iAdsServ.HostComputer;
				sFullName = iAdsServ.DisplayName;
				sServiceAccount = iAdsServ.ServiceAccountName;
				sStatus = GetServiceStatus(iAdsServ);
				sFullPath = iAdsServ.Path;
			}
			catch(Exception )
			{
			}

			//Now build the labels
			for (int i = 0; i < 12; ++i)
				mContents[i] = new System.Windows.Forms.Label();

			int xStart1 = 10, yStart1 = 25;
			int xSize = 60, ySize = 16;
			mContents[0].Location = new System.Drawing.Point(xStart1, yStart1);
			mContents[0].Text = "Service:";
			mContents[0].Size = new System.Drawing.Size(xSize, ySize);
			mContents[0].TabIndex = 7;

			mContents[1].Location = new System.Drawing.Point(xStart1 + xSize, yStart1);
			mContents[1].Text = sServiceName.ToLower(CultureInfo.InvariantCulture);
			mContents[1].Size = new System.Drawing.Size(xSize + 170, ySize);
			mContents[1].TabIndex = 8;

			mContents[2].Location = new System.Drawing.Point(xStart1, yStart1 + ySize);
			mContents[2].Text = "Host:";
			mContents[2].Size = new System.Drawing.Size(xSize, ySize);
			mContents[2].TabIndex = 9;

			mContents[3].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + ySize);
			mContents[3].Text = sHostComputer.ToLower(CultureInfo.InvariantCulture);
			mContents[3].Size = new System.Drawing.Size(xSize + 170, ySize);
			mContents[3].TabIndex = 10;

			mContents[4].Location = new System.Drawing.Point(xStart1, yStart1 + 2 * ySize);
			mContents[4].Text = "Name:";
			mContents[4].Size = new System.Drawing.Size(xSize, ySize);
			mContents[4].TabIndex = 11;

			mContents[5].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 2 * ySize);
			//Check to see if the fullName is too long for the window
			if (sFullName.Length > 30)
			{
				sFullName = sFullName.Substring(0, 30);
				sFullName += "...";
			}

			mContents[5].Text = sFullName;
			mContents[5].Size = new System.Drawing.Size(xSize + 170, ySize);
			mContents[5].TabIndex = 11;

			mContents[6].Location = new System.Drawing.Point(xStart1, yStart1 + 3 * ySize);
			mContents[6].Text = "Account:";
			mContents[6].Size = new System.Drawing.Size(xSize, ySize);
			mContents[6].TabIndex = 12;

			mContents[7].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 3 * ySize);
			mContents[7].Text = sServiceAccount;
			mContents[7].Size = new System.Drawing.Size(xSize + 170, ySize);
			mContents[7].TabIndex = 13;

			mContents[8].Location = new System.Drawing.Point(xStart1, yStart1 + 4 * ySize);
			mContents[8].Text = "Status:";
			mContents[8].Size = new System.Drawing.Size(xSize, ySize);
			mContents[8].TabIndex = 14;

			mContents[9].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 4 * ySize);
			mContents[9].Text = sStatus;
			mContents[9].Size = new System.Drawing.Size(xSize + 170, ySize);
			mContents[9].TabIndex = 15;

			mContents[10].Location = new System.Drawing.Point(xStart1, yStart1 + 5 * ySize);
			mContents[10].Text = "Path:";
			mContents[10].Size = new System.Drawing.Size(xSize, ySize);
			mContents[10].TabIndex = 16;

			mContents[11].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 5 * ySize);
			//Check to see if the path is too long for the window
			if (sFullPath.Length > 30)
			{
				sFullPath = sFullPath.Substring(0, 30);
				sFullPath += "...";
			}
			mContents[11].Text = sFullPath;
			mContents[11].Size = new System.Drawing.Size(xSize + 170, ySize);
			mContents[11].TabIndex = 17;
		}

		private String sServiceName;
		private String sHostComputer;
		private String sFullName;
		private String sServiceAccount;
		private String sStatus;
		private String sFullPath;
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public class MUserNode : MTNode
	{
		public MUserNode(String text, IADs iads) : base(text, iads)
		{
			nNodeIndex = 2;
			sTitle = text;
			sTitle += " Information";
			base.ImageIndex = 6;
			base.SelectedImageIndex = 7;

		}

		public override void QueryInformation()
		{
			if (bInfoAdded || mIADs == null)
				return;

			bInfoAdded = true;

			try
			{
				IADsContainer iadsContainer = (IADsContainer) mIADs;
				iadsContainer.Filter = "User";
				foreach (Object o in iadsContainer)
				{
					try
					{	IADsUser iADuser = (IADsUser) o;
						UserNode uNode = new UserNode(iADuser.Name, iADuser);
						Nodes.Add(uNode);
					}
					catch(Exception )
					{
					}
				}
			}
			catch(Exception )
			{
			}
		}

	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public class UserNode : MTNode
	{
		public UserNode(String text, IADs iads) : base(text, iads)
		{
			nNodeIndex = 4;
			sTitle = text.ToLower(CultureInfo.InvariantCulture);
			sTitle += " Information";
			mContents = new Label[10];
			bInfoAdded = false;
			base.ImageIndex = 8;
			base.SelectedImageIndex = 9;

		}

		public override void QueryInformation()
		{
			if (bInfoAdded || mIADs == null)
				return;

			bInfoAdded = true;

			try
			{
				IADsUser iUser = (IADsUser) mIADs;
				sUserName = iUser.Name;
				sFullName = iUser.FullName;
				if (iUser.AccountDisabled)
					sAccountDisabled = "Yes";
				else
					sAccountDisabled = "No";
				if (iUser.IsAccountLocked )
					sAccountLocked = "Yes";
				else
					sAccountLocked = "No";

				sLastLogin = iUser.LastLogin.ToString();
			}
			catch(Exception )
			{}

			//Now build the labels
			for (int i = 0; i < 10; ++i)
				mContents[i] = new System.Windows.Forms.Label();

			int xStart1 = 10, yStart1 = 25;
			int xSize = 100, ySize = 16;
			mContents[0].Location = new System.Drawing.Point(xStart1, yStart1);
			mContents[0].Text = "User Name:";
			mContents[0].Size = new System.Drawing.Size(xSize, ySize);
			mContents[0].TabIndex = 7;

			mContents[1].Location = new System.Drawing.Point(xStart1 + xSize, yStart1);
			mContents[1].Text = sUserName.ToLower(Thread.CurrentThread.CurrentCulture);
			mContents[1].Size = new System.Drawing.Size(xSize + 80, ySize);
			mContents[1].TabIndex = 8;

			mContents[2].Location = new System.Drawing.Point(xStart1, yStart1 + ySize);
			mContents[2].Text = "Account Disabled:";
			mContents[2].Size = new System.Drawing.Size(xSize, ySize);
			mContents[2].TabIndex = 9;

			mContents[3].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + ySize);
			mContents[3].Text = sAccountDisabled;
			mContents[3].Size = new System.Drawing.Size(xSize + 80, ySize);
			mContents[3].TabIndex = 10;

			mContents[4].Location = new System.Drawing.Point(xStart1, yStart1 + 2 * ySize);
			mContents[4].Text = "Account Locked:";
			mContents[4].Size = new System.Drawing.Size(xSize, ySize);
			mContents[4].TabIndex = 11;

			mContents[5].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 2 * ySize);
			mContents[5].Text = sAccountLocked;
			mContents[5].Size = new System.Drawing.Size(xSize + 80, ySize);
			mContents[5].TabIndex = 11;

			mContents[6].Location = new System.Drawing.Point(xStart1, yStart1 + 3 * ySize);
			mContents[6].Text = "Full Name:";
			mContents[6].Size = new System.Drawing.Size(xSize, ySize);
			mContents[6].TabIndex = 12;

			mContents[7].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 3 * ySize);
			mContents[7].Text = sFullName;
			mContents[7].Size = new System.Drawing.Size(xSize + 80, ySize);
			mContents[7].TabIndex = 13;

			mContents[8].Location = new System.Drawing.Point(xStart1, yStart1 + 4 * ySize);
			mContents[8].Text = "Last Login:";
			mContents[8].Size = new System.Drawing.Size(xSize, ySize);
			mContents[8].TabIndex = 14;

			mContents[9].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 4 * ySize);
			mContents[9].Text = sLastLogin;
			mContents[9].Size = new System.Drawing.Size(xSize + 80, ySize);
			mContents[9].TabIndex = 15;

		}

		private String sUserName;
		private String sFullName;
		private String sAccountDisabled;
		private String sAccountLocked;
		private String sLastLogin;
	}

}

namespace Microsoft.CLR.Interop.Sample.ActiveDirectory
{

    using System;
	using System.Text;
	using System.Collections;
	using System.Threading;
    using System.IO;
    using System.Resources;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
	using System.Runtime.InteropServices;
	using ActiveDIS;

    public class CComputerInfo : System.Windows.Forms.Form
	{

        public CComputerInfo()
		{
			InitializeComponent();
            FillTree();
        }

        private void InfoTree_AfterSelect(object source, TreeViewEventArgs e)
		{
            Text = "Computer Explorer - " + e.Node.Text;
			MTNode MNode = (MTNode) e.Node;
			MNode.QueryInformation();
			MNode.AddContentsToSibling(GrpBox);
        }

        private void InfoTree_BeforeExpand(object source, TreeViewCancelEventArgs e)
		{
        }

        private void FillTree()
		{
			StringBuilder sCompName = new StringBuilder();
			int nSize = 1000;
			GetComputerName(sCompName, ref nSize);
			String sADsPath = "WinNT://";
			sADsPath += sCompName.ToString();
			sADsPath += ",computer";

			IADsComputer Comp = null;
			Object obj = null;
			//guid of IADsComputer
			Guid g = new Guid("EFE3CC70-1D9F-11CF-B1F3-02608C9E7553");

			int nRet = ADsGetObject(sADsPath,ref g, out obj);
			if (nRet != 0)
				return;

			try
			{
				Comp = (IADsComputer) obj;
			}
			catch(Exception e)
			{
				Console.WriteLine("Exception {0}", e.ToString());
				return;
			}


			//First fill the top node: Computer Node
			ComputerNode CNode = new ComputerNode("My Computer", sCompName.ToString(), Comp);
			CNode.ImageIndex = 0;
			CNode.SelectedImageIndex = 1;
			CNode.QueryInformation();
			CNode.AddContentsToSibling(GrpBox);
			InfoTree.Nodes.Add(CNode);

			//Now query the services
			MServiceNode sNode = new MServiceNode("Service", Comp);
			sNode.ImageIndex = 2;
			sNode.SelectedImageIndex = 3;
			sNode.QueryInformation();
			CNode.Nodes.Add(sNode);

			//Now query the users
			MUserNode uNode = new MUserNode("Users", Comp);
			uNode.QueryInformation();
			CNode.Nodes.Add(uNode);

			//
			CNode.Expand();

		}

        private int Refresh_GetExpanded(TreeNode Node, string[] ExpandedNodes, int StartIndex) {

            if (StartIndex < ExpandedNodes.Length)
			{
                if (Node.IsExpanded)
				{
                    ExpandedNodes[StartIndex] = Node.Text;
                    StartIndex++;
                    for (int i = 0; i < Node.Nodes.Count; i++)
					{
                        StartIndex = Refresh_GetExpanded(Node.Nodes[i],
                                                         ExpandedNodes,
                                                         StartIndex);
                    }
                }
                return StartIndex;
            }
            return -1;
        }

        private void Refresh_Expand(TreeNode Node, string[] ExpandedNodes)
		{

            for (int i = ExpandedNodes.Length - 1; i >= 0; i--)
			{
                if (ExpandedNodes[i] == Node.Text)
				{
                    /*
                    * For the expand button to show properly, one level of
                    * invisible children have to be added to the tree.
                    */
                    //AddDependentModules((ProcessNode) Node);
                    Node.Expand();

                    /* If the node is expanded, expand any children that were
                    * expanded before the refresh.
                    */
                    for (int j = 0; j < Node.Nodes.Count; j++)
					 {
                        Refresh_Expand(Node.Nodes[j], ExpandedNodes);
                    }

                    return;
                }
            }
        }

        private void Refresh(TreeNode node)
		{
        }

        private System.ComponentModel.Container components;
        private System.Windows.Forms.TreeView InfoTree;
		private System.Windows.Forms.Panel Panel2;
		private System.Windows.Forms.Splitter Splitter1;

        private System.Windows.Forms.ImageList imageList1;
        private System.Windows.Forms.ToolTip toolTip1;
		private System.Windows.Forms.GroupBox GrpBox;
		private System.Drawing.Bitmap [] MBitmap;

        private void InitializeComponent()
		{
            this.Icon = new Icon("Machine.ico");
			this.components = new System.ComponentModel.Container();
            this.InfoTree = new System.Windows.Forms.TreeView();
            this.toolTip1 = new System.Windows.Forms.ToolTip(components);
            this.imageList1 = new System.Windows.Forms.ImageList();
			this.GrpBox = new System.Windows.Forms.GroupBox();

			this.MBitmap = new System.Drawing.Bitmap[10];

			Icon Icon0 = new Icon("machine.ico");
			Icon Icon1 = new Icon("machineH.ico");
			Icon Icon2 = new Icon("World.ico");
			Icon Icon3 = new Icon("WorldH.ico");
			Icon Icon4 = new Icon("Gears.ico");
			Icon Icon5 = new Icon("GearsH.ico");
			Icon Icon6 = new Icon("Group.ico");
			Icon Icon7 = new Icon("GroupH.ico");
			Icon Icon8 = new Icon("User.ico");
			Icon Icon9 = new Icon("UserH.ico");
			MBitmap[0] = Icon0.ToBitmap();
			MBitmap[1] = Icon1.ToBitmap();
			MBitmap[2] = Icon2.ToBitmap();
			MBitmap[3] = Icon3.ToBitmap();
			MBitmap[4] = Icon4.ToBitmap();
			MBitmap[5] = Icon5.ToBitmap();
			MBitmap[6] = Icon6.ToBitmap();
			MBitmap[7] = Icon7.ToBitmap();
			MBitmap[8] = Icon8.ToBitmap();
			MBitmap[9] = Icon9.ToBitmap();

			for (int i = 0; i < 10; ++i)
				imageList1.Images.Add(MBitmap[i]);

            InfoTree.ImageList = (ImageList)imageList1;
            InfoTree.ForeColor = (Color)System.Drawing.SystemColors.WindowText;
            InfoTree.Location = new System.Drawing.Point(0, 0);
            InfoTree.AllowDrop = true;
			InfoTree.HotTracking = true;
            InfoTree.TabIndex = 0;
            InfoTree.Indent = 19;
            InfoTree.Text = "treeView1";
            //ProcessTree.SelectedImageIndex = 1;
            InfoTree.Size = new System.Drawing.Size(250, 400);
			InfoTree.Scrollable = true;
            toolTip1.SetToolTip(InfoTree, "Services and users");
			InfoTree.AfterSelect += new TreeViewEventHandler(InfoTree_AfterSelect);
            InfoTree.BeforeExpand += new TreeViewCancelEventHandler(InfoTree_BeforeExpand);

			InfoTree.Dock = System.Windows.Forms.DockStyle.Left;

			Splitter1 = new System.Windows.Forms.Splitter();
			Splitter1.BackColor = System.Drawing.Color.Black;
			Splitter1.Dock = System.Windows.Forms.DockStyle.Left;
			Splitter1.Location = new System.Drawing.Point(250, 0);
			Splitter1.Size = new System.Drawing.Size(3, 400);
			Splitter1.TabIndex = 2;
			Splitter1.TabStop = false;

			GrpBox.Location = new System.Drawing.Point(16, 15);
            GrpBox.TabIndex = 0;
			GrpBox.Anchor = System.Windows.Forms.AnchorStyles.Top;
            GrpBox.TabStop = false;
            GrpBox.Text = "";
            GrpBox.Size = new System.Drawing.Size(318, 150);

			Panel2 = new System.Windows.Forms.Panel();
			Panel2.Text = "ContentPanel";
			Panel2.Location = new System.Drawing.Point(253, 0);
			Panel2.Size = new System.Drawing.Size(350, 400);
			Panel2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			Panel2.Dock = System.Windows.Forms.DockStyle.Fill;
			toolTip1.SetToolTip(Panel2, "Information about the selected item in tree.");
			Panel2.TabIndex = 0;

			Panel2.Controls.Add(GrpBox);

            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(600, 400);
            this.Text = "TreeView";
			//this.BorderStyle = FormBorderStyle.Fixed3D;

			//this.MinimumSize = new System.Drawing.Size(502, 400);

            toolTip1.Active = true;
            //@design toolTip1.SetLocation(new System.Drawing.Point(20, 70));

            //imageList1.ImageStream = (ImageListStreamer)resources.GetObject("imageList1.ImageStream");
            imageList1.TransparentColor = (Color)System.Drawing.Color.Transparent;
            //@design imageList1.SetLocation(new System.Drawing.Point(20, 10));

            this.Controls.Add(Panel2);
			this.Controls.Add(Splitter1);
			this.Controls.Add(InfoTree);

        }

        [STAThread]
        public static int Main(string[] args)
		{
			Application.Run(new CComputerInfo());
			return 100;
        }

        // HRESULT WINAPI ADsGetObject(LPWSTR lpszPathName, REFIID riid, VOID * * ppObject);
        [DllImport("activeds", ExactSpelling=true, EntryPoint="ADsGetObject", CharSet=System.Runtime.InteropServices.CharSet.Unicode)]
        public static extern int ADsGetObject(String path, ref Guid iid, [MarshalAs(UnmanagedType.Interface)]out object ppObject);

		//BOOL GetComputerName(LPTSTR lpBuffer, LPDWORD lpnSize );
        [DllImport("Kernel32", ExactSpelling=true, EntryPoint="GetComputerNameW", CharSet=System.Runtime.InteropServices.CharSet.Unicode)]
		public static extern bool GetComputerName(StringBuilder sName, ref int lSize);
    }
}



