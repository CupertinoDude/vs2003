<%@ Control Language="VB" Inherits="BookOfTheDay" Src="BookOfTheDay.vb" Description="Book of the Day Module" %>

<%@ Register TagPrefix="Portal" TagName="RightModuleHeader" Src="/Quickstart/aspplus/samples/portal/VB/include/RightModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="RightModuleFooter" Src="/Quickstart/aspplus/samples/portal/VB/include/RightModuleFooter.ascx" %>

<Portal:RightModuleHeader Title="Book of the Day" ModuleSource="Modules\BookOfTheDay\BookOfTheDay.ascx" ShowEditButton="false" runat="server"/>

<table style="font: 8pt verdana;margin:15,15,15,15">
  <tr>
    <td>
        <table cellpadding="10" style="font: 10pt verdana">
          <tr>
            <td valign="top">
              <img align="top" src='/Quickstart/aspplus/samples/portal/VB/images/title-<%# TitleId %>.gif' >
            </td>
            <td valign="top">
              <b>Title: </b><%# Title %><br>
              <b>Category: </b><%# Category %><br>
              <b>Price: $ </b><%# Price %>
              <p>
              <a href='/Quickstart/aspplus/samples/portal/VB/constr.aspx?titleid=<%# TitleId %>' >
                <img border="0" src="/Quickstart/aspplus/samples/portal/VB/images/purchase_book.gif" >
              </a>
            </td>
          </tr>
        </table>
    </td>
  </tr>
</table>

<Portal:RightModuleFooter runat="server"/>
