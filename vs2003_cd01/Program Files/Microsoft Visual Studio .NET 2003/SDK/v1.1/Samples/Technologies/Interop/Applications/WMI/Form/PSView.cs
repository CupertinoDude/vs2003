namespace Microsoft.CLR.Interop.Sample.WMI.PSView
{

	using System;
	using System.Drawing;
	using System.Windows.Forms;
	using System.Diagnostics;
	using System.Collections;
	using System.Runtime.InteropServices;
	using WBEMSCRIPTING;
 

	public class MTNode : TreeNode
	{
		public MTNode(String text, ISWbemObject WbemObj) : base(text)
		{
			bInfoAdded = false;
			mWbemObj = WbemObj;
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
		public ISWbemObject mWbemObj;
		public String sClass;
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public class PSNode : MTNode
	{
		public PSNode(String text, ISWbemObject WbemObj) : base(text, WbemObj)
		{	
			nNodeIndex = 0;
			sPSName = text;
			sTitle = sPSName;
			sTitle += " Information";
		}

		public override void QueryInformation()
		{
			if (bInfoAdded || mWbemObj == null)
				return;

			bInfoAdded = true;
			
			try
			{
				ISWbemPropertySet WbemPropSet = mWbemObj.Properties_;
				mContents = new Label[20];
				int nIndex = 0;
				int xStart1 = 10, yStart1 = 25;
				int xSize = 110, ySize = 16;

				foreach( Object ob in WbemPropSet)
				{
					ISWbemProperty WbemProp = (ISWbemProperty) ob;

					//check to see if name or value is too long for the window.
					if (WbemProp.Name.Length > 20 || WbemProp.get_Value().ToString().Length > 20)
						continue;

					mContents[nIndex] = new Label();
					mContents[nIndex].Text = WbemProp.Name;
					mContents[nIndex].Location = new System.Drawing.Point(xStart1, yStart1);
					mContents[nIndex].Size = new System.Drawing.Size(xSize, ySize);

					nIndex ++;
					mContents[nIndex] = new Label();
					mContents[nIndex].Location = new System.Drawing.Point(xStart1 + xSize, yStart1);
					String sValue = WbemProp.get_Value().ToString();
					mContents[nIndex].Text = sValue;
					mContents[nIndex].Size = new System.Drawing.Size(xSize + 70, ySize);

					nIndex ++;
					yStart1 += ySize;

					//only display the first 15 items. 
					if (nIndex >= 30)
						break;

				}

			}
			catch(Exception )
			{
				
			}
			
		}
		
		private String sPSName;

	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}

namespace Microsoft.CLR.Interop.Sample.WMI.PSView
{
                    
    using System;
	using System.Collections;
	using System.Threading;
    using System.IO;
    using System.Resources;   
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
	using System.Runtime.InteropServices;
	using WBEMSCRIPTING;

    public class PSForm : System.Windows.Forms.Form
	{

        public PSForm()
		{
			InitializeComponent();
            FillTree();
        }

        private void InfoTree_AfterSelect(object source, TreeViewEventArgs e)
		{
            Text = "Process and Services Explorer - " + e.Node.Text;
			MTNode MNode = (MTNode) e.Node;
			MNode.QueryInformation();
			MNode.AddContentsToSibling(GrpBox);
        }

        private void InfoTree_BeforeExpand(object source, TreeViewCancelEventArgs e)
		{
			//MTNode MNode = (MTNode) e.Node;
			//MNode.QueryInformation();
			//MNode.AddContentsToSibling(GrpBox);
        }

        private void FillTree()
		{
			SWbemLocator Locator = null;
			ISWbemServices Server = null;
			ISWbemObjectSet ObjSet = null;
			ISWbemObject WbemObj = null;
			ISWbemPropertySet WbemPropSet = null;

			try
			{
				Locator = new SWbemLocator();
				//Connect to local machine
				Server = Locator.ConnectServer(null, null, null, null, null, null, 0, null);				
			}
			catch(Exception )
			{
				return;
			}

			//Add the top node
			MTNode aNode = new MTNode("My Computer", null); 
			aNode.ImageIndex = 0;
			aNode.SelectedImageIndex = 1;
			InfoTree.Nodes.Add(aNode);

			MTNode PNode = new MTNode("Processes", null);
			aNode.Nodes.Add(PNode);

			MTNode SNode = new MTNode("Services", null);
			aNode.Nodes.Add(SNode);

			
			ObjSet = Server.ExecQuery("select * from Win32_Process",
									  "WQL", 0x10, null);

			String sName;
			foreach(Object o in ObjSet)
			{
				WbemObj = (ISWbemObject) o;
				WbemPropSet = WbemObj.Properties_;
				sName = WbemPropSet.Item("Caption", 0).get_Value().ToString();				
				PSNode pNode = new PSNode(sName, WbemObj);
				PNode.Nodes.Add(pNode);
			}

			ObjSet = Server.ExecQuery("select * from Win32_Service",
									  "WQL", 0x10, null);

			foreach(Object ob in ObjSet)
			{
				WbemObj = (ISWbemObject) ob;
				WbemPropSet = WbemObj.Properties_;
				sName = WbemPropSet.Item("Caption", 0).get_Value().ToString();				
				PSNode sNode = new PSNode(sName, WbemObj);
				SNode.Nodes.Add(sNode);
			}

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

			Icon Icon0 = new Icon("NetHood.ico");
			Icon Icon1 = new Icon("netHood.ico");
			Icon Icon2 = new Icon("MyComp.ico");
			Icon Icon3 = new Icon("MyComp.ico");
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
            GrpBox.Size = new System.Drawing.Size(318, 200);

			Panel2 = new System.Windows.Forms.Panel();
			Panel2.Text = "ContentPanel";
			Panel2.Location = new System.Drawing.Point(253, 0);
			Panel2.Size = new System.Drawing.Size(350, 200);
			Panel2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			Panel2.Dock = System.Windows.Forms.DockStyle.Fill;
			toolTip1.SetToolTip(Panel2, "Information about the selected item in tree.");
			Panel2.TabIndex = 0;

			Panel2.Controls.Add(GrpBox);
      
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(600, 400);
            this.Text = "TreeView";
			this.FormBorderStyle = FormBorderStyle.Fixed3D;
			
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
			Application.Run(new PSForm());
			return 100;
        }
    }
}



