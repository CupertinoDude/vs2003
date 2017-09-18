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
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Text.RegularExpressions;

namespace Market
{
   public class InventoryDB 
   {
      public DataTable GetProducts(int categoryID) {

          // only allow 1 digit numbers
          if (!Regex.IsMatch(categoryID.ToString(), @"^\d{1}$", RegexOptions.Compiled))
              return null;

	  SqlConnection sqlConnection = new SqlConnection("server=(local)\\NetSDK;database=grocertogo;Integrated Security=SSPI");
	  
	  try{
              SqlDataAdapter sqlAdapter1 = new SqlDataAdapter("Select * from Products where CategoryID=" + categoryID, sqlConnection);

              DataSet products = new DataSet();
              sqlAdapter1.Fill(products, "products");

              return products.Tables[0];
	  }
	  catch (Exception ex){
	      throw (ex);
	  }
	  finally{
	      sqlConnection.Close();
	  }
      }

      public DataRow GetProduct(int productID) {

          // only allow 4 digit numbers
          if (!Regex.IsMatch(productID.ToString(), @"^\d{4}$", RegexOptions.Compiled))
              return null;

          SqlConnection sqlConnection = new SqlConnection("server=(local)\\NetSDK;database=grocertogo;Integrated Security=SSPI");
	  
	  try{
              SqlDataAdapter sqlAdapter1 = new SqlDataAdapter("Select * from Products where ProductID=" + productID, sqlConnection);
              DataSet product = new DataSet();
              sqlAdapter1.Fill(product, "product");

              return product.Tables[0].Rows[0];

	  }
	  catch (Exception ex){
	      throw (ex);
	  }
	  finally{
	      sqlConnection.Close();
	  }
      }

      public DataTable GetProductCalories(int productID) {

          // only allow 4 digit numbers
          if (!Regex.IsMatch(productID.ToString(), @"^\d{4}$", RegexOptions.Compiled))
              return null;
          
          SqlConnection sqlConnection = new SqlConnection("server=(local)\\NetSDK;database=grocertogo;Integrated Security=SSPI");
	  
	  try{
              SqlDataAdapter sqlAdapter1 = new SqlDataAdapter("Select * from ProductDetails where ProductID=" + productID, sqlConnection);
              DataSet details = new DataSet();
              sqlAdapter1.Fill(details, "details");

              return details.Tables[0];
	  }
	  catch (Exception ex){
	      throw (ex);
	  }
	  finally{
	      sqlConnection.Close();
	  }
      }
   }

   public class OrderItem 
   {
      public int productID;
      public int quantity;
      public String name;
      public double price;

      public OrderItem(int productID, String name, double price, int quantity)
      {
         this.productID = productID;
         this.quantity = quantity;
         this.name = name;
         this.price = price;
      } 

      public int ProductID
      {
         get { return ProductID; }
      }

      public int Quantity
      {
         get { return quantity; }
         set { quantity=value; }
      }

      public String Name
      {
         get { return name; }
      }

      public double Price
      {
         get { return price; }
      }

      public double Total 
      {
         get { return quantity * price; }
      }

   }

   public class OrderList  
   {
      private Hashtable orders    = new Hashtable();
      private double    taxRate   = 0.08;

      public double SubTotal 
      {
         get 
         { 
            if (orders.Count == 0)
               return 0.0;

            double subTotal = 0;

            IEnumerator items = orders.Values.GetEnumerator();

            while(items.MoveNext()) {

               subTotal += ((OrderItem) items.Current).Price * ((OrderItem) items.Current).Quantity;
            }
            
            return subTotal;
         }
      }

      public double TaxRate 
      {
         get { return taxRate; }
         set { taxRate = value; }
      }

      public double Tax 
      {
         get { return SubTotal * taxRate; }
      }

      public double Total 
      {
         get { return SubTotal * (1 + taxRate); }
      }

      public ICollection Values {
         get {
            return orders.Values;
         }
      }

      public OrderItem this[String name] {
         get {
            return (OrderItem) orders[name];
         }
      }

      public void Add(OrderItem value)
      {
         if (orders[value.Name] == null) {
            orders.Add(value.Name, value);
         }
         else
         {
            OrderItem oI = (OrderItem)orders[value.Name]; 
            oI.Quantity = oI.Quantity + 1;
         }
      }

      public void ClearCart() {
         orders.Clear();
      }
   }
}


