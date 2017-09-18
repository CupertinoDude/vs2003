<%@ WebService Language="C#" Class="DataService" %>

using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

public class DataService {

   [WebMethod]
   public DataSet GetTitleAuthors() {

        SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
        SqlDataAdapter myCommand1 = new SqlDataAdapter ("select * from Authors", myConnection);
        SqlDataAdapter myCommand2 = new SqlDataAdapter("select * from Titles", myConnection);

        DataSet ds = new DataSet();
        myCommand1.Fill(ds, "Authors");
        myCommand2.Fill(ds, "Titles");

        return ds;
   }

   [WebMethod]
   public int PutTitleAuthors(DataSet ds) {
        return ds.Tables[0].Rows.Count;
   }

}