<%@ WebService Language="JScript" Class="DataService" %>

import System;
import System.Data;
import System.Data.SqlClient;
import System.Web.Services;

public class DataService {

   WebMethodAttribute public function GetTitleAuthors() : DataSet {

        var myConnection:SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
        var myCommand1:SqlDataAdapter = new SqlDataAdapter("select * from Authors", myConnection);
        var myCommand2:SqlDataAdapter = new SqlDataAdapter("select * from Titles", myConnection);

        var ds:DataSet = new DataSet();
        myCommand1.Fill(ds, "Authors");
        myCommand2.Fill(ds, "Titles");

        return ds;
   }

   WebMethodAttribute public function PutTitleAuthors(ds:DataSet) : int {
        return ds.Tables[0].Rows.Count;
   }

}