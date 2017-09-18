<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">A Personalized Portal</span>

<p>This sample illustrates a personalized portal home page application. The application
allows users to customize a home page to show various modules of their choosing,
such as a site directory or favorite links list. Each module is implemented as a
user control, which is dynamically added to the home page if the
user has chosen to include it. The custom personalization settings are maintained in a
SQL database and are retrieved using a personalization HTTP module component
(which works much as the session state and application state HTTP modules do). Every page in the
application inherits from a common code-behind base <b>Page</b> class, which uses the
personalization component to expose a special dictionary called UserState. This
UserState dictionary provides the application's pages with access to the per-user
customization settings (as key/value string pairs). In addition
to storing the user's module selections, the UserState dictionary stores
other customization parameters such as color schemes. Individual modules can use the
UserState dictionary to store their own customization settings as well.</p>

<p>The portal application employs the <b>FormsAuthenticationModule</b> for user
authentication. When a user first requests the home page, the settings for an anonymous
user are displayed. If the user tries to access a portion of the portal that is
restricted to authenticated users (such as the module customization page), the
<b>FormsAuthenticationModule</b> redirects the user to a login page to
enter credentials. A user who has not logged in before can use a
registration form to create a new user account and password. On subsequent visits to
the portal home page, a user can simply log in using these account credentials (which are then verified
against a SQL database).</p>

<p>To get started exploring the portal application, follow the steps described above to create a
user account. Once your account is created you can browse and customize the entire
portal.</p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/portal/CS/default.aspx"
  ViewSource="/quickstart/aspplus/samples/portal/portal.src"
  Icon="/quickstart/aspplus/images/portal_icon.gif"
  Caption="C# Portal Application"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/portal/VB/default.aspx"
  ViewSource="/quickstart/aspplus/samples/portal/portal.src"
  Icon="/quickstart/aspplus/images/portal_icon.gif"
  Caption="VB Portal Application"
  runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->