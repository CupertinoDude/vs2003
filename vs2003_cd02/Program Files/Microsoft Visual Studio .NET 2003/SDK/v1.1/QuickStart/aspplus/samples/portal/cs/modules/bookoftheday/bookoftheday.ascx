<%@ Control Language="C#" Inherits="BookOfTheDay" Src="BookOfTheDay.cs" Description="Book of the Day Module" %>
<%@ Register TagPrefix="Portal" TagName="RightModuleHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/RightModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="RightModuleFooter" Src="/QuickStart/aspplus/samples/portal/CS/include/RightModuleFooter.ascx" %>

<Portal:RightModuleHeader Title="Book of the Day" ModuleSource="Modules\BookOfTheDay\BookOfTheDay.ascx" ShowEditButton="false" runat="server"/>

<table style="font: 8pt verdana;margin:15,15,15,15">
  <tr>
    <td>
        <table cellpadding="10" style="font: 10pt verdana">
          <tr>
            <td valign="top">
              <img align="top" src='<%# DataBinder.Eval(this, "TitleId", "/quickstart/aspplus/images/title-{0}.gif") %>' >
            </td>
            <td valign="top">
              <b>Title: </b><%# DataBinder.Eval(this, "Title") %><br>
              <b>Category: </b><%# DataBinder.Eval(this, "Category") %><br>
              <b>Price: </b><%# DataBinder.Eval(this, "Price", "$ {0}") %>
              <p>
              <a href='<%# DataBinder.Eval(this, "TitleId", "/quickstart/aspplus/samples/portal/CS/constr.aspx?titleid={0}") %>' >
                <img border="0" src="/quickstart/aspplus/images/purchase_book.gif" >
              </a>
            </td>
          </tr>
        </table>
    </td>
  </tr>
</table>

<Portal:RightModuleFooter runat="server"/>
