<%@ Page Language="C#" Debug="True" %>
<%@ Import NameSpace="ClassInfo" %>
<%@ Import NameSpace="System.Collections"  %>
<%@ Import NameSpace="System.Collections.Specialized" %>
<%@ Import NameSpace="System.Reflection" %>

<html>
<head>

    <title>.NET Framework Class Browser</title>
    <link rel="stylesheet" href="../classstyle.css">

    <script runat="server" language="C#">

        public String SelectedAssembly;
        public String SelectedNameSpace;
        public ArrayList ModuleName = new ArrayList();

        protected void Page_Load(Object Sender, EventArgs e) {

            NameValueCollection ConfigSettings = (NameValueCollection)Context.GetConfig("system.web/ClassBrowser");

            for (int i = 0; i < ConfigSettings.Count; i++) {
                ModuleName.Add(ConfigSettings[i].ToString());
            }

            DisplayNamespaces();

            if (Request.QueryString["namespace"] == null)
                SelectedNameSpace = "System";
            else
                SelectedNameSpace = Request.QueryString["namespace"];

            if (Request.QueryString["assembly"] == null )
                SelectedAssembly = "mscorlib";
            else
                SelectedAssembly = Request.QueryString["assembly"];

            if (Request.QueryString["class"] != null && Request.QueryString["assembly"] != null)
                DisplayClass(Request.QueryString["assembly"], Request.QueryString["class"]);
            else
                DisplayClassList(SelectedNameSpace);
        }

        private void DisplayNamespaces() {

            ArrayList NameSpaceList   = new ArrayList();
            Hashtable NameSpaceHash = new Hashtable();

            for (int y = 0; y < ModuleName.Count; y++) {

                Module[]  CorRuntime = Assembly.Load(ModuleName[y].ToString()).GetModules();
                Type[]    CorClasses = CorRuntime[0].GetTypes();

                for( int x=0; x < CorClasses.Length; x++ ) {
                    if ( CorClasses[x].Namespace != null ) {
                        if (!NameSpaceHash.ContainsKey(CorClasses[x].Namespace) && CorClasses[x].IsPublic ) {
                            NameSpaceHash.Add(CorClasses[x].Namespace,"");
                            NameSpaceList.Add(CorClasses[x].Namespace);
                        }
                    }
                }
            }

            NameSpaceList.Sort();
            Namespace1.DataSource = NameSpaceList;
            Namespace1.DataBind();
        }

        private void DisplayClassList(String CurrentNameSpace) {

            ArrayList ClassList     = new ArrayList();
            ArrayList InterfaceList = new ArrayList();

            for( int y=0; y < ModuleName.Count; y++ ) {

                Module[]  CorRuntime = Assembly.Load(ModuleName[y].ToString()).GetModules();
                Type[]    CorClasses = CorRuntime[0].GetTypes();

                for (int x=0; x < CorClasses.Length; x++ ) {

                    if ( CorClasses[x].Namespace == CurrentNameSpace && CorClasses[x].IsPublic) {
                        SortTable props = new SortTable("GetType");
                        props["GetType"] = CorClasses[x].Name;
                        props["Namespace"] = CorClasses[x].Namespace;
                        props["Assembly"] = CorClasses[x].Assembly.ToString();

                        if ( CorClasses[x].IsInterface )
                            InterfaceList.Add(props);
                        else
                            ClassList.Add(props);
                    }
                }
            }

            if (InterfaceList.Count > 0)
                IHeader.Visible = true;

            if (ClassList.Count > 0)
               CHeader.Visible = true;

            ClassList.Sort();
            Classes.DataSource = ClassList;
            Classes.DataBind();

            InterfaceList.Sort();
            Interfaces.DataSource = InterfaceList;
            Interfaces.DataBind();
        }

        private void DisplayClass(String asmName, String className) {

            Assembly a = Assembly.Load(asmName);
            Type ClassType = a.GetType(SelectedNameSpace.ToString() + "." + className, false, true);
            if ( ClassType == null ) {
                DisplayClassList(SelectedNameSpace);
                return;
            }
            ArrayList SubClassDetails = new DisplaySubClasses(ClassType, ModuleName);

            DisplayConstructors  ConstructorDetails =  new DisplayConstructors(ClassType);
            DisplayFields        FieldDetails       =  new DisplayFields(ClassType);
            DisplayProperties    PropertyDetails    =  new DisplayProperties(ClassType);
            DisplayMethods       MethodDetails      =  new DisplayMethods(ClassType, className);
            DisplaySuperclasses  SuperClassDetails  =  new DisplaySuperclasses(ClassType);
            DisplayInterfaces    InterfaceDetails   =  new DisplayInterfaces(ClassType);
            DisplayEvents        EventDetails       =  new DisplayEvents(ClassType);

            if(ConstructorDetails.Count != 0 )
                Constructors.DataSource = ConstructorDetails;
            if(SubClassDetails.Count != 0 )
                SubClasses.DataSource = SubClassDetails;
            if(FieldDetails.Count != 0 )
                Fields.DataSource = FieldDetails;
            if(PropertyDetails.Count != 0 )
                Properties.DataSource = PropertyDetails;
            if(MethodDetails.Count != 0 )
                Methods.DataSource = MethodDetails;
            if(InterfaceDetails.Count != 0 )
                Interface1.DataSource = InterfaceDetails;
            if(SuperClassDetails.Count != 0 )
                SuperClasses.DataSource = SuperClassDetails;
            if(EventDetails.Count != 0 )
                Events.DataSource = EventDetails;

            DataBind();

            if (ClassType.IsInterface)
                spnClassName.InnerHtml = "Interface " + SelectedNameSpace + "." + className;
            else
                spnClassName.InnerHtml = "Class " + SelectedNameSpace + "." + className;

            NameSpacePanel.Visible=false;
            ClassPanel.Visible=true;
        }

        public String GetUrl(Object objTable) {
            if ( objTable is String ) {
                return "classbrowser.aspx?assembly=" + SelectedAssembly + "&namespace=" + SelectedNameSpace + "&class=" + objTable;
            }

            if ( ! (objTable is Hashtable) ) {
                Response.Write(objTable.GetType().ToString());
                Response.End();
            }

            Hashtable table = (Hashtable) objTable;
            return "classbrowser.aspx?assembly=" + table["Assembly"] + "&namespace=" + table["Namespace"] + "&class=" + table["GetType"];
        }

    </script>

</head>
<body>
  <form runat="server">
    <table class="top" width=100% height="40" cellpadding=0 cellspacing=0>
      <tr>
        <td bgcolor=#000666>
          <b><font size=5 color=white>.NET Framework Class Browser</b>
        </td>
      </tr>
    </table>

    <table width=100% height=700 cellpadding=0 cellspacing=0>
      <tr>
        <td width=25% bgcolor=#CCCCFF valign=top >
          <br>
            <asp:DataList EnableViewState="false" runat=server id="Namespace1"
               RepeatLayOut="flow" ItemStyle-Font-Size="9pt" HeaderStyle-Font-Size="12pt" >
              <HeaderTemplate>
                <div left-margin="10">  <font size=4> <b>Namespaces</b>  </font> <br>
              </HeaderTemplate>

              <ItemTemplate>
                <asp:HyperLink runat="server" text=<%# Container.DataItem %> NavigateUrl=<%# "classbrowser.aspx?namespace=" + Container.DataItem %> />
              </ItemTemplate>

              <SelectedItemTemplate>
                <b><asp:HyperLink  runat=server text=<%# Container.DataItem %>/></b>
              </SelectedItemTemplate>
            </asp:DataList>
            <p>
        </td>

        <td valign=top >

         <div id="ClassPanel" style="margin-top:15;margin-left:10" visible="false" runat="server">
            <b><font size=4 color="000666"><span style="text-indent:8" id="spnClassName" EnableViewState="false" runat="server"/></font></b>
         </div>

          <div id="NameSpacePanel" runat="server">

          <table class="main" width=100%>
            <tr>
              <td class="main_header">
                <span runat=server id="CHeader" visible="false" style="text-indent:8"> <b><font size=4 color=#000666>Classes in
                  <%= SelectedNameSpace %>  </b> </font></span>
              </td>
            </tr>
            <tr>
              <td align="left">
                <asp:DataList EnableViewState="false" runat=server id="Classes" RepeatColumns="3" Gridlines=None borderstyle=none borderwidth=0 >
                  <ItemTemplate>
                    <asp:HyperLink runat=server text=<%# ((SortTable) Container.DataItem)["GetType"] %> NavigateUrl=<%# GetUrl(Container.DataItem) %> />
                  </ItemTemplate>
                </asp:DataList>
              </td>
            </tr>
          </table>

          <table class="main" width=100% >
            <tr>
              <td class="main_header" >
                <span runat=server id="IHeader" visible="false" style="text-indent:8"> <b><font size=4 color=#000666>Interfaces in
                   <%= SelectedNameSpace %>  </font> </b> </span>
              </td>
            </tr>
            <tr>
              <td align="left">
                <asp:DataList EnableViewState="false" runat=server id="Interfaces" RepeatColumns="4"
                  Gridlines=None borderstyle=none borderwidth=0 >
                  <ItemTemplate>
                    <asp:HyperLink runat=server  text=<%# ((SortTable) Container.DataItem)["GetType"] %> NavigateUrl=<%# GetUrl(Container.DataItem) %>/>
                  </ItemTemplate>
                </asp:DataList>
              </td>
            </tr>
          </table>

          </div>

          <table class="main" width=100% cellpadding=0 cellspacing=0 >
            <tr>
              <td class="main_header" valign="top" >
                <asp:DataList EnableViewState="false" id="Constructors" runat="server" Gridlines=None borderstyle="none" borderwidth=0  width="100%">
                  <HeaderTemplate>
                    <table cellspacing=0 width="100%">
                      <tr><td class="class_header"><b><font size=2> Constructors </font></b></td></tr>
                      <tr bgcolor="eeeeee">
                        <td width="75" > <b><u> Visibility     </u> </td>
                        <td width="100"> <b><u> Constructor    </u> </td>
                        <td> <b><u> Parameters     </u> </td>
                      </tr>
                  </HeaderTemplate>

                  <ItemTemplate>
                    <tr bgcolor="eeeeee">
                      <td width="75">
                        <span runat=server InnerHtml=<%# ((SortTable) Container.DataItem)["Access"] %> />
                      </td>
                      <td width="100">
                        <span runat=server InnerHtml =<%# ((SortTable) Container.DataItem)["Name"] %> />
                      </td>
                      <td width="1000">
                        <asp:DataList
                            EnableViewState="false"
                            runat=server
                            RepeatDirection="Horizontal"
                            RepeatLayout=Flow
                            showfooter=true
                            datasource=<%# ((SortTable) Container.DataItem)["Params"]%>
                        >
                           <HeaderTemplate> ( </HeaderTemplate>
                           <ItemTemplate>
                             <asp:HyperLink text=<%# ((SortTable) Container.DataItem)["ParamType"] %> NavigateUrl=<%# GetUrl(Container.DataItem) %> runat=server />
                             <span innerhtml=<%# ((SortTable) Container.DataItem)["ParamName"] %> runat=server />
                           </ItemTemplate>
                           <SeparatorTemplate>, </SeparatorTemplate>
                           <FooterTemplate> ) </FooterTemplate>
                         </asp:DataList>
                       </td>
                     </tr>
                   </ItemTemplate>

                   <FooterTemplate>
                     </table>
                   </FooterTemplate>
                 </asp:DataList>

                 <p>

                 <asp:DataList EnableViewState="false" id="Fields" runat="server"
                   Gridlines=None BorderStyle="none"  width="100%" BorderWidth=0>

                   <HeaderTemplate>
                     <table cellspacing=0  width="100%">
                       <tr><td class="class_header"><b><font size=2> Fields </font></b></td></tr>
                       <tr bgcolor="eeeeee">
                         <td width="120" ><b><u> Visibility </td>
                         <td width="100"><b><u> Type       </td>
                         <td ><b><u> Name       </td>
                       </tr>
                     </HeaderTemplate>

                     <ItemTemplate>
                       <tr bgcolor="eeeeee">
                         <td width="120">
                           <nobr><span InnerHTML=<%# ((SortTable) Container.DataItem)["Access"]%> runat=server /></nobr>
                         </td>
                         <td width="100">
                           <asp:HyperLink text=<%# ((SortTable) Container.DataItem)["Type"] %> NavigateUrl=<%# GetUrl(Container.DataItem) %> runat=server/>
                         </td>
                         <td>
                           <span InnerHTML=<%# ((SortTable) Container.DataItem)["Name"] %> runat=server />
                         </td>
                      </tr>
                    </ItemTemplate>

                    <FooterTemplate>
                      </table>
                    </FooterTemplate>
                  </asp:DataList>

                 <p>

                 <asp:DataList EnableViewState="false" id="Events" runat="server"
                   Gridlines=None BorderStyle="none"  width="100%" BorderWidth=0>

                   <HeaderTemplate>
                     <table cellspacing=0  width="100%">
                       <tr><td class="class_header"><b><font size=2> Events </font></b></td></tr>
                       <tr bgcolor="eeeeee">
                         <td width="120" ><b><u> Multicast </td>
                         <td width="100"><b><u> Type       </td>
                         <td ><b><u> Name       </td>
                       </tr>
                     </HeaderTemplate>

                     <ItemTemplate>
                       <tr bgcolor="eeeeee">
                         <td width="120">
                           <nobr><span InnerHTML=<%# ((SortTable) Container.DataItem)["Access"]%> runat=server /></nobr>
                         </td>
                         <td width="100">
                           <asp:HyperLink text=<%# ((SortTable) Container.DataItem)["Type"] %> NavigateUrl=<%# GetUrl(Container.DataItem) %> runat=server/>
                         </td>
                         <td>
                           <span InnerHTML=<%# ((SortTable) Container.DataItem)["Name"] %> runat=server />
                         </td>
                      </tr>
                    </ItemTemplate>

                    <FooterTemplate>
                      </table>
                    </FooterTemplate>
                  </asp:DataList>

                  <p>

                  <asp:DataList EnableViewState="false" id="Properties" runat="server"
                       Gridlines=None BorderStyle="none" BorderWidth=0 width="100%">

                    <HeaderTemplate>
                      <table cellspacing=0 width="100%" >
                        <tr><td class="class_header"><b><font size=2> Properties </font></b></td></tr>
                        <tr bgcolor="eeeeee">
                          <td width="75"><b><u>Visibility</td>
                          <td width="100"><b><u>Type</td>
                          <td width="150"><b><u>Name</td>
                          <td><b><u>Accessibility</td>
                        </tr>
                      </HeaderTemplate>

                      <ItemTemplate>
                        <tr bgcolor="eeeeee">
                          <td width="75"><span InnerHTML=<%# ((SortTable) Container.DataItem)["Visibility"] %> runat=server /> </td>
                          <td width="100">
                            <asp:HyperLink runat=server runat="server" text=<%# ((SortTable) Container.DataItem)["Type"] %> NavigateUrl=<%# GetUrl(Container.DataItem) %>/> </td>
                          <td width="150"><span InnerHTML=<%# ((SortTable) Container.DataItem)["Name"]%> runat=server/>
                            <asp:DataList EnableViewState="false" runat=server RepeatLayout="Flow" ShowFooter=true
                              RepeatDirection="Horizontal"  datasource=<%# ((SortTable) Container.DataItem)["Params"] %>>
                              <ItemTemplate>
                                ( <asp:HyperLink runat=server text=<%# ((SortTable) Container.DataItem)["ParamType"]%> NavigateUrl=<%# GetUrl(Container.DataItem) %>  />
                                <span InnerHtml=<%# ((SortTable) Container.DataItem)["ParamName"] %> runat=server /> )
                              </ItemTemplate>
                            </asp:DataList>

                          </td>
                          <td><span InnerHTML=<%# ((SortTable) Container.DataItem)["Access"]%> runat=server/></td>
                         </tr>
                       </ItemTemplate>

                     <FooterTemplate>
                       </table>
                     </FooterTemplate>
                   </asp:DataList>

                   <p>

                  <asp:DataList EnableViewState="false" id="Methods" runat="server"
                    Gridlines=None borderstyle="none" borderwidth="0" width="100%">

                    <HeaderTemplate>
                      <table cellspacing=0  >
                        <tr><td class="class_header"><b><font size=2> Methods </font></b></td></tr>
                        <tr bgcolor="eeeeee">
                          <td width="75" ><b><u>Visibility</td>
                          <td width="100"><b><u>Return </td>
                          <td width="100"><b><u>Name</td>
                          <td width="600"><b><u>Parameters</td>
                        </tr>
                      </HeaderTemplate>

                      <ItemTemplate>
                        <tr bgcolor="eeeeee">
                          <td  width="75"><nobr><span runat=server InnerHtml=<%# ((SortTable) Container.DataItem)["Access"]%> /></nobr></td>
                          <td width="100">
                            <asp:HyperLink runat=server NavigateUrl=<%# GetUrl(Container.DataItem) %> text=<%# ((SortTable) Container.DataItem)["Type"]%>/>
                          </td>
                          <td width="100"><span runat=server InnerHtml=<%# ((SortTable) Container.DataItem)["Name"]%>/></td>
                          <td  width="900">
                            <asp:DataList EnableViewState="false" runat=server
                            datasource=<%# ((SortTable) Container.DataItem)["Params"] %>
                            RepeatLayout=Flow RepeatDirection="Horizontal" showfooter=true >
                              <HeaderTemplate>
                                (
                              </HeaderTemplate>
                              <ItemTemplate>
                                <asp:HyperLink text=<%# ((SortTable) Container.DataItem)["ParamType"].ToString() %> NavigateUrl=<%# GetUrl(Container.DataItem) %> runat=server />
                                <span InnerHtml=<%# ((SortTable) Container.DataItem)["ParamName"] %>  runat=server />
                              </ItemTemplate>
                              <SeparatorTemplate> ,</SeparatorTemplate>
                              <FooterTemplate>
                                )
                              </FooterTemplate>
                            </asp:DataList>
                          </td>
                        </tr>
                      </ItemTemplate>

                      <FooterTemplate>
                        </table>
                      </FooterTemplate>
                    </asp:DataList>

                    <p>

                    <asp:DataList EnableViewState="false" id="SuperClasses" style="margin-left:10" runat="server" RepeatLayout="Flow"
                       RepeatDirection="horizontal"  width="100%">

                      <HeaderTemplate>
                        <font size=2><b> Hierarchy </b></font> <br>
                      </HeaderTemplate>

                      <ItemTemplate>
                        <asp:HyperLink runat=server NavigateUrl=<%# GetUrl(Container.DataItem) %> text=<%# ((SortTable) Container.DataItem)["FullName"]%> />
                      </ItemTemplate>

                      <SeparatorTemplate>
                        <font face="Verdana" style="font-size:8pt"><nobr>---></nobr>
                      </SeparatorTemplate>
                    </asp:DataList>

                    <p>

                    <asp:DataList EnableViewState="false" id="Interface1" runat=server style="margin-left:10" RepeatDirection="horizontal"
                       RepeatLayout="Flow"  width="100%">

                      <HeaderTemplate>
                        <font size=2><b> Implements </b></font> <br>
                      </HeaderTemplate>

                      <ItemTemplate>
                        <asp:HyperLink runat=server NavigateUrl=<%# GetUrl(Container.DataItem) %> text=<%# ((SortTable) Container.DataItem)["FullName"]%> />
                      </ItemTemplate>

                      <SeparatorTemplate>
                        <font face="Verdana" style="font-size:8pt">,
                      </SeparatorTemplate>

                    </asp:DataList>

                    <p>

                    <asp:DataList EnableViewState="false" id="SubClasses" style="margin-left:10" runat=server
                       RepeatLayout="Flow" RepeatDirection="horizontal"  width="100%">
                      <HeaderTemplate>
                        <font size=2> <b>Subclassed By </b></font>  <br>
                      </HeaderTemplate>

                      <ItemTemplate>
                        <asp:HyperLink runat=server NavigateUrl=<%# GetUrl(Container.DataItem) %> text=<%# ((SortTable) Container.DataItem)["FullName"]%> />
                      </ItemTemplate>

                      <SeparatorTemplate>
                        <font face="Verdana" style="font-size:8pt">,
                      </SeparatorTemplate>
                    </asp:DataList>

                    <p>

                  </td>
                </tr>
              </table>

            </td>
          </tr>
        </table>
    </form>
  </body>
</html>      