<%@ Import Namespace="ADODB"%>
<%@ Assembly Name = "ADODB"%>
<%@ Page Language="VB"%>


<html>
<head>
	<TITLE>ADO Access from ASPPlus page using VB</TITLE>
<body BGCOLOR="aquamarine" topmargin="10" leftmargin="10"> 
<font size="4" face="Arial, Helvetica">
This page imports the unmanaged msado15.dll    
 

<%
 
	dim cn as ADODB.Connection
    	dim rs as ADODB.Recordset
	dim strConn as String
	dim i 
	dim dummy 

	try
			
		'Change your SQL server name,user Id and password if SQL server is not on the same machine,
		'you have an SQL password or userID
		'strConn = "Provider=SQLOLEDB;SERVER=Your ServerName;UID=your User Id;PWD=Your password;DATABASE=pubs;"
		strConn="Provider=SQLOLEDB.1;Data Source=(local);Integrated Security=SSPI;Initial Catalog=pubs;"
		    
		cn = new ADODB.Connection
		cn.Open (strConn)
	catch connErr as Exception 		
			response.Write("Opening Connection Failed")
	end try

	rs=new ADODB.Recordset

	rs.CursorType=ADODB.CursorTypeEnum.adOpenKeyset
	rs.LockType= ADODB.LockTypeEnum.adLockOptimistic
	rs.Open ("titles",cn,,, ADODB.CommandTypeEnum.adCmdTable)

	If (rs.BOF OR rs.EOF) Then 
		Response.Write("No records found") 
	End If


Page.DataBind()
%>	
<br>
	
<BR>

	<% dim fld as ADODB.Field
	
	Response.Write("Enumerate through the fields collection of the SQL database table")%><br><%
	
	%><font size="2" face="Arial, Helvetica"><%
	
	If (rs.EOF)
		rs.MoveFirst
	End	If%>
		<font size="4" face="Arial, Helvetica">
		
		<table border=1 cols=<%=rs.Fields.Count%>
		<tr>
		<%	For i=0 to rs.Fields.Count - 1 %>
			<TH><% = rs.Fields(i).Name %></TH>
		<% Next %>
		</tr>		
      		
    	
	<%  Do While Not rs.EOF %>

	<tr>
	<%	For i=0 to rs.Fields.Count - 1 %>
		<TD ALIGN=right>
		<% 
		If rs.Fields(i).Value.ToString().Equals(String.Empty) Then
			Response.Write ("&nbsp;")
		Else 
			Response.Write(rs.Fields(i).Value.ToString())
		End IF %>
		</TD>
	<%	Next
			
	 rs.MoveNext %>
	</TR><%
	Loop %>

	</table>
	
	<%  
	
			rs.MoveFirst
			rs.Update("Title", "Inside DirectX")
			rs.Update("Type", "Business")
			rs.Update("ytd_sales", 1705)
			rs.UpdateBatch(ADODB.AffectEnum.adAffectCurrent)
' adding a new record checking types int, string, money, date
			
			rs.MoveLast
			dim objOne(5) As Object
			dim objTwo(5) As Object
			objOne(0)="title_id"
			objOne(1)="title"
			objOne(2)="type"
			objOne(3) = "price"
			objOne(4)="ytd_sales"
			objOne(5)="pubdate"
			
			objTwo(0)="TZ9999"
			objTwo(1)="Programming Outlook and Exchange"   '("TZ9999","Programming Outlook and Exchange","")  
			objTwo(2)="beginners"
			objTwo(3)=19.25
			objTwo(4)=9999
			
			dim dt as Object
			dt=Now
			objTwo(5)=dt
					
		rs.AddNew (objOne,objTwo)
		
	
	rs.MoveFirst		
	%>

	Records in the table after updating a record (shown in dark green) & adding a new record (shown in gold) 
   <table border=1 cols=<%=rs.Fields.Count%>
		<tr>
		<% For i=0 to rs.Fields.Count - 1 %>
			
			<TH><% = rs.Fields(i).Name %></TH> 
			
		<% Next %>
		</tr>		
      		
    	
	<%  Do While Not rs.EOF %>
		<tr>
	
		<% For i=0 to rs.Fields.Count - 1 %>
		
			<%If  ((rs.Fields(1).Value.ToString()).Equals("Programming Outlook and Exchange")) %> 
				 

				<td bgcolor="Gold">
		
			<%Else
				If ((rs.Fields(1).Value.ToString()).Equals("Inside DirectX")) %>
						<td BGCOLOR="LightSeaGreen">
				 	<%Else%>
						<td BGCOLOR="paleGreen">
				<%End IF
			End IF%>
			 
		
		<%	
		
		If ((rs.Fields(i).Value.ToString()).Equals(String.Empty)) Then
			Response.Write ("&nbsp;")
		Else 
			Response.Write(rs.Fields(i).Value.ToString())
		
		End IF %>
		
		</TD>
		
	<%	Next
			
	 rs.MoveNext %>
	</TR><%
	Loop %>
	






	</table>
<%
	' Change back the records back to initial status
	' Update the records back to their values. 	
	rs.MoveFirst

	rs.Update("title","But is It User Friendly?")
	rs.Update("Type","popular_comp")
	rs.Update("ytd_sales","8790")
	rs.UpdateBatch(ADODB.AffectEnum.adAffectCurrent)
	rs.MoveFirst
	
	cn.Execute(" delete from titles where title like 'Programming Outlook and Exchange'") ',ref dummy, -1)
	rs.Close
	cn.Close
	 %>

	</BODY>

  
</html>

