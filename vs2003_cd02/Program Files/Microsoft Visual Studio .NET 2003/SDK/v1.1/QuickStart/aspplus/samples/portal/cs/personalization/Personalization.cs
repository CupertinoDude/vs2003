//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

using System;
using System.Collections;
using System.Collections.Specialized;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Personalization {

    public class UserStateModule : IHttpModule {

        public void Init(HttpApplication app) {
            app.EndRequest += new EventHandler(this.OnLeave);
            app.AuthenticateRequest += new EventHandler(this.OnEnter);
        }

        public void Dispose() {
        }

        public void OnEnter(Object source, EventArgs eventArgs) {
            HttpApplication app;
            HttpContext context;

            app = (HttpApplication)source;
            context = app.Context;

            String userId = "ANONYMOUS";

            if (context.Request.IsAuthenticated )
               userId= context.User.Identity.Name ;

            // Obtain Appropriate User state and populate HttpContext with it
            String dsn = (String) ((NameValueCollection) context.GetConfig("system.web/dsnstore"))["portaldb"];
            context.Items["UserState"] = new UserState(userId, dsn);
        }

        public void OnLeave(Object source, EventArgs eventArgs)
        {

            // Save UserState back to data store
            HttpApplication app;
            HttpContext context;

            app = (HttpApplication)source;
            context = app.Context;

            String dsn = (String) ((NameValueCollection) context.GetConfig("system.web/dsnstore"))["portaldb"];
            UserState myState = (UserState) context.Items["UserState"];
            if (myState != null)
               myState.Save(dsn);
        }
    }

    public class UserState {

        private Hashtable   m_userPersonalization = new Hashtable();
        private String      m_userId;
        private bool        m_isdirty;

        public UserState(String UserId, String dsn) {

            m_userId = UserId;
	    
            SqlDataAdapter myAdapter = new SqlDataAdapter();
            myAdapter.SelectCommand  = new SqlCommand();
            myAdapter.SelectCommand.Connection = new SqlConnection(dsn);
            myAdapter.SelectCommand.CommandText = "LoadPersonalizationSettings";
            myAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter myParameter = new SqlParameter("@UserID", SqlDbType.NVarChar,100);
            myParameter.Value = UserId ;

            myAdapter.SelectCommand.Parameters.Add(myParameter);
		
            DataSet myDataSet = new DataSet();
	    try {
                myAdapter.Fill(myDataSet,"Results");
    
                if (myDataSet.Tables[0].Rows.Count == 0) {
    
                    SqlCommand createUserCommand = new SqlCommand();
                    createUserCommand.Connection = new SqlConnection(dsn);
    		    try {
                            createUserCommand.Connection.Open();
                            createUserCommand.CommandText = "CreatePersonalizationAccount";
                            createUserCommand.CommandType = CommandType.StoredProcedure;
                            SqlParameter myUserId = new SqlParameter("@UserID", SqlDbType.NVarChar,20) ;
                            myUserId.Value = UserId ;
                            createUserCommand.Parameters.Add( myUserId);
                            createUserCommand.ExecuteNonQuery();
        
                           // Not repopulate user dataset
                            myDataSet = new DataSet();
                            myAdapter.Fill(myDataSet,"Results");
    		    }
    		    catch (Exception ex){
        		throw (ex);
		    }
    		    finally{
    		        createUserCommand.Connection.Close();
    		    }
                }
    
    
                // If user doesn't exist -- create new personalization account
                DataRow myDataRow = myDataSet.Tables[0].Rows[0];
    
                for (int i=0; i<myDataSet.Tables[0].Columns.Count;i++) {
                   Object value = myDataSet.Tables[0].Rows[0][myDataSet.Tables[0].Columns[i]];
                   m_userPersonalization[myDataSet.Tables[0].Columns[i].ToString()] = (value == null) ? "" : value.ToString();
                }

    	   } 
	   catch (Exception ex){
                throw (ex);
           }
           finally{
               myAdapter.SelectCommand.Connection.Close();
	       myAdapter.Dispose();
           }
   
        }

        public String UserId {
            get {
                return m_userId;
            }
            set {
                m_userId = value;
            }
        }

        public String this[String key] {
            get {
                return (String) m_userPersonalization[key];
            }
            set {
                m_userPersonalization[key] = value;
                m_isdirty = true;
            }
        }

        public void Save(String dsn) {

            if (m_isdirty == true) {
                SqlConnection conn = new SqlConnection(dsn);
                SqlCommand cmd = new SqlCommand("SavePersonalizationSettings", conn);
		
		try {
		    conn.Open();
                    IEnumerator  myHashKeyEnum = ((IEnumerable)m_userPersonalization.Keys).GetEnumerator();
                    IEnumerator  myHashValEnum = ((IEnumerable)m_userPersonalization.Values).GetEnumerator();
    
    
                    while( myHashKeyEnum.MoveNext() && myHashValEnum.MoveNext() )
                    {
                        SqlParameter myParameter = new SqlParameter("@"+myHashKeyEnum.Current.ToString() , SqlDbType.NVarChar,1000);
                        myParameter.Value = myHashValEnum.Current.ToString() ;
                        cmd.Parameters.Add(myParameter);
                    }
                    int rowsAffected = 0;
                    cmd.CommandType = CommandType.StoredProcedure;
                    rowsAffected = cmd.ExecuteNonQuery();
		}
		catch (Exception ex){
		    throw (ex);
		}
		finally{
		    conn.Close();
		}
            }
        }
    }
}