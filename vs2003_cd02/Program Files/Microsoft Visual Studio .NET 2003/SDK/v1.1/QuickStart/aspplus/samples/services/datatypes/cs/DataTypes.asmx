<%@ WebService Language="C#" Class="DataTypes" %>

using System;
using System.Web.Services;

public enum Mode
{
    On = 1,
    Off = 2
}

public class Order
{
   public int OrderID;
   public double Price;
}

public class DataTypes {

   [WebMethod]
   public String SayHello() 
   {
       return "Hello World!";
   }

   [WebMethod]
   public String SayHelloName(String name) 
   {
       return "Hello" + name;
   }

   [WebMethod]
   public int[] GetIntArray() 
   {
       int[] a = new int[5];
       for (int i=0; i<5; i++)
           a[i] = i*10;
       return a;
   }

   [WebMethod]
   public Mode GetMode() 
   {
       return Mode.Off;
   }

   [WebMethod]
   public Order GetOrder() 
   {
      Order myOrder = new Order();

      myOrder.Price=34.5;
      myOrder.OrderID = 323232;

      return myOrder;
   }

   [WebMethod]
   public Order[] GetOrders() 
   {
      Order [] myOrder = new Order[2];

      myOrder[0] = new Order();
      myOrder[0].Price=34.5;
      myOrder[0].OrderID = 323232;
      myOrder[1] = new Order();
      myOrder[1].Price=99.4;
      myOrder[1].OrderID = 645645;

      return myOrder;
   }
}
