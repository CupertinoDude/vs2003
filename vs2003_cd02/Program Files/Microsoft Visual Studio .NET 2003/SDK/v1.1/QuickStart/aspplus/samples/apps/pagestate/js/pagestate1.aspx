<%@ Register TagPrefix="Acme" TagName="Address" Src="address.ascx" %>

<html>

  <script language="JScript" runat="server">

      function Page_Load(sender:Object, e:EventArgs) : void {

         if (!IsPostBack)
           ViewState["PanelIndex"] = 0;
      }

      function Next_Click(sender:Object, e:EventArgs) : void {

         var PrevPanelId:String = "Panel" + ViewState["PanelIndex"].ToString();
         ViewState["PanelIndex"] = Int32.Parse(ViewState["PanelIndex"] + 1);
         var PanelId:String = "Panel" + ViewState["PanelIndex"].ToString();

         var p:Panel = Panel(FindControl(PanelId));
         p.Visible=true;

         p = Panel(FindControl(PrevPanelId));
         p.Visible=false;
      }

      function Prev_Click(sender:Object, e:EventArgs) : void {

         var PanelId:String = "Panel" + ViewState["PanelIndex"].ToString();
         ViewState["PanelIndex"] = Int32.Parse(ViewState["PanelIndex"] - 1);
         var PrevPanelId:String = "Panel" + ViewState["PanelIndex"].ToString();

         var p:Panel = Panel(FindControl(PanelId));
         p.Visible=false;

         p = Panel(FindControl(PrevPanelId));
         p.Visible=true;
      }

      function Finish_Click(sender:Object, e:EventArgs) : void {

         var PanelId:String = "Panel" + ViewState["PanelIndex"].ToString();
         var p:Panel = Panel(FindControl(PanelId));
         p.Visible=false;

         MyLabel.Text += "<b>Thank You!  We received the following information: </b><p>";
         MyLabel.Text += "First Name: " + FirstName.Value + "<br>";
         MyLabel.Text += "Last Name: " + LastName.Value + "<br>";
         MyLabel.Text += "Address: " + Address.Address + "<br>";
         MyLabel.Text += "City: " + Address.City + "<br>";
         MyLabel.Text += "State: " + Address.State + "<br>";
         MyLabel.Text += "Zip: " + Address.Zip + "<br>";
         MyLabel.Text += "Card Number: " + CardNum.Value + "<br>";
         MyLabel.Text += "Card Type: " + CardType.Value + "<br>";
         MyLabel.Text += "Expires: " + Expires.Value + "<br>";
      }

  </script>

  <body style="font: 10pt verdana">

    <h3><font face="Verdana">Using PageState</font></h3>

    <form runat="server">

    <ASP:Panel id="Panel0" Visible="true" runat="server">
      <table width="500" height="200" style="font:10pt verdana;background-color:cccccc;border-width:1;border-style:solid;border-color:black">
        <tr>
          <td style="padding:10,10,10,10" valign="top">
            <table height="100%" style="font:10pt verdana;">
              <tr>
                <td colspan="2"><b>Complete the following fields, then choose Next to continue:</b></td>
              </tr>
              <tr height="20"/>
              <tr>
                <td>First Name:</td>
                <td><input id="FirstName" type="text" size="45" runat="server"></td>
              </tr>
              <tr>
                <td>Last Name:</td>
                <td><input id="LastName" type="text" size="45" runat="server"></td>
              </tr>
              <tr>
                <td colspan="2" align="right" height="100%" valign="bottom">
                  <input type="submit" Value=" Next >> " OnServerClick="Next_Click" runat="server">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </ASP:Panel>

    <ASP:Panel id="Panel1" Visible="false" runat="server">
      <table width="500" height="200" style="font:10pt verdana;background-color:cccccc;border-width:1;border-style:solid;border-color:black">
        <tr>
          <td style="padding:10,10,10,10" valign="top">
            <table height="100%" style="font:10pt verdana;">
              <tr>
                <td colspan="2"><b>Complete the following fields, then choose Next to continue:</b></td>
              </tr>
              <tr height="20"/>
              <tr>
                <td colspan="2">
                  <Acme:Address id="Address" ShowCaption="false" runat="server"/>
                </td>
              </tr>
              <tr>
                <td colspan="2" align="right" valign="bottom" height="100%">
                  <input type="submit" Value=" << Back " OnServerClick="Prev_Click" runat="server">
                  <input type="submit" Value=" Next >> " OnServerClick="Next_Click" runat="server">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </ASP:Panel>

    <ASP:Panel id="Panel2" Visible="false" runat="server">
      <table width="500" height="200" style="font:10pt verdana;background-color:cccccc;border-width:1;border-style:solid;border-color:black">
        <tr>
          <td style="padding:10,10,10,10" valign="top">
            <table height="100%" style="font:10pt verdana;">
              <tr>
                <td colspan="2"><b>Complete the following fields, then choose Next to continue:</b></td>
              </tr>
              <tr height="20"/>
              <tr>
                <td>Card Number: </td>
                <td><input id="CardNum" size="45" type="text" runat="server"/></td>
              </tr>
              <tr>
                <td>Card Type: </td>
                <td>
                  <select id="CardType" runat="server">
                    <option>Visa</option>
                    <option>Mastercard</option>
                    <option>Discover</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td>Expires: </td>
                <td><input id="Expires" type="text" runat="server"/></td>
              </tr>
              <tr>
                <td colspan="2" align="right" valign="bottom" height="100%">
                  <input type="submit" Value=" << Back " OnServerClick="Prev_Click" runat="server">
                  <input type="submit" Value="   Finish   " OnServerClick="Finish_Click" runat="server">
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </ASP:Panel>
    </form>

    <asp:Label id="MyLabel" EnableViewState="false" runat="server"/>

  </body>
</html>

