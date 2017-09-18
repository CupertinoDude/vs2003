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

import System;
import System.Data;
import System.Data.SqlClient;
import System.Collections;

package Market
{
   public class InventoryDB
   {
      public function GetProducts(categoryID:int) : DataTable {

          var sqlConnection:SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=grocertogo;Integrated Security=SSPI");
	  try{
              var sqlAdapter1:SqlDataAdapter = new SqlDataAdapter("Select * from Products where CategoryID=" + categoryID, sqlConnection);

              var products:DataSet = new DataSet();
              sqlAdapter1.Fill(products, "products");

              return products.Tables[0];
           } catch(ex){
	      throw (ex);
	   }finally{
	      sqlConnection.Close();
           }
      }

      public function GetProduct(productID:int) : DataRow {

          var sqlConnection:SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=grocertogo;Integrated Security=SSPI");
	  
   	  try{
              var sqlAdapter1:SqlDataAdapter = new SqlDataAdapter("Select * from Products where ProductID=" + productID, sqlConnection);
              var product:DataSet = new DataSet();
              sqlAdapter1.Fill(product, "product");

              return product.Tables[0].Rows[0];
	   } catch(ex){
	      throw (ex);
	   }finally{
	      sqlConnection.Close();
           }
      }

      public function GetProductCalories(productID:int) : DataTable {

          var sqlConnection:SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=grocertogo;Integrated Security=SSPI");
	  try{
              var sqlAdapter1:SqlDataAdapter = new SqlDataAdapter("Select * from ProductDetails where ProductID=" + productID, sqlConnection);
              var details:DataSet = new DataSet();
              sqlAdapter1.Fill(details, "details");

              return details.Tables[0];
	  } catch(ex){
	      throw (ex);
	  }finally{
	      sqlConnection.Close();
          }
      }
   }

   public class OrderItem
   {
      private var productID:int;
      private var quantity:int;
      private var name:String;
      private var price:Double;

      public function OrderItem(productID:int, name:String, price:Double, quantity:int)
      {
         this.productID = productID;
         this.quantity = quantity;
         this.name = name;
         this.price = price;
      }

      public function get ProductID() : int
      {
         return ProductID;
      }

      public function get Quantity() : int
      {
         return quantity;
      }
      public function set Quantity(value:int)
      {
         quantity=value;
      }

      public function get Name() : String
      {
         return name;
      }

      public function get Price() : Double
      {
         return price;
      }

      public function get Total() : Double
      {
         return quantity * price;
      }

   }

   public class OrderList
   {
      private var orders:Hashtable = new Hashtable();
      private var taxRate:Double = 0.08;

      public function get SubTotal() : Double
      {
          if (orders.Count == 0)
             return 0.0;

          var subTotal:Double = 0;

          var items:IEnumerator = orders.Values.GetEnumerator();

          while(items.MoveNext()) {

             subTotal += OrderItem(items.Current).Price * OrderItem(items.Current).Quantity;
          }

          return subTotal;
      }

      public function get TaxRate() : Double
      {
         return taxRate;
      }
      public function set TaxRate(value:Double)
      {
         taxRate = value;
      }

      public function get Tax() : Double
      {
         return SubTotal * taxRate;
      }

      public function get Total() : Double
      {
         return SubTotal * (1 + taxRate);
      }

      public function get Values() : ICollection {
          return orders.Values;
      }

      public function Item(name:String) : OrderItem {
          return OrderItem(orders[name]);
      }

      public function Add(value:OrderItem) : void
      {
         if (orders[value.Name] == null)
         {
            orders.Add(value.Name, value);
         }
         else
         {
            var oI:OrderItem = OrderItem(orders[value.Name]);
            oI.Quantity = oI.Quantity + 1;
         }
      }

      public function ClearCart() : void
      {
         orders.Clear();
      }
   }
}


