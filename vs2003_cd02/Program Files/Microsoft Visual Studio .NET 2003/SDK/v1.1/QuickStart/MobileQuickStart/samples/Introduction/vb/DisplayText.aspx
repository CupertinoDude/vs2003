<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<mobile:Form runat="server" Paginate="true">
    <mobile:Label runat="server" StyleReference="title">Showing a Lot of Text</mobile:Label>
    <mobile:Label runat="server" />
    <mobile:TextView runat="server">
This sample shows use of the <b>TextView</b> control, which
can be used to render a large amount of text.
This control supports a number of common markup tags in its
text, and marked up text can be <i>dynamically</i> set on the control.
<br />
This sample turns on the <b>Paginate</b> property of the form to enable
automatic pagination. The entire contents of the form, including the text
contained in this control, are automatically
paginated according to the size of the target device.
The form provides UI to allow you to switch between
pages of text.
On a Pocket PC or similar device, this form will
only occupy one page (though it will scroll). On a four-line cellular phone, this form
will occupy multiple pages.
The default page size is automatically chosen based on the target
device, but you can programatically override it.
    </mobile:TextView>
</mobile:Form>


