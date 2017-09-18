// This C# file is imported by ADOCS.aspx page 


		private ArrayList PublisherID;  // need an arraylist for a drowpdownlist filled with publisher ID's when updating a record  
		private System.Data.OleDb.OleDbDataAdapter myadapter;
		private DataSet mydataset;
 		private ADODB.Connection cn;
		private ADODB.Recordset rs;
		private OleDbCommand myCommand;
		private OleDbConnection myConnection; 
		
protected void Page_Load(Object Src, EventArgs E)
  	
{
	
		Message1.InnerHtml = "";
		
		String strConn = "Provider=SQLOLEDB.1;Data Source=(local);Integrated Security=SSPI;Initial Catalog=pubs;";
		cn = new ADODB.Connection();
		cn.ConnectionString=strConn;
		try
		{
			cn.Open(strConn,"","",-1);  // change your userId and password if any
				
		}
		catch (Exception e)
			{
			Response.Write(e.ToString());
			Response.Flush();
			Response.End();
			}
		
	
		rs= new ADODB.Recordset();
		// open a recordset on a table titles with cursor LockType adOpenOptimic
		// on wich the provider locks the records when updated only
		// with CursorType adOpenKeyset to allow batch updates-->
	
		rs.Open("select * from titles",cn,ADODB.CursorTypeEnum.adOpenKeyset,ADODB.LockTypeEnum.adLockOptimistic, (int)ADODB.CommandTypeEnum.adCmdText);
	
		
		if (rs.BOF || rs.EOF) 
		{
		 Response.Write("No records found. Please check the SQL table"); 
		}

		 
		//Initialize the data adapter and fill in with data from the recordset
 
		myadapter = new System.Data.OleDb.OleDbDataAdapter();

		// using managed connection and command objects at the same time to fill in an ArrayList for the managed DropDownList control
  
		
		mydataset = new DataSet();
		
		myadapter.Fill(mydataset,rs,"titles");
			
		// set the source for the managed control datagrid
		MyDataGrid.DataSource=mydataset;
        if (!IsPostBack)
		{ 
			MyDataGrid.DataBind();
		}
		cn.Close();

    	string mySelectPublisher = "select pub_id from publishers";
		
    	myConnection = new OleDbConnection(strConn);

    	myCommand = new OleDbCommand(mySelectPublisher,myConnection);
    	myConnection.Open();
    	OleDbDataReader myReader;
    	myReader = myCommand.ExecuteReader();
		PublisherID = new ArrayList();
		while (myReader.Read())
			{ PublisherID.Add(myReader["pub_id"]);}
    
		myConnection.Close();

	}

	private int GetPubIndex(String pub) // this function is called when the selected item changes in the dropdownlist 
    	{
        	if (PublisherID.IndexOf(pub) != -1)
            		return PublisherID.IndexOf(pub);
        	else
            		return 0;
    	}


	private void MyDataGrid_Cancel(Object sender, DataGridCommandEventArgs e)
	{
		        MyDataGrid.EditItemIndex = -1;
        		DataBind();
	}
	
	private void MyDataGrid_Update(object sender, DataGridCommandEventArgs E)

	{
		// getting the value from the TextBoxes   
		String[] cols = {"title","type","price","advance","royalty","ytd_sales","notes","pubdate"};
		String[] colvalue=new String[8];  
		//to change the values in the dataset:
       		for (int i=0; i<8; i++)
        	{
           		colvalue[i] = ((TextBox)E.Item.FindControl("edit_" + cols[i])).Text.Trim();
			if (colvalue[i].Equals(String.Empty) && cols[i].Equals("title"))
				{ Response.Write(" The title field can not be empty. Please insert a title");
					goto label;
				}
			if (colvalue[i].Equals(String.Empty) && cols[i].Equals("type"))
					colvalue[i] = "UNDECIDED";
			if ((colvalue[i].Equals(String.Empty)) && (cols[i].Equals("pubdate")))
					colvalue[i] = System.DateTime.Now.ToString(); 
			if (colvalue[i].Equals(String.Empty)&& cols[i].Equals("notes"))	
					colvalue[i]="";
			else if (colvalue[i].Equals(String.Empty))
					colvalue[i]=Convert.ToString(0);
			try
			{
			 	mydataset.Tables["titles"].Rows[(int)E.Item.ItemIndex][cols[i]]= colvalue[i];
			}	 
			catch(Exception e)
			{ 	Response.Write("\nNumeric value or date expected! Try again\n");
						goto label;	
			}
		}
		mydataset.Tables["titles"].Rows[(int)E.Item.ItemIndex]["pub_id"]=
		(((DropDownList)E.Item.FindControl("edit_pubID")).SelectedItem.ToString());
		// an SQL statement is needed to call update command on the adapter object
		
		String updateCmd= "update titles set ";
		updateCmd+="title=" + RepSQ(colvalue[0]);
		updateCmd+=", type=" + RepSQ(colvalue[1]);
		updateCmd+=", pub_id='" + (((DropDownList)E.Item.FindControl("edit_pubID")).SelectedItem.ToString()) + "'";
		try 
		{
			updateCmd+=", price=" + Convert.ToDouble(colvalue[2]);
			updateCmd+= ",advance=" + Convert.ToDouble(colvalue[3]);
			updateCmd+= ",royalty="+ RepSQ(colvalue[4]);
			updateCmd+= ",ytd_sales="+ (colvalue[5]);
		}

		catch (Exception e)
			{	
				Response.Write("\nNumeric value expected! Try again\n");
				goto label;	
            			
			}
					
		updateCmd+=",notes="+ RepSQ(colvalue[6]);
		updateCmd+=", pubdate="+ RepSQ(colvalue[7]);
		
		updateCmd+=" where title_id like " + "'" + (MyDataGrid.DataKeys[(int)E.Item.ItemIndex].ToString()).Trim() + "'" ;  
		OleDbCommand myManagedCommand = new OleDbCommand();
		myManagedCommand.CommandText = updateCmd;
		myManagedCommand.Connection= myConnection;
		myConnection.Open(); 
		myadapter.UpdateCommand=myManagedCommand;
				
		try
		{

			myadapter.Update(mydataset,"titles"); 
		}

		catch(OleDbException e)
		{		Message1.InnerHtml = "ERROR: Could not update record, please ensure the fields are correctly filled out:\n";
				goto label;
            	}
		myConnection.Close();
		label:	
		MyDataGrid.EditItemIndex = - 1;
   		DataBind();

	}
	private void MyDataGrid_Edit(object sender,DataGridCommandEventArgs E)
	{

		MyDataGrid.EditItemIndex = (int)E.Item.ItemIndex;
        DataBind();
	}
	
	private void MyDataGrid_Delete(object sender, DataGridCommandEventArgs E)

	{
		Message1.InnerHtml="Deleted the selected record";
		OleDbCommand myManagedCommand = new OleDbCommand();
		
		
		myManagedCommand.Connection= myConnection;
		
		myManagedCommand.CommandText = "Delete from titleauthor where title_id = '" +
						MyDataGrid.DataKeys[(int)E.Item.ItemIndex] + "'";
		myConnection.Open();
		myManagedCommand.ExecuteNonQuery();
		
		myManagedCommand.CommandText= "Delete from sales where title_id = '" +
						MyDataGrid.DataKeys[(int)E.Item.ItemIndex] + "'";

		myManagedCommand.ExecuteNonQuery();
		myManagedCommand.CommandText = "Delete from roysched where title_id = '" +
						MyDataGrid.DataKeys[(int)E.Item.ItemIndex] + "'"; 	
		myManagedCommand.ExecuteNonQuery();


		// delete the row in the dataset where the pub_id is 
		mydataset.Tables["titles"].Rows[(int)E.Item.ItemIndex].Delete();
		// update the database table "titles"
		myManagedCommand.CommandText="Delete from titles where title_id = '" +
						MyDataGrid.DataKeys[(int)E.Item.ItemIndex] + "'";		 
		myadapter.DeleteCommand=myManagedCommand;
		
		try
		{
						
			myadapter.Update(mydataset,"titles"); 
		}

		catch(OleDbException e)
		{		Message1.InnerHtml = "ERROR: Could not delete record,Try again:" + myManagedCommand;
            	Message1.Style["color"] = "red";
		}
		
		
		myConnection.Close();	
		MyDataGrid.EditItemIndex = - 1;
   		DataBind();
		
	}
	// use this method to replace the inserted string with 'string' for the SQL statement 
	private String RepSQ( String strInp )
	{
		String sOut = "null";

		if ( strInp.Length == 0 )
			return sOut;
		else	
			return "'" + Regex.Replace( strInp, "'", "''" ) + "'";
	}


