<%@ Page Debug="true" %>
<%@ Import NameSpace="ClassInfoVB" %>
<%@ Import NameSpace="System.Collections"  %>
<%@ Import NameSpace="System.Collections.Specialized" %>
<%@ Import NameSpace="System.Reflection" %>

<html>
<head>

    <title>.NET Framework Class Browser</title>
    <link rel="stylesheet" href="../classstyle.css">

    <script runat="server" language="VB">

        public SelectedAssembly As String
        public SelectedNameSpace As String
        public ModuleName As New ArrayList()

        Protected Sub Page_Load(Sender As Object, e As EventArgs)

            Dim ConfigSettings As NameValueCollection = CType(Context.GetConfig("system.web/ClassBrowser"), NameValueCollection)
            Dim I As Integer

            For I = 0 To ConfigSettings.Count - 1
                ModuleName.Add(ConfigSettings(I).ToString())
            Next

            DisplayNamespaces()

            If Request.QueryString("namespace") Is Nothing Then
                SelectedNameSpace = "System"
            Else
                SelectedNameSpace = Request.QueryString("namespace")
            End If

            If Request.QueryString("assembly") Is Nothing Or Request.QueryString("assembly") = "" Then
                SelectedAssembly = "mscorlib"
            Else
                SelectedAssembly = Request.QueryString("assembly")
            End If

            If Not Request.QueryString("class") Is Nothing And Not Request.QueryString("assembly") Is Nothing Then
                DisplayClass(Request.QueryString("assembly"), Request.QueryString("class"))
            Else
                DisplayClassList(SelectedNameSpace)
            End If
        End Sub

        Private Sub DisplayNamespaces()

            Dim NameSpaceList As New ArrayList()
            Dim NameSpaceHash As New Hashtable()

            Dim Y As Integer
            For Y = 0 To ModuleName.Count - 1

                Dim CorRuntime() As System.Reflection.Module = System.Reflection.Assembly.Load(ModuleName(y).ToString()).GetModules()
                Dim CorClasses() As Type = CorRuntime(0).GetTypes()

                Dim X As Integer
                For X = 0 To CorClasses.Length - 1
                    If Not CorClasses(x).Namespace Is Nothing
                        If Not NameSpaceHash.ContainsKey(CorClasses(x).Namespace) And CorClasses(x).IsPublic
                            NameSpaceHash.Add(CorClasses(x).Namespace,"")
                            NameSpaceList.Add(CorClasses(x).Namespace)
                        End If
                    End If
                Next
            Next

            NameSpaceList.Sort()
            Namespace1.DataSource = NameSpaceList
            Namespace1.DataBind()
        End Sub

        Private Sub DisplayClassList(CurrentNameSpace As String)

            Dim ClassList As New ArrayList()
            Dim InterfaceList As New ArrayList()
            Dim Y As Integer

            For Y = 0 To ModuleName.Count - 1

                Dim CorRuntime() As System.Reflection.Module = System.Reflection.Assembly.Load(ModuleName(y).ToString()).GetModules()
                Dim CorClasses() As Type = CorRuntime(0).GetTypes()
                Dim X As Integer

                For X = 0 To CorClasses.Length - 1

                    If CorClasses(x).Namespace = CurrentNameSpace And CorClasses(x).IsPublic
                        Dim props As New SortTable("GetType")
                        props("GetType") = CorClasses(x).Name
                        props("Namespace") = CorClasses(x).Namespace
                        props("Assembly") = CorClasses(x).Assembly.ToString()

                        If CorClasses(x).IsInterface
                            InterfaceList.Add(props)
                        Else
                            ClassList.Add(props)
                        End If
                    End If
                Next
            Next

            If InterfaceList.Count > 0 Then IHeader.Visible = true

            If ClassList.Count > 0 Then CHeader.Visible = true

            ClassList.Sort()
            Classes.DataSource = ClassList
            Classes.DataBind()

            InterfaceList.Sort()
            Interfaces.DataSource = InterfaceList
            Interfaces.DataBind()
        End Sub

        Private Sub DisplayClass(asmName As String, className As String)

            If asmName Is Nothing Or asmName = "" Then
                DisplayClassList(SelectedNamespace)
                Return
            End If

            Dim a As System.Reflection.Assembly = System.Reflection.Assembly.Load(asmName)
            Dim ClassType As Type = a.GetType(SelectedNameSpace.ToString() & "." & className, False, True)

            If ClassType Is Nothing Then
                DisplayClassList(SelectedNameSpace)
                Return
            End If

            Dim SubClassDetails As ArrayList = New DisplaySubClasses(ClassType, ModuleName)
            Dim ConstructorDetails As DisplayConstructors = New DisplayConstructors(ClassType)
            Dim FieldDetails As DisplayFields = New DisplayFields(ClassType)
            Dim PropertyDetails As DisplayProperties = new DisplayProperties(ClassType)
            Dim MethodDetails As DisplayMethods = new DisplayMethods(ClassType, className)
            Dim SuperClassDetails As DisplaySuperclasses = new DisplaySuperclasses(ClassType)
            Dim InterfaceDetails As DisplayInterfaces = new DisplayInterfaces(ClassType)
            Dim EventDetails As DisplayEvents = new DisplayEvents(ClassType)

            If ConstructorDetails.Count <> 0 Then Constructors.DataSource = ConstructorDetails
            If SubClassDetails.Count <> 0 Then SubClasses.DataSource = SubClassDetails
            If FieldDetails.Count <> 0 Then Fields.DataSource = FieldDetails
            If PropertyDetails.Count <> 0 Then Properties.DataSource = PropertyDetails
            If MethodDetails.Count <> 0 Then Methods.DataSource = MethodDetails
            If InterfaceDetails.Count <> 0 Then Interface1.DataSource = InterfaceDetails
            If SuperClassDetails.Count <> 0 Then SuperClasses.DataSource = SuperClassDetails
            If EventDetails.Count <> 0 Then Events.DataSource = EventDetails

            DataBind()

            If ClassType.IsInterface Then
                spnClassName.InnerHtml = "Interface " & SelectedNameSpace & "." & className
            Else
                spnClassName.InnerHtml = "Class " & SelectedNameSpace & "." & className
            End If

            NameSpacePanel.Visible = False
            ClassPanel.Visible = True
        End Sub

        Function GetUrl(objTable As Object) As String
            If TypeOf objTable Is String Then
                return "classbrowser.aspx?assembly=" & SelectedAssembly & "&namespace=" & SelectedNameSpace & "&class=" & objTable
            End If

            If Not TypeOf objTable Is Hashtable Then
                Response.Write(objTable.GetType().ToString())
                Response.End()
            End If

            Dim table As Hashtable = CType(objTable, Hashtable)
            Return "classbrowser.aspx?assembly=" & table("Assembly") & "&namespace=" & table("Namespace") & "&class=" & table("GetType")
        End Function

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
                    <asp:HyperLink runat=server text=<%# CType(Container.DataItem, SortTable)("GetType") %> NavigateUrl=<%# GetUrl(Container.DataItem) %> />
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
                    <asp:HyperLink runat=server  text=<%# CType(Container.DataItem, SortTable)("GetType") %> NavigateUrl=<%# GetUrl(Container.DataItem) %>/>
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
                        <span runat=server InnerHtml=<%# CType(Container.DataItem, SortTable)("Access") %> />
                      </td>
                      <td width="100">
                        <span runat=server InnerHtml =<%# CType(Container.DataItem, SortTable)("Name") %> />
                      </td>
                      <td width="1000">
                        <asp:DataList
                            EnableViewState="false"
                            runat=server
                            RepeatDirection="Horizontal"
                            RepeatLayout=Flow
                            showfooter=true
                            datasource=<%# CType(Container.DataItem, SortTable)("Params") %>
                        >
                           <HeaderTemplate> ( </HeaderTemplate>
                           <ItemTemplate>
                             <asp:HyperLink text=<%# CType(Container.DataItem, SortTable)("ParamType") %> NavigateUrl=<%# GetUrl(Container.DataItem) %> runat=server />
                             <span innerhtml=<%# CType(Container.DataItem, SortTable)("ParamName") %> runat=server />
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
                           <nobr><span InnerHTML=<%# CType(Container.DataItem, SortTable)("Access") %> runat=server /></nobr>
                         </td>
                         <td width="100">
                           <asp:HyperLink text=<%# CType(Container.DataItem, SortTable)("Type") %> NavigateUrl=<%# GetUrl(Container.DataItem) %> runat=server/>
                         </td>
                         <td>
                           <span InnerHTML=<%# CType(Container.DataItem, SortTable)("Name") %> runat=server />
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
                           <nobr><span InnerHTML=<%# CType(Container.DataItem, SortTable)("Access")%> runat=server /></nobr>
                         </td>
                         <td width="100">
                           <asp:HyperLink text=<%# CType(Container.DataItem, SortTable)("Type") %> NavigateUrl=<%# GetUrl(Container.DataItem) %> runat=server/>
                         </td>
                         <td>
                           <span InnerHTML=<%# CType(Container.DataItem, SortTable)("Name") %> runat=server />
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
                          <td width="75"><span InnerHTML=<%# CType(Container.DataItem, SortTable)("Visibility") %> runat=server /> </td>
                          <td width="100">
                            <asp:HyperLink runat=server runat="server" text=<%# CType(Container.DataItem, SortTable)("Type") %> NavigateUrl=<%# GetUrl(Container.DataItem) %>/> </td>
                          <td width="150"><span InnerHTML=<%# CType(Container.DataItem, SortTable)("Name")%> runat=server/>
                            <asp:DataList EnableViewState="false" runat=server RepeatLayout="Flow" ShowFooter=true
                              RepeatDirection="Horizontal"  datasource=<%# CType(Container.DataItem, SortTable)("Params") %>>
                              <ItemTemplate>
                                ( <asp:HyperLink runat=server text=<%# CType(Container.DataItem, SortTable)("ParamType")%> NavigateUrl=<%# GetUrl(Container.DataItem) %>  />
                                <span InnerHtml=<%# CType(Container.DataItem, SortTable)("ParamName") %> runat=server /> )
                              </ItemTemplate>
                            </asp:DataList>

                          </td>
                          <td><span InnerHTML=<%# CType(Container.DataItem, SortTable)("Access")%> runat=server/></td>
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
                          <td  width="75"><nobr><span runat=server InnerHtml=<%# CType(Container.DataItem, SortTable)("Access")%> /></nobr></td>
                          <td width="100">
                            <asp:HyperLink runat=server NavigateUrl=<%# GetUrl(Container.DataItem) %> text=<%# CType(Container.DataItem, SortTable)("Type")%>/>
                          </td>
                          <td width="100"><span runat=server InnerHtml=<%# CType(Container.DataItem, SortTable)("Name")%>/></td>
                          <td  width="900">
                            <asp:DataList EnableViewState="false" runat=server
                            datasource=<%# CType(Container.DataItem, SortTable)("Params") %>
                            RepeatLayout=Flow RepeatDirection="Horizontal" showfooter=true >
                              <HeaderTemplate>
                                (
                              </HeaderTemplate>
                              <ItemTemplate>
                                <asp:HyperLink text=<%# CType(Container.DataItem, SortTable)("ParamType").ToString() %> NavigateUrl=<%# GetUrl(Container.DataItem) %> runat=server />
                                <span InnerHtml=<%# CType(Container.DataItem, SortTable)("ParamName") %>  runat=server />
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
                        <asp:HyperLink runat=server NavigateUrl=<%# GetUrl(Container.DataItem) %> text=<%# CType(Container.DataItem, SortTable)("FullName")%> />
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
                        <asp:HyperLink runat=server NavigateUrl=<%# GetUrl(Container.DataItem) %> text=<%# CType(Container.DataItem, SortTable)("FullName")%> />
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
                        <asp:HyperLink runat=server NavigateUrl=<%# GetUrl(Container.DataItem) %> text=<%# CType(Container.DataItem, SortTable)("FullName")%> />
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