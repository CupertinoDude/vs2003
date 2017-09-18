
namespace Microsoft.CLR.Interop.Sample.IEnumVariant
{

	using System;
	using System.Drawing;
	using System.Windows.Forms;
	using System.Globalization;
	using System.Diagnostics;
	using MODULECOLLib;
	using COMPUTERINFOLib;
 

	public class MTNode : TreeNode
	{
		public MTNode(String text) : base(text)
		{
			bInfoAdded = false;
		}

		public virtual void AddContentsToParent(System.Windows.Forms.GroupBox _GrpBox)
		{
			if (mContents != null ) 
			{
				_GrpBox.Controls.Clear();
				for (int i = 0; i < mContents.Length; ++i)
					_GrpBox.Controls.Add(mContents[i]);
				_GrpBox.Text = sTitle;
			}
		}

		public virtual void QueryInfoAndBuildList()
		{}

		public int nNodeIndex = 0;
		public System.Windows.Forms.Label [] mContents;
		public String sTitle;
		public bool bInfoAdded;

	}

	public class ComputerNode : MTNode
	{
		public ComputerNode(String text) : base(text)
		{	
			nNodeIndex = 0;
			mContents = new Label[12];
			sTitle = "Computer Information";
		}

		public override void QueryInfoAndBuildList()
		{
			if (bInfoAdded)
				return;

			bInfoAdded = true;
			MachineInfo mInfo = new MachineInfo();
			sComputerName = mInfo.ComputerName;
			sProcArch = mInfo.ProcessorArchitecture;
			nNumberProc = mInfo.NumberOfProcessors;
			sOSVersion = mInfo.MachineType;
			sServicePack = mInfo.ServicePack;
			sProcessorLevel = mInfo.ProcessorLevel;

			//Now build the labels
			for (int i = 0; i < 12; ++i)
				mContents[i] = new System.Windows.Forms.Label();
			
			int xStart1 = 20, yStart1 = 25;
			int xSize = 120, ySize = 16;
			mContents[0].Location = new System.Drawing.Point(xStart1, yStart1);
			mContents[0].Text = "Computer Name:";
			mContents[0].Size = new System.Drawing.Size(xSize, ySize);
			mContents[0].TabIndex = 7;

			mContents[1].Location = new System.Drawing.Point(xStart1 + xSize, yStart1);
			mContents[1].Text = sComputerName.ToLower(CultureInfo.InvariantCulture);
			mContents[1].Size = new System.Drawing.Size(xSize, ySize);
			mContents[1].TabIndex = 8;
		
			mContents[2].Location = new System.Drawing.Point(xStart1, yStart1 + ySize);
			mContents[2].Text = "Architecture:";
			mContents[2].Size = new System.Drawing.Size(xSize, ySize);
			mContents[2].TabIndex = 9;

			mContents[3].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + ySize);
			mContents[3].Text = sProcArch;
			mContents[3].Size = new System.Drawing.Size(xSize, ySize);
			mContents[3].TabIndex = 10;

			mContents[4].Location = new System.Drawing.Point(xStart1, yStart1 + 2 * ySize);
			mContents[4].Text = "Number of Processors:";
			mContents[4].Size = new System.Drawing.Size(xSize, ySize);
			mContents[4].TabIndex = 11;

			mContents[5].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 2 * ySize);
			mContents[5].Text = nNumberProc.ToString();
			mContents[5].Size = new System.Drawing.Size(xSize, ySize);
			mContents[5].TabIndex = 11;

			mContents[6].Location = new System.Drawing.Point(xStart1, yStart1 + 3 * ySize);
			mContents[6].Text = "Processor Level:";
			mContents[6].Size = new System.Drawing.Size(xSize, ySize);
			mContents[6].TabIndex = 12;

			mContents[7].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 3 * ySize);
			mContents[7].Text = sProcessorLevel;
			mContents[7].Size = new System.Drawing.Size(xSize, ySize);
			mContents[7].TabIndex = 13;

			mContents[8].Location = new System.Drawing.Point(xStart1, yStart1 + 4 * ySize);
			mContents[8].Text = "Operating System:";
			mContents[8].Size = new System.Drawing.Size(xSize, ySize);
			mContents[8].TabIndex = 14;

			mContents[9].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 4 * ySize);
			mContents[9].Text = sOSVersion;
			mContents[9].Size = new System.Drawing.Size(xSize, ySize);
			mContents[9].TabIndex = 15;

			mContents[10].Location = new System.Drawing.Point(xStart1, yStart1 + 5 * ySize);
			mContents[10].Text = "Service Pack:";
			mContents[10].Size = new System.Drawing.Size(xSize, ySize);
			mContents[10].TabIndex = 16;

			mContents[11].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 5 * ySize);
			mContents[11].Text = sServicePack;
			mContents[11].Size = new System.Drawing.Size(xSize, ySize);
			mContents[11].TabIndex = 17;

		}
		
		private String sComputerName;
		private String sProcArch;
		private int nNumberProc;
		private String sProcessorLevel;
		private String sOSVersion;
		private String sServicePack;

	}


	public class ProcessNode : MTNode
	{ 
		
		public bool DependentDllAdded = false;

		public ProcessNode(String text, IDllCol obj) : base(text)
		{		
			OProc = obj;
			nNodeIndex = 2;
			sTitle = ExtractFileName(text);
			base.Text = sTitle;
			sProcessName = sTitle;
			sTitle += " Information";
			mContents = new Label[12];
			sFullPath = text;
			if (obj != null)
				nDllsLoaded = obj.Count;
			else
				nDllsLoaded = 0;
		}

		private String ExtractFileName(String sPath)
		{
			int nIndex = sPath.LastIndexOf('\\');
			return sPath.Substring(nIndex + 1);
		}

		public override void QueryInfoAndBuildList()
		{
			if (bInfoAdded)
				return;

			bInfoAdded = true;

			FileInfo mInfo = new FileInfo();
			bool bPath =  false;
			String sFile = sFullPath;
			if (sFullPath[1] != ':') 
			{
				 bPath = true;
				 sFile = sProcessName;
			}
			mInfo.QueryFileInfo(sFile, ref bPath);
			if (bPath)
			{
				nFileSize = mInfo.FileSize;
				sCreationTime = mInfo.CreationTime;
				sLastAccessTime = mInfo.AccessTime;
				sLastModifiedTime = mInfo.ModifyTime;
			}
			else
			{
				nFileSize = 0;
				sCreationTime = "Unknown";
				sLastAccessTime = "Unknown";
				sLastModifiedTime = "Unknown";
			}


			//Now build the labels
			for (int i = 0; i < 12; ++i)
				mContents[i] = new System.Windows.Forms.Label();
			
			int xStart1 = 10, yStart1 = 25;
			int xSize = 70, ySize = 16;
			mContents[0].Location = new System.Drawing.Point(xStart1, yStart1);
			mContents[0].Text = "Process:";
			mContents[0].Size = new System.Drawing.Size(xSize, ySize);
			mContents[0].TabIndex = 7;

			mContents[1].Location = new System.Drawing.Point(xStart1 + xSize, yStart1);
			mContents[1].Text = sProcessName.ToLower(CultureInfo.InvariantCulture);
			mContents[1].Size = new System.Drawing.Size(xSize + 120, ySize);
			mContents[1].TabIndex = 8;
		
			mContents[2].Location = new System.Drawing.Point(xStart1, yStart1 + ySize);
			mContents[2].Text = "File Size:";
			mContents[2].Size = new System.Drawing.Size(xSize, ySize);
			mContents[2].TabIndex = 9;

			mContents[3].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + ySize);
			mContents[3].Text = nFileSize.ToString();
			mContents[3].Size = new System.Drawing.Size(xSize + 120, ySize);
			mContents[3].TabIndex = 10;

			mContents[4].Location = new System.Drawing.Point(xStart1, yStart1 + 2 * ySize);
			mContents[4].Text = "Created:";
			mContents[4].Size = new System.Drawing.Size(xSize, ySize);
			mContents[4].TabIndex = 11;

			mContents[5].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 2 * ySize);
			mContents[5].Text = sCreationTime;
			mContents[5].Size = new System.Drawing.Size(xSize + 120, ySize);
			mContents[5].TabIndex = 11;

			mContents[6].Location = new System.Drawing.Point(xStart1, yStart1 + 3 * ySize);
			mContents[6].Text = "Modified:";
			mContents[6].Size = new System.Drawing.Size(xSize, ySize);
			mContents[6].TabIndex = 12;

			mContents[7].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 3 * ySize);
			mContents[7].Text = sLastModifiedTime;
			mContents[7].Size = new System.Drawing.Size(xSize + 120, ySize);
			mContents[7].TabIndex = 13;

			mContents[8].Location = new System.Drawing.Point(xStart1, yStart1 + 4 * ySize);
			mContents[8].Text = "Accessed:";
			mContents[8].Size = new System.Drawing.Size(xSize, ySize);
			mContents[8].TabIndex = 14;

			mContents[9].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 4 * ySize);
			mContents[9].Text = sLastAccessTime;
			mContents[9].Size = new System.Drawing.Size(xSize + 120, ySize);
			mContents[9].TabIndex = 15;

			mContents[10].Location = new System.Drawing.Point(xStart1, yStart1 + 5 * ySize);
			mContents[10].Text = "Dlls Loaded:";
			mContents[10].Size = new System.Drawing.Size(xSize, ySize);
			mContents[10].TabIndex = 16;

			mContents[11].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 5 * ySize);
			mContents[11].Text = nDllsLoaded.ToString();
			mContents[11].Size = new System.Drawing.Size(xSize + 120, ySize);
			mContents[11].TabIndex = 17;
		}


		public IDllCol OProc = null;

		private String sProcessName;
		private int nFileSize;
		private int nDllsLoaded;
		private String sCreationTime;
		private String sLastAccessTime;
		private String sLastModifiedTime;
		private String sFullPath;

	}

	public class ModuleNode : MTNode
	{
		public ModuleNode(String text) : base(text)
		{
			nNodeIndex = 4;
			sTitle = ExtractFileName(text);
			sDllName = sTitle;
			sTitle += " Information";
			mContents = new Label[12];
			sFullPath = text;
			bInfoAdded = false;
		}

		private String ExtractFileName(String sPath)
		{
			int nIndex = sPath.LastIndexOf('\\');
			return sPath.Substring(nIndex + 1);
		}

		public override void QueryInfoAndBuildList()
		{
			if (bInfoAdded)
				return;

			bInfoAdded = true;

			FileInfo mInfo = new FileInfo();
			bool bPath = false;
			mInfo.QueryFileInfo(sFullPath, ref bPath);
			if (bPath)
			{
				nFileSize = mInfo.FileSize;
				sCreationTime = mInfo.CreationTime;
				sLastAccessTime = mInfo.AccessTime;
				sLastModifiedTime = mInfo.ModifyTime;
			}
			else
			{
				nFileSize = 0;
				sCreationTime = "Unknown";
				sLastAccessTime = "Unknown";
				sLastModifiedTime = "Unknown";
			}


			//Now build the labels
			for (int i = 0; i < 10; ++i)
				mContents[i] = new System.Windows.Forms.Label();
			
			int xStart1 = 10, yStart1 = 25;
			int xSize = 70, ySize = 16;
			mContents[0].Location = new System.Drawing.Point(xStart1, yStart1);
			mContents[0].Text = "Dll Name:";
			mContents[0].Size = new System.Drawing.Size(xSize, ySize);
			mContents[0].TabIndex = 7;

			mContents[1].Location = new System.Drawing.Point(xStart1 + xSize, yStart1);
			mContents[1].Text = sDllName.ToLower(CultureInfo.InvariantCulture);
			mContents[1].Size = new System.Drawing.Size(xSize + 120, ySize);
			mContents[1].TabIndex = 8;
		
			mContents[2].Location = new System.Drawing.Point(xStart1, yStart1 + ySize);
			mContents[2].Text = "File Size:";
			mContents[2].Size = new System.Drawing.Size(xSize, ySize);
			mContents[2].TabIndex = 9;

			mContents[3].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + ySize);
			mContents[3].Text = nFileSize.ToString();
			mContents[3].Size = new System.Drawing.Size(xSize + 120, ySize);
			mContents[3].TabIndex = 10;

			mContents[4].Location = new System.Drawing.Point(xStart1, yStart1 + 2 * ySize);
			mContents[4].Text = "Created:";
			mContents[4].Size = new System.Drawing.Size(xSize, ySize);
			mContents[4].TabIndex = 11;

			mContents[5].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 2 * ySize);
			mContents[5].Text = sCreationTime;
			mContents[5].Size = new System.Drawing.Size(xSize + 120, ySize);
			mContents[5].TabIndex = 11;

			mContents[6].Location = new System.Drawing.Point(xStart1, yStart1 + 3 * ySize);
			mContents[6].Text = "Modified:";
			mContents[6].Size = new System.Drawing.Size(xSize, ySize);
			mContents[6].TabIndex = 12;

			mContents[7].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 3 * ySize);
			mContents[7].Text = sLastModifiedTime;
			mContents[7].Size = new System.Drawing.Size(xSize + 120, ySize);
			mContents[7].TabIndex = 13;

			mContents[8].Location = new System.Drawing.Point(xStart1, yStart1 + 4 * ySize);
			mContents[8].Text = "Accessed:";
			mContents[8].Size = new System.Drawing.Size(xSize, ySize);
			mContents[8].TabIndex = 14;

			mContents[9].Location = new System.Drawing.Point(xStart1 + xSize, yStart1 + 4 * ySize);
			mContents[9].Text = sLastAccessTime;
			mContents[9].Size = new System.Drawing.Size(xSize + 120, ySize);
			mContents[9].TabIndex = 15;

		}

		private String sDllName;
		private int nFileSize;
		private String sCreationTime;
		private String sLastAccessTime;
		private String sLastModifiedTime;
		private String sFullPath;
	}

}

namespace Microsoft.CLR.Interop.Sample.IEnumVariant
{
                    
    using System;
    using System.Collections;
    using System.Globalization;
    using System.Threading;
    using System.IO;
    using System.Resources;   
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
	using MODULECOLLib;
	using COMPUTERINFOLib;

    public class ProcessExplorer : System.Windows.Forms.Form
	{

        public ProcessExplorer()
		{
			InitializeComponent();
            FillProcessTree();
        }

        private void AddDependentModules(TreeNode nd)
		{
            try
			{
				//The node has Dlls object which has module collections
				ProcessNode node = (ProcessNode) nd;
				if ( null == node.OProc )
					return;

				IEnumerable iEnum = (IEnumerable) node.OProc;
				if (iEnum == null)
				{
					String sMsg = node.OProc.ProcName();
					sMsg += " doesn't have collection. Something is wrong!";
					MessageBox.Show(sMsg);
				}
				else
				{
					foreach ( Object o in iEnum )
					{
						String sFileName = o.ToString();
						ModuleNode Leaf = new ModuleNode(sFileName.ToLower(CultureInfo.InvariantCulture));
						Leaf.ImageIndex = 4;
						Leaf.SelectedImageIndex = 5; 
						node.Nodes.Add(Leaf);
					}

					node.DependentDllAdded = true;
				}
            }
            catch (Exception e)
			{
                MessageBox.Show(e.Message);
            }
        }

        private void ProcessTree_AfterSelect(object source, TreeViewEventArgs e)
		{
            Text = "Process Explorer - " + e.Node.Text;
			MTNode MNode = (MTNode) e.Node;
			MNode.QueryInfoAndBuildList();
			MNode.AddContentsToParent(GrpBox);
        }

        private void ProcessTree_BeforeExpand(object source, TreeViewCancelEventArgs e)
		{
        }
      
        private void FillProcessTree()
		{
			//First fill the top node: Computer Node
			ComputerNode CNode = new ComputerNode("My Computer");
			CNode.ImageIndex = 0;
			CNode.SelectedImageIndex = 1;
			CNode.QueryInfoAndBuildList();
			CNode.AddContentsToParent(GrpBox);
			ProcessTree.Nodes.Add(CNode);
			
			ProcCollection ProcCol = new ProcCollection();
			int nSignal = ProcCol.EnumerateProc();

			DllCol ProcObj = null;
			int nThis = ProcCol.GetFirstProc(out ProcObj);

			while(nThis != 0)
			{
				if (null != ProcObj)
				{
					ProcessNode PNode = new ProcessNode(ProcObj.ProcName().ToLower(CultureInfo.InvariantCulture), ProcObj);
					PNode.ImageIndex = 2;
					PNode.SelectedImageIndex = 3;
					PNode.QueryInfoAndBuildList();
					CNode.Nodes.Add(PNode);
					AddDependentModules(PNode);
				}
				nThis = ProcCol.GetNextProc(nThis, out ProcObj);
			}

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
                    AddDependentModules((ProcessNode) Node);
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
            // Update the ProcessTree
            if (node.Nodes.Count > 0)
			{
                if (node.IsExpanded)
				{
                    // Save all expanded nodes rooted at node, even those that are
                    // indirectly rooted.
                    string[] tooBigExpandedNodes = new string[node.GetNodeCount(true)];
                    int iExpandedNodes = Refresh_GetExpanded(node,
                        tooBigExpandedNodes,
                        0);
                    string[] expandedNodes = new string[iExpandedNodes];
                    Array.Copy(tooBigExpandedNodes, 0, expandedNodes, 0,
                        iExpandedNodes);

                    node.Nodes.Clear();
                    AddDependentModules(node);

                    // so children with subdirectories show up with expand/collapse
                    //button.
                    node.Expand();

                    /*
                     * check all children. Some might have had sub-directories added
                     * from an external application so previous childless nodes
                     * might now have children.
                     */
                    for (int j = 0; j < node.Nodes.Count ; j++)
					{
                        if (node.Nodes[j].Nodes.Count > 0) {
                            // If the child has subdirectories. If it was expanded
                            // before the refresh, then expand after the refresh.
                            Refresh_Expand(node.Nodes[j], expandedNodes);
                        }
                    }
                }
				else
				{
                    /*
                     * If the node is not expanded, then there is no need to check
                     * if any of the children were expanded. However, we should
                     * update the tree by reading the drive in case an external
                     * application add/removed any directories.
                     */
                    node.Nodes.Clear();
                    AddDependentModules(node);
                }
            }
			else
			{
                /*
                 * Again, if there are no children, then there is no need to
                 * worry about expanded nodes but if an external application
                 * add/removed any directories we should reflect that.
                 */
                node.Nodes.Clear();
                AddDependentModules(node);
            }
        }

        private System.ComponentModel.Container components;
        private System.Windows.Forms.TreeView ProcessTree;
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
            this.ProcessTree = new System.Windows.Forms.TreeView();
            this.toolTip1 = new System.Windows.Forms.ToolTip(components);
            this.imageList1 = new System.Windows.Forms.ImageList();
			this.GrpBox = new System.Windows.Forms.GroupBox();

			this.MBitmap = new System.Drawing.Bitmap[6];

			Icon Icon0 = new Icon("machine.ico");
			Icon Icon1 = new Icon("machineH.ico");
			Icon Icon2 = new Icon("Bridge.ico");
			Icon Icon3 = new Icon("BridgeH.ico");
			Icon Icon4 = new Icon("Leaf.ico");
			Icon Icon5 = new Icon("LeafH.ico");
			MBitmap[0] = Icon0.ToBitmap();
			MBitmap[1] = Icon1.ToBitmap();
			MBitmap[2] = Icon2.ToBitmap();
			MBitmap[3] = Icon3.ToBitmap();
			MBitmap[4] = Icon4.ToBitmap();
			MBitmap[5] = Icon5.ToBitmap();

			for (int i = 0; i < 6; ++i)
				imageList1.Images.Add(MBitmap[i]);

            ProcessTree.ImageList = (ImageList)imageList1;
            ProcessTree.ForeColor = (Color)System.Drawing.SystemColors.WindowText;
            ProcessTree.Location = new System.Drawing.Point(24, 16); 
            ProcessTree.AllowDrop = false;
			ProcessTree.HotTracking = true;
            ProcessTree.TabIndex = 0;
            ProcessTree.Indent = 19;
            ProcessTree.Text = "treeView1";
 
 			ProcessTree.Dock = System.Windows.Forms.DockStyle.Left;
            ProcessTree.Size = new System.Drawing.Size(300, 400);
            toolTip1.SetToolTip(ProcessTree, "Current running processes and loaded dlls in each process");
			ProcessTree.AfterSelect += new TreeViewEventHandler(ProcessTree_AfterSelect);
            ProcessTree.BeforeExpand += new TreeViewCancelEventHandler(ProcessTree_BeforeExpand);

			ProcessTree.Dock = System.Windows.Forms.DockStyle.Left;
        
			Splitter1 = new System.Windows.Forms.Splitter();
			Splitter1.BackColor = System.Drawing.Color.Black;
			Splitter1.Dock = System.Windows.Forms.DockStyle.Left;
			Splitter1.Location = new System.Drawing.Point(300, 0);
			Splitter1.Size = new System.Drawing.Size(3, 400);
			Splitter1.TabIndex = 2;
			Splitter1.TabStop = false;
	
			GrpBox.Location = new System.Drawing.Point(16, 15);
            GrpBox.TabIndex = 0;
			GrpBox.Anchor = System.Windows.Forms.AnchorStyles.Top;
            GrpBox.TabStop = false;
            GrpBox.Text = "";
            GrpBox.Size = new System.Drawing.Size(275, 150);

			Panel2 = new System.Windows.Forms.Panel();
			Panel2.Text = "ContentPanel";
			Panel2.Location = new System.Drawing.Point(303, 0);
			Panel2.Size = new System.Drawing.Size(300, 400);
			Panel2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
			Panel2.Dock = System.Windows.Forms.DockStyle.Fill;
			toolTip1.SetToolTip(Panel2, "Information about the selected item in tree.");
			Panel2.TabIndex = 0;

			Panel2.Controls.Add(GrpBox);
      
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(600, 400);
            this.Text = "TreeView";
			this.FormBorderStyle = FormBorderStyle.Fixed3D;
			
        
            toolTip1.Active = true;
        
            imageList1.TransparentColor = (Color)System.Drawing.Color.Transparent;
        
            this.Controls.Add(Panel2);
			this.Controls.Add(Splitter1);
			this.Controls.Add(ProcessTree);
        
        }

        [STAThread]
        public static int Main(string[] args)
		{ 
            //Register the COM components
			System.Diagnostics.Process RegProc = new System.Diagnostics.Process();
			RegProc.StartInfo.FileName = "Regsvr32.exe";
			RegProc.StartInfo.Arguments = "/s ModuleCol.dll";
			RegProc.Start();
			RegProc.WaitForExit();
			RegProc.StartInfo.FileName = "Regsvr32.exe";
			RegProc.StartInfo.Arguments = "/s ComputerInfo.dll";
			RegProc.Start();
			RegProc.WaitForExit();
			Console.WriteLine("Registered the COM components");

			Application.Run(new ProcessExplorer());

			RegProc.StartInfo.Arguments = "/u /s ModuleCol.dll";
			RegProc.Start();
			RegProc.WaitForExit();
			RegProc.StartInfo.Arguments = "/u /s ComputerInfo.dll";
			RegProc.Start();
			RegProc.WaitForExit();

			Console.WriteLine("Unregistered the COM components");

			return 100;
        }

        
    }
}



