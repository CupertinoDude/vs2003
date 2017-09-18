<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Graphics and Windows Forms</span>

<ul>
    <li><a href="#Introduction">Introduction to GDI+</a>
    <li><a href="#Differences between GDI and GDI+">Differences between GDI and GDI+</a>
    <li><a href="#GDI+ Namespaces">GDI+ Namespaces</a>
    <li><a href="#Creating a Graphics Object">Creating a Graphics Object</a>
    <li><a href="#Alpha Blending">Alpha Blending</a>
    <li><a href="#Using Brushes">Using Brushes</a>
    <li><a href="#Using Pens">Using Pens</a>
    <li><a href="#Drawing Text">Drawing Text</a>
    <li><a href="#Using Images">Using Images</a>
    <li><a href="#Other information">Other Information</a>
</ul>


<a name="Introduction"/>
<span class="subhead">Introduction to GDI+</span>
<p>The common language runtime takes advantage of an advanced version of the Windows graphics device interface (GDI)
called GDI+. GDI+ is designed to provide high performance and ease of use. It supports 2-D graphics,
typography, and imaging.
<p><b>New 2-D features include the following:</b></p>
<ul>
<li>Alpha blending support for all graphics primitives</li>
<li>Anti-aliasing</li>
<li>Gradient and texture fills</li>
<li>Wide lines</li>
<li>Cardinal splines</li>
<li>Scalable regions</li>
<li>Floating point coordinates</li>
<li>Compound lines</li>
<li>Inset pen</li>
<li>High quality filtering and scaling</li>
<li>Numerous line styles and end-cap options</li>
</ul>
<p><b>Image support includes the following:</b></p>
<ul>
<li>Native support for image file formats such as .jpeg, .png, .gif, .bmp, .tiff, .exif, and .ico</li>
<li>Common interfaces for encoding and decoding arbitrary raster image formats</li>
<li>Extensible architecture for dynamically adding new image file formats</li>
<li>Native image processing support for common point operations such as
brightness, contrast, color balance, blur, and dissolve. Support for common transforms such as
rotate, crop, and so on.</li>
</ul>
<p><b>Color Management</b></p>
<p>Support for sRGB, ICM2, and sRGB64
<p><b>Typographic support includes the following:</b></p>
<ul>
<li>Native ClearType support</li>
<li>Texture and gradient filled text</li>
<li>Full Unicode support on all platforms</li>
<li>Support for all Windows 2000 scripts</li>
<li>Update to Unicode 3.0 standards</li>
<li>Text line services support for better text readability</li>
</ul>
<p>GDI+ can be used with Windows Forms and with Web Forms. For instance, a Web Forms control can dynamcially
generate a .jpeg file, using GDI+ based on user input, and reference it from a web page.</p>
<p>This section focuses on Windows Forms.</p>


<a name="Differences between GDI and GDI+"/>
<span class="subhead">Differences between GDI and GDI+</span>
<p>The aim of this section is to help you understand the basics of using GDI+. Before you move on, it is
worth pointing out the biggest difference between GDI and GDI+. GDI has a stateful programming
model, but GDI+ has a stateless programming model. Using GDI, you set properties on the drawing surface, such as foreground color and background
color, and then draw on it. For instance, to draw a string of black text, the code looks
something like the following example.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
Graphics g ;
g.ForeColor = Color.Black;
g.BackColor = Color.White;
g.Font = new Font("Times New Roman", 26);
g.DrawString("Hello, World", 0, 0);
</Tab>

<Tab Name="VB">
Dim g as Graphics
g.ForeColor = Color.Black
g.BackColor = Color.White
g.Font = new Font("Times New Roman", 26)
g.DrawString("Hello, World", 0, 0)
</Tab>
</Acme:TabControl><p>

<p>When using GDI+, you always pass the properties to be used
as part of the drawing command. The previous code changes to the following.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
Graphics g ;
Color foreColor = Color.Black;
Color backColor = Color.White;
Font font = new Font("Times New Roman", 26);
g.FillRectangle(new SolidBrush(backColor), ClientRectangle);
g.DrawString("Hello World", font, new SolidBrush(foreColor), 15, 15);
</Tab>

<Tab Name="VB">
Dim g As Graphics;
Dim foreColor As Color = Color.Black;
Dim backColor As Color = Color.White;
Dim vbFont As New Font("Times New Roman", 26);
g.FillRectangle(New SolidBrush(backColor), ClientRectangle);
g.DrawString("Hello World", vbFont, New SolidBrush(foreColor), 15, 15);
</Tab>
</Acme:TabControl><p>


<a name="GDI+ Namespaces"/>
<span class="subhead">GDI+ Namespaces</span>

<p>The GDI+ classes reside in the <b>System.Drawing</b>,
<b>System.Drawing.Drawing2D</b>, <b>System.Drawing.Imaging</b>, and
<b>System.Drawing.Text</b> namespaces.  The namespaces are contained in
the Assembly <b>System.Drawing.DLL</b>.


<a name="Creating a Graphics Object"/>
<span class="subhead">Creating a Graphics Object</span>
<p>A GDI+ drawing surface is represented by the <b>Graphics</b> class. In order to use GDI+, you first
need a reference to a graphics object. Typically, you get a
reference to a graphics object in the <b>Paint</b> event of a control or form, or in the <b>PrintPage</b>
event of a <a href=WinFormsPrinting.aspx>PrintDocument</a>.
<p>You can handle the <b>Paint</b> event by creating an event handler for that event.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
public class GdiPlusDemo : Form {

   public GdiPlusDemo () {
        //Hook the paint event of the form.
        this.Paint += new PaintEventHandler(form1_Paint);
    }

    private void form1_Paint(object sender, PaintEventArgs pe) {
        Graphics g = pe.Graphics;

        //Simply fill a rectangle with red.
        g.FillRectangle(new SolidBrush(Color.Red), 40, 40, 140, 140);
    }
}
</Tab>

<Tab Name="VB">
Public Class GdiPlusDemo : Inherits Form

    Public Sub New()
        ' Hook the paint event of the form.
        AddHandler Me.Paint, AddressOf form1_Paint
    End Sub

    Private Sub form1_Paint(sender As Object, pe As PaintEventArgs)
        Dim g As Graphics = pe.Graphics

        ' Simply fill a rectangle with red.
        g.FillRectangle(New SolidBrush(Color.Red), 40, 40, 140, 140)
    End Sub
End Class
</Tab>

</Acme:TabControl><p>

<p>More typically, you can subclass and override the <b>OnPaint</b> method.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
public class GdiPlusDemo : Form {

   public GdiPlusDemo () {
   }

   protected override void OnPaint(PaintEventArgs pe) {
        Graphics g = pe.Graphics;
        g.FillRectangle(new SolidBrush(Color.Red), 40, 40, 140, 140);
    }
}
</Tab>

<Tab Name="VB">
Public Class GdiPlusDemo : Inherits Form

   Public Sub New()
   End Sub

   Protected Overrides Sub OnPaint(pe As PaintEventArgs)
        Dim g As Graphics = pe.Graphics
        g.FillRectangle(New SolidBrush(Color.Red), 40, 40, 140, 140)
   End Sub
End Class
</Tab>

</Acme:TabControl><p>
<p>You can also create a <b>Graphics</b> object instance from any derived class of <b>Image</b>.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
Bitmap newBitmap = new Bitmap(600,400,PixelFormat.Format32bppArgb);
Graphics g = Graphics.FromImage(newBitmap);
g.FillRectangle(new SolidBrush(Color.Red), 40, 40, 140, 140);
newBitmap.Save("c:\\temp\\TestImage.jpg", ImageFormat.Jpeg) ;
</Tab>

<Tab Name="VB">
Dim newBitmap As Bitmap = New Bitmap(600,400,PixelFormat.Format32bppArgb)
Dim g As Graphics = Graphics.FromImage(newBitmap)
g.FillRectangle(New SolidBrush(Color.Red), 40, 40, 140, 140)
newBitmap.Save("c:\temp\TestImage.jpg", ImageFormat.Jpeg)
</Tab>

</Acme:TabControl><p>

<p>After creating a <b>Graphics</b> object, you can use it to draw lines, fill shapes, draw text,
and so on. The major objects that you use in association with the <b>Graphics</b> object are the following.

<table class=mydd border=0 cellpadding=5>
    <tr>
        <td valign=top><strong>Brush</strong></td>
        <td>
            <p>Used to fill enclosed surfaces with patterns, colors, or bitmaps.</p>
        </td>
    </tr>
    <tr>
        <td valign=top><strong>Pen</strong></td>
        <td><p>Used to draw lines and polygons, including rectangles, arcs, and pies.</p></td>
    </tr>
    <tr>
        <td valign=top><strong>Font</strong></td>
        <td><p>Used to describe the font used to render text.</p></td>
    </tr>
    <tr>
        <td valign=top><strong>Color</strong></td>
        <td><p>Used to describe the color used to render a particular object. In GDI+, the color can be alpha blended.</p></td>
    </tr>
</table>


<a name="Alpha Blending"/>
<span class="subhead">Alpha Blending</span>
Colors can be alpha blended, which makes it is easy to create effects that are based on overlays of colors.
For instance, the following example paints a red rectangle, overlayed with a yellow rectangle, without
obscuring the underlying red rectangle.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
Graphics g = pe.Graphics;
g.FillRectangle(new SolidBrush(Color.Red), 600, 350, 100, 100);
g.FillRectangle(new SolidBrush(Color.FromArgb(180, Color.Yellow)), 650,
                               400, 100, 100);
</Tab>

<Tab Name="VB">
Dim g As Graphics = pe.Graphics
g.FillRectangle(new SolidBrush(Color.Red), 600, 350, 100, 100)
g.FillRectangle(new SolidBrush(Color.FromArgb(180, Color.Yellow)), 650, _
                               400, 100, 100)
</Tab>

</Acme:TabControl><p>


<a name="Using Brushes"/>
<span class="subhead">Using Brushes</span>
You use a brush to fill the interior of shapes and paths. For instance, to create a red rectangle, see the following example.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
Graphics g = pe.Graphics;
g.FillRectangle(new SolidBrush(Color.Red), 600, 350, 100, 100);
</Tab>

<Tab Name="VB">
Dim g As Graphics = pe.Graphics
g.FillRectangle(new SolidBrush(Color.Red), 600, 350, 100, 100)
</Tab>

</Acme:TabControl><p>
<p>Brushes can either be solid, hatched, textured, or gradiated.
A hatched brush is simply a brush that paints using a pattern.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
Graphics g = pe.Graphics;
HatchBrush hb = new HatchBrush(HatchStyle.ForwardDiagonal, Color.Green,
                               Color.FromArgb(100, Color.Yellow));
g.FillEllipse(hb, 250, 10, 100, 100);
</Tab>

<Tab Name="VB">
Dim g As Graphics = pe.Graphics
HatchBrush hb = new HatchBrush(HatchStyle.ForwardDiagonal, Color.Green, _
                               Color.FromArgb(100, Color.Yellow))
g.FillEllipse(hb, 250, 10, 100, 100)
</Tab>

</Acme:TabControl><p>
<p>A textured brush uses a bitmap to paint. For instance, the following code uses a texture
brush to paint the background of a form and applies a white "wash" over it to tone
down the colors in the bitmap.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
Graphics g = pe.Graphics;
Image colorbars = new Bitmap("colorbars.jpg");
Brush backgroundBrush = new TextureBrush(colorbars);
g.FillRectangle(backgroundBrush, ClientRectangle);
g.FillRectangle(new SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle);
</Tab>

<Tab Name="VB">
Dim g As Graphics = pe.Graphics
Dim colorbars As Image = new Bitmap("colorbars.jpg")
Dim backgroundBrush As Brush = new TextureBrush(colorbars)
g.FillRectangle(backgroundBrush, ClientRectangle)
g.FillRectangle(new SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle)
</Tab>

</Acme:TabControl><p>
<p>A  <b>LinearGradientBrush</b> uses two colors to paint. It fills the given shape, gradually changing
from one color to the other, according to the attributes set on the brush. For instance, you can create the following fill with the
code that follows.</p>

<br><img src=LinearGradient.jpg><br>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
Rectangle r = new Rectangle(500, 300, 100, 100);
LinearGradientBrush lb = new LinearGradientBrush(r, Color.Red, Color.Yellow,
                                            LinearGradientMode.BackwardDiagonal);
e.Graphics.FillRectangle(lb, r);
</Tab>

<Tab Name="VB">
Dim r As Rectangle = new Rectangle(500, 300, 100, 100);
Dim lb As LinearGradientBrush = new LinearGradientBrush(r, Color.Red, Color.Yellow, _
                                                       LinearGradientMode.BackwardDiagonal);
e.Graphics.FillRectangle(lb, r);
</Tab>

</Acme:TabControl><p>

<p>A <b>PathGradient</b> brush allows for the creation of much more complex effects, such as the following shape.
<br><img src=PathGradient.jpg><br>
It was created with the following code.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
protected override void OnPaint(PaintEventArgs e) {
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias;
    e.Graphics.FillRectangle(backgroundBrush, ClientRectangle);
    e.Graphics.FillRectangle(new SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle);

    GraphicsPath path = new GraphicsPath(new Point[] {
        new Point(40, 140),
        new Point(275, 200),
        new Point(105, 225),
        new Point(190, 300),
        new Point(50, 350),
        new Point(20, 180),
        }, new byte[] {
            (byte)PathPointType.Start,
            (byte)PathPointType.Bezier,
            (byte)PathPointType.Bezier,
            (byte)PathPointType.Bezier,
            (byte)PathPointType.Line,
            (byte)PathPointType.Line,
            });

    PathGradientBrush pgb = new PathGradientBrush(path);
    pgb.SurroundColors = new Color[] {
        Color.Green,
        Color.Yellow,
        Color.Red,
        Color.Blue,
        Color.Orange,
        Color.White,
    };

    e.Graphics.FillPath(pgb, path);
}
</Tab>

<Tab Name="VB">
Protected Overrides Sub OnPaint(e As PaintEventArgs)
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias
    e.Graphics.FillRectangle(backgroundBrush, ClientRectangle)
    e.Graphics.FillRectangle(New SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle)

    Dim path As New GraphicsPath(New Point() { _
        New Point(40, 140), _
        New Point(275, 200), _
        New Point(105, 225), _
        new Point(190, 300), _
        new Point(50, 350), _
        new Point(20, 180), _
        }, New Byte() { _
            CType(PathPointType.Start, Byte), _
            CType(PathPointType.Bezier, Byte), _
            CType(PathPointType.Bezier, Byte), _
            CType(PathPointType.Bezier, Byte), _
            CType(PathPointType.Line, Byte), _
            CType(PathPointType.Line, Byte), _
            })

    Dim pgb As New PathGradientBrush(path)
    pgb.SurroundColors = new Color() { _
        Color.Green, _
        Color.Yellow, _
        Color.Red, _
        Color.Blue, _
        Color.Orange, _
        Color.White, _
    }

    e.Graphics.FillPath(pgb, path)
End Sub
</Tab>

</Acme:TabControl><p>

<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/GDIPlus/Brushes/CS"
        ViewSource="/quickstart/winforms/Samples/GDIPlus/Brushes/Brushes.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Brush Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/GDIPlus/Brushes/VB"
        ViewSource="/quickstart/winforms/Samples/GDIPlus/Brushes/Brushes.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Brush Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<a name="Using Pens">
<span class="subhead">Using Pens</span>

<p>You use a pen to draw lines and curves.  You can set properties, such as
<b>PenType</b>, <b>DashStyle</b>, <b>Width</b>, <b>Color</b>, and <b>EndCap</b> to control how a <b>Pen</b> draws.
<p>The following code draws a curve.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
Graphics g;
//Create a pen 20 pixels wide that is and purple and partially transparent. </span>
Pen penExample = new Pen(Color.FromArgb(150, Color.Purple), 20);
//Make it a dashed pen.</span>
Pen penExample.DashStyle = DashStyle.Dash;
//Make the ends round.</span>
Pen penExample.StartCap = LineCap.Round;
Pen penExample.EndCap = LineCap.Round;

//Now draw a curve using the pen. </span>
g.DrawCurve(penExample, new Point[] {
            new Point(200, 140),
            new Point(700, 240),
            new Point(500, 340),
            new Point(140, 140),
            new Point(40, 340),
});
</Tab>

<Tab Name="VB">
Dim g As Graphics
' Create a pen 20 pixels wide that is and purple and partially transparent.
Dim penExample As New Pen(Color.FromArgb(150, Color.Purple), 20)
' Make it a dashed pen.
Dim penExample.DashStyle As Pen = DashStyle.Dash
' Make the ends round.
Dim penExample.StartCap As Pen = LineCap.Round
Dim penExample.EndCap As Pen= LineCap.Round

' Now draw a curve using the pen
g.DrawCurve(penExample, New Point() { _
            New Point(200, 140), _
            New Point(700, 240), _
            New Point(500, 340), _
            New Point(140, 140), _
            New Point(40, 340), _
})
</Tab>

</Acme:TabControl><p>

<p>It is also possible to use a texture as the fill for a pen by using a textured brush.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
Graphics g;
Brush textureBrush = new TextureBrush(new Bitmap("Boiling Point.jpg"));
Pen penExample = new Pen(textureBrush, 25);
penExample.DashStyle = DashStyle.DashDotDot;
penExample.StartCap = LineCap.Triangle;
penExample.EndCap = LineCap.Round;
g.DrawLine(penExample, 10,450,550,400);
</Tab>

<Tab Name="VB">
Dim g As Graphics
Dim textureBrush As New TextureBrush(New Bitmap("Boiling Point.jpg"))
Dim penExample As New Pen(textureBrush, 25)
penExample.DashStyle = DashStyle.DashDotDot
penExample.StartCap = LineCap.Triangle
penExample.EndCap = LineCap.Round
g.DrawLine(penExample, 10,450,550,400)
</Tab>

</Acme:TabControl><p>
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/GDIPlus/Pens/CS"
        ViewSource="/quickstart/winforms/Samples/GDIPlus/Pens/Pens.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Pen Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples//GDIPlus/Pens/VB"
        ViewSource="/quickstart/winforms/Samples/GDIPlus/Pens/Pens.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Pen Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<a name="Drawing Text">
<span class="subhead">Drawing Text</span>
<p>The <b>Graphics</b> object's <b>DrawString</b> methods render the text to the drawing surface. You pass the font
and color to be used to the <b>DrawString</b> method. For instance, the following code displays the
text &quot;Hello World&quot; by using the form's font and a black brush.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
protected override void OnPaint(PaintEventArgs e) {
    Graphics g = e.Graphics;
    e.Graphics.FillRectangle(new SolidBrush(Color.White), ClientRectangle);
    g.DrawString("Hello World", this.Font, new SolidBrush(Color.Black), 10,10);
}
</Tab>

<Tab Name="VB">
Protected Overrides Sub OnPaint(e As PaintEventArgs)
    Dim g As Graphics = e.Graphics
    e.Graphics.FillRectangle(New SolidBrush(Color.White), ClientRectangle)
    g.DrawString("Hello World", Me.Font, New SolidBrush(Color.Black), 10,10)
End Sub
</Tab>

</Acme:TabControl><p>

<p>Because <b>DrawString</b> takes a brush, it is possible to render text using any brush. This includes a
texture brush. For instance, the following code renders the text with a marbled effect and a
background shadow.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
protected override void OnPaint(PaintEventArgs e) {
    TextureBrush titleBrush = new TextureBrush(new Bitmap("marble.jpg"));
    TextureBrush backgroundBrush = new TextureBrush(new Bitmap("colorbars.jpg"));
    SolidBrush titleShadowBrush = new SolidBrush(Color.FromArgb(70, Color.Black));
    Font titleFont = new Font("Lucida Sans Unicode", 60);
    string titleText = "Graphics  Samples";

    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias;
    e.Graphics.FillRectangle(backgroundBrush, ClientRectangle);
    e.Graphics.FillRectangle(new SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle);

    e.Graphics.DrawString(titleText, titleFont, titleShadowBrush, 15, 15);
    e.Graphics.DrawString(titleText, titleFont, titleBrush, 10, 10);

}
</Tab>

<Tab Name="VB">
Protected Overrides Sub OnPaint(e As PaintEventArgs)
    Dim titleBrush As New TextureBrush(New Bitmap("marble.jpg"))
    Dim backgroundBrush As New TextureBrush(New Bitmap("colorbars.jpg"))
    Dim titleShadowBrush As New SolidBrush(Color.FromArgb(70, Color.Black))
    Dim titleFont As New Font("Lucida Sans Unicode", 60)
    Dim titleText As String = "Graphics  Samples"

    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias
    e.Graphics.FillRectangle(backgroundBrush, ClientRectangle)
    e.Graphics.FillRectangle(New SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle)

    e.Graphics.DrawString(titleText, titleFont, titleShadowBrush, 15, 15)
    e.Graphics.DrawString(titleText, titleFont, titleBrush, 10, 10)

End Sub
</Tab>

</Acme:TabControl><p>

<p>If you supply <b>DrawString</b> with a <b>Rectangle</b>, the text will wrap to fit in the rectangle.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
protected override void OnPaint(PaintEventArgs e) {
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias;
    e.Graphics.FillRectangle(new SolidBrush(Color.White), ClientRectangle);

    Font textFont = new Font("Lucida Sans Unicode", 12);
    RectangleF rectangle = new RectangleF(100, 100, 250, 350);
    e.Graphics.FillRectangle(new SolidBrush(Color.Gainsboro), rectangle);
    string flowedText="Simplicity and power: Windows Forms is a programming model for\n"
        + "developing Windows applications that combines the simplicity of the Visual\n"
        + "Basic 6.0 programming model with the power and flexibility of the common\n"
        + "language runtime.\n"
        + "Lower total cost of ownership: Windows Forms takes advantage of the versioning and\n"
        + "deployment features of the common language runtime to offer reduced deployment\n"
        + "costs and higher application robustness over time. This significantly lowers the\n"
        + "maintenance costs (TCO) for applications\n"
        + "written in Windows Forms.\n"
        + "Architecture for controls: Windows Forms offers an architecture for\n"
        + "controls and control containers that is based on concrete implementation of the\n"
        + "control and container classes. This significantly reduces\n"
        + "control-container interoperability issues.\n";
    e.Graphics.DrawString(flowedText, textFont, new SolidBrush(Color.Blue), rectangle);
}
</Tab>

<Tab Name="VB">
Protected Overrides Sub OnPaint(e As PaintEventArgs)
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias
    e.Graphics.FillRectangle(New SolidBrush(Color.White), ClientRectangle)

    Dim textFont As New Font("Lucida Sans Unicode", 12)
    Dim rectangle As New RectangleF(100, 100, 250, 350)
    e.Graphics.FillRectangle(New SolidBrush(Color.Gainsboro), rectangle)
    Dim flowedText As String ="Simplicity and power: Windows Forms is a programming model for" &amp; ControlChars.CrLf _
        &amp; "developing Windows applications that combines the simplicity of the Visual" &amp; ControlChars.CrLf _
        &amp; "Basic 6.0 programming model with the power and flexibility of the common" &amp; ControlChars.CrLf _
        &amp; "language runtime." &amp; ControlChars.CrLf _
        &amp; "Lower total cost of ownership: Windows Forms takes advantage of the versioning and" &amp; ControlChars.CrLf _
        &amp; "deployment features of the common language runtime to offer reduced deployment" &amp; ControlChars.CrLf _
        &amp; "costs and higher application robustness over time. This significantly lowers the" &amp; ControlChars.CrLf _
        &amp; "maintenance costs (TCO) for applications" &amp; ControlChars.CrLf _
        &amp; "written in Windows Forms." &amp; ControlChars.CrLf _
        &amp; "Architecture for controls: Windows Forms offers an architecture for" &amp; ControlChars.CrLf _
        &amp; "controls and control containers that is based on concrete implementation of the" &amp; ControlChars.CrLf _
        &amp; "control and container classes. This significantly reduces" &amp; ControlChars.CrLf _
        &amp; "control-container interoperability issues." &amp; ControlChars.CrLf
    e.Graphics.DrawString(flowedText, textFont, New SolidBrush(Color.Blue), rectangle)
End Sub
</Tab>

</Acme:TabControl><p>

<p>You can control how the text is drawn by using the <b>StringFormat</b> object. For instance, the
following code allows you to draw text that is centered in a particular area.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
protected override void OnPaint(PaintEventArgs e) {
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias;
    e.Graphics.FillRectangle(new SolidBrush(Color.White), ClientRectangle);

    Font textFont = new Font("Lucida Sans Unicode", 8);
    RectangleF rectangle = new RectangleF(100, 100, 250, 350);
    e.Graphics.FillRectangle(new SolidBrush(Color.Gainsboro), rectangle);
    StringFormat format = new StringFormat();
    format.Alignment=StringAlignment.Center;
    string flowedText="Simplicity and power: Windows Forms is a programming model for\n"
        + "developing Windows applications that combines the simplicity of the Visual\n"
        + "Basic 6.0 programming model with the power and flexibility of the common\n"
        + "language runtime.\n"
        + "Lower total cost of ownership: Windows Forms takes advantage of the versioning and\n"
        + "deployment features of the common language runtime to offer reduced deployment\n"
        + "costs and higher application robustness over time. This significantly lowers the\n"
        + "maintenance costs (TCO) for applications\n"
        + "written in Windows Forms.\n"
        + "Architecture for controls: Windows Forms offers an architecture for\n"
        + "controls and control containers that is based on concrete implementation of the\n"
        + "control and container classes. This significantly reduces\n"
        + "control-container interoperability issues.\n";
    e.Graphics.DrawString(flowedText, textFont, new SolidBrush(Color.Blue), rectangle,format);
}
</Tab>

<Tab Name="VB">
Protected Overrides Sub OnPaint(e As PaintEventArgs)
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias
    e.Graphics.FillRectangle(New SolidBrush(Color.White), ClientRectangle)

    Dim textFont As New Font("Lucida Sans Unicode", 8)
    Dim rectangle As New RectangleF(100, 100, 250, 350)
    e.Graphics.FillRectangle(new SolidBrush(Color.Gainsboro), rectangle)
    Dim format As New StringFormat()
    format.Alignment = StringAlignment.Center
    Dim flowedText As String ="Simplicity and power: Windows Forms is a programming model for" &amp; ControlChars.CrLf _
        &amp; "developing Windows applications that combines the simplicity of the Visual" &amp; ControlChars.CrLf _
        &amp; "Basic 6.0 programming model with the power and flexibility of the common" &amp; ControlChars.CrLf _
        &amp; "language runtime." &amp; ControlChars.CrLf _
        &amp; "Lower total cost of ownership: Windows Forms takes advantage of the versioning and" &amp; ControlChars.CrLf _
        &amp; "deployment features of the common language runtime to offer reduced deployment" &amp; ControlChars.CrLf _
        &amp; "costs and higher application robustness over time. This significantly lowers the" &amp; ControlChars.CrLf _
        &amp; "maintenance costs (TCO) for applications" &amp; ControlChars.CrLf _
        &amp; "written in Windows Forms." &amp; ControlChars.CrLf _
        &amp; "Architecture for controls: Windows Forms offers an architecture for" &amp; ControlChars.CrLf _
        &amp; "controls and control containers that is based on concrete implementation of the" &amp; ControlChars.CrLf _
        &amp; "control and container classes. This significantly reduces" &amp; ControlChars.CrLf _
        &amp; "control-container interoperability issues." &amp; ControlChars.CrLf
    e.Graphics.DrawString(flowedText, textFont, New SolidBrush(Color.Blue), rectangle,format)
End Sub
</Tab>

</Acme:TabControl><p>

<p>If you want to find out how long a string will be when it is drawn, you can use <b>MeasureString</b>.
For instance, to center a string on a form, use the following code.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
protected override void OnPaint(PaintEventArgs e) {
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias;
    e.Graphics.FillRectangle(new SolidBrush(Color.White), ClientRectangle);

    string textToDraw="Hello Symetrical World";

    Font textFont = new Font("Lucida Sans Unicode", 8);
    float windowCenter=this.DisplayRectangle.Width/2;
    SizeF stringSize=e.Graphics.MeasureString(textToDraw, textFont);
    float startPos=windowCenter-(stringSize.Width/2);

    e.Graphics.DrawString(textToDraw, textFont, new SolidBrush(Color.Blue), startPos, 40);
}
</Tab>

<Tab Name="VB">
Protected Overrides Sub OnPaint(e As PaintEventArgs)
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias
    e.Graphics.FillRectangle(new SolidBrush(Color.White), ClientRectangle)

    Dim textToDraw As String ="Hello Symetrical World"

    Dim textFont As New Font("Lucida Sans Unicode", 8)
    Dim windowCenter As Double = this.DisplayRectangle.Width/2
    Dim stringSize As SizeF = e.Graphics.MeasureString(textToDraw, textFont)
    Dim startPos As Double = windowCenter-(stringSize.Width/2)

    e.Graphics.DrawString(textToDraw, textFont, new SolidBrush(Color.Blue), startPos, 40)
End Sub
</Tab>

</Acme:TabControl><p>
<p><b>MeasureString</b> can also be used to determine how many lines and characters will be rendered. For
instance, we can determine how many lines and characters
will be rendered in the previous flowed text example.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
protected override void OnPaint(PaintEventArgs e) {
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias;
    e.Graphics.FillRectangle(new SolidBrush(Color.White), ClientRectangle);

    Font textFont = new Font("Lucida Sans Unicode", 12);
    RectangleF rectangle = new RectangleF(100, 100, 250, 350);
    int lines;
    int characters;
    string flowedText="Simplicity and power: Windows Forms is a programming model for\n"
        + "developing Windows applications that combines the simplicity of the Visual\n"
        + "Basic 6.0 programming model with the power and flexibility of the common\n"
        + "language runtime.\n"
        + "Lower total cost of ownership: Windows Forms takes advantage of the versioning and\n"
        + "deployment features of the common language runtime to offer reduced deployment\n"
        + "costs and higher application robustness over time. This significantly lowers the\n"
        + "maintenance costs (TCO) for applications\n"
        + "written in Windows Forms.\n"
        + "Architecture for controls: Windows Forms offers an architecture for\n"
        + "controls and control containers that is based on concrete implementation of the\n"
        + "control and container classes. This significantly reduces\n"
        + "control-container interoperability issues.\n";
    string whatRenderedText;

    e.Graphics.FillRectangle(new SolidBrush(Color.Gainsboro), rectangle);

    e.Graphics.MeasureString(flowedText, textFont, rectangle.Size,
                    new StringFormat(), out characters, out lines);
    whatRenderedText="We printed " + characters + " characters and " + lines + " lines";

    e.Graphics.DrawString(flowedText, textFont, new SolidBrush(Color.Blue), rectangle);

    e.Graphics.DrawString(whatRenderedText, this.Font, new SolidBrush(Color.Black), 10,10);
}
</Tab>

<Tab Name="VB">
Protected Overrides Sub OnPaint(e As PaintEventArgs)
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias
    e.Graphics.FillRectangle(new SolidBrush(Color.White), ClientRectangle)

    Dim textFont As New Font("Lucida Sans Unicode", 12)
    Dim rectangle As New RectangleF(100, 100, 250, 350)
    Dim lines As Integer
    Dim characters As Integer
    Dim flowedText As String ="Simplicity and power: Windows Forms is a programming model for" &amp; ControlChars.CrLf _
        &amp; "developing Windows applications that combines the simplicity of the Visual" &amp; ControlChars.CrLf _
        &amp; "Basic 6.0 programming model with the power and flexibility of the common" &amp; ControlChars.CrLf _
        &amp; "language runtime." &amp; ControlChars.CrLf _
        &amp; "Lower total cost of ownership: Windows Forms takes advantage of the versioning and" &amp; ControlChars.CrLf _
        &amp; "deployment features of the common language runtime to offer reduced deployment" &amp; ControlChars.CrLf _
        &amp; "costs and higher application robustness over time. This significantly lowers the" &amp; ControlChars.CrLf _
        &amp; "maintenance costs (TCO) for applications" &amp; ControlChars.CrLf _
        &amp; "written in Windows Forms." &amp; ControlChars.CrLf _
        &amp; "Architecture for controls: Windows Forms offers an architecture for" &amp; ControlChars.CrLf _
        &amp; "controls and control containers that is based on concrete implementation of the" &amp; ControlChars.CrLf _
        &amp; "control and container classes. This significantly reduces" &amp; ControlChars.CrLf _
        &amp; "control-container interoperability issues." &amp; ControlChars.CrLf
    Dim whatRenderedText As String

    e.Graphics.FillRectangle(New SolidBrush(Color.Gainsboro), rectangle)

    e.Graphics.MeasureString(flowedText, textFont, rectangle.Size, _
                    new StringFormat(), characters, lines)
    whatRenderedText = "We printed " &amp; characters &amp; " characters and " &amp; lines &amp; " lines"

    e.Graphics.DrawString(flowedText, textFont, New SolidBrush(Color.Blue), rectangle)

    e.Graphics.DrawString(whatRenderedText, Me.Font, New SolidBrush(Color.Black), 10,10)
End Sub
</Tab>

</Acme:TabControl><p>
<p>GDI+ has full Unicode support. This means that it is possible to render text in any
language. For instance, the following code draws a string in Japanese (you must
have the Japanese language pack installed).</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
protected override void OnPaint(PaintEventArgs e) {
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias;
    e.Graphics.FillRectangle(new SolidBrush(Color.White), ClientRectangle);

    try {
        Font japaneseFont = new Font("MS Mincho", 32);
        string japaneseText = new string(new char[] {(char)31169, (char)12398, (char)21517,
                    (char)21069, (char)12399, (char)12463, (char)12522, (char)12473,
                    (char)12391, (char)12377, (char)12290});

        e.Graphics.DrawString(japaneseText, japaneseFont, new SolidBrush(Color.Blue), 20, 40);
    } catch (Exception ex) {
         MessageBox.Show("You need to install the Japanese language pack to run this sample");
         Application.Exit();
    }
}
</Tab>

<Tab Name="VB">
Protected Overrides Sub OnPaint(e As PaintEventArgs)
    e.Graphics.TextRenderingHint = TextRenderingHint.AntiAlias
    e.Graphics.FillRectangle(new SolidBrush(Color.White), ClientRectangle)

    Try
        Dim japaneseFont As New Font("MS Mincho", 32)
        Dim japaneseText As New String(new char() {CType(31169, Char), CType(12398, Char), _
                    CType(21517, Char), CType(21069, Char), CType(12399, Char), _
                    CType(12463, Char), CType(12522, Char), CType(12473, Char), _
                    CType(12391, Char), CType(12377, Char), CType(12290, Char)})
        e.Graphics.DrawString(japaneseText, japaneseFont, new SolidBrush(Color.Blue), 20, 40)
    Catch ex As Exception
         MessageBox.Show("You need to install the Japanese language pack to run this sample")
         Application.Exit()
    End Try
End Sub
</Tab>

</Acme:TabControl><p>

<br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/GDIPlus/Text/CS"
        ViewSource="/quickstart/winforms/Samples/GDIPlus/Text/Text.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Text Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/GDIPlus/Text/VB"
        ViewSource="/quickstart/winforms/Samples/GDIPlus/Text/Text.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Text Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<a name="Using images">
<span class="subhead">Using Images</span>
<p>GDI+ has full support for a range of image formats, including .jpeg, .png, .gif, .bmp, .tiff, .exif, and .icon files.</p>
<p>Rendering an image is simple. For instance, the following renders a .jpeg image.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
protected override void OnPaint(PaintEventArgs e) {
    e.Graphics.FillRectangle(new SolidBrush(Color.White), ClientRectangle);
    e.Graphics.DrawImage(new Bitmap("sample.jpg"), 29, 20, 283, 212);
}
</Tab>

<Tab Name="VB">
Protected Overrides Sub OnPaint(e As PaintEventArgs)
    e.Graphics.FillRectangle(New SolidBrush(Color.White), ClientRectangle)
    e.Graphics.DrawImage(New Bitmap("sample.jpg"), 29, 20, 283, 212)
End Sub
</Tab>

</Acme:TabControl><p>

<p>Using a a bitmap as a rendering surface is also simple. The following code renders
some text and lines to a bitmap, and then saves the bitmap to disk as a .png file.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
Bitmap newBitmap = new Bitmap(800,600,PixelFormat.Format32bppArgb);
Graphics g = Graphics.FromImage(newBitmap);
g.FillRectangle(new SolidBrush(Color.White), new Rectangle(0,0,800,600));

Font textFont = new Font("Lucida Sans Unicode", 12);
RectangleF rectangle = new RectangleF(100, 100, 250, 350);
int lines;
int characters;
string flowedText="Simplicity and power: Windows Forms is a programming model for\n"
    + "developing Windows applications that combines the simplicity of the Visual\n"
    + "Basic 6.0 programming model with the power and flexibility of the common\n"
    + "language runtime.\n"
    + "Lower total cost of ownership: Windows Forms takes advantage of the versioning and\n"
    + "deployment features of the common language runtime to offer reduced deployment\n"
    + "costs and higher application robustness over time. This significantly lowers the\n"
    + "maintenance costs (TCO) for applications\n"
    + "written in Windows Forms.\n"
    + "Architecture for controls: Windows Forms offers an architecture for\n"
    + "controls and control containers that is based on concrete implementation of the\n"
    + "control and container classes. This significantly reduces\n"
    + "control-container interoperability issues.\n";

g.FillRectangle(new SolidBrush(Color.Gainsboro), rectangle);
g.DrawString(flowedText, textFont, new SolidBrush(Color.Blue), rectangle);
Pen penExample = new Pen(Color.FromArgb(150, Color.Purple), 20);
penExample.DashStyle = DashStyle.Dash;
penExample.StartCap = LineCap.Round;
penExample.EndCap = LineCap.Round;
g.DrawCurve(penExample, new Point[] {
            new Point(200, 140),
            new Point(700, 240),
            new Point(500, 340),
            new Point(140, 140),
            new Point(40, 340),
});

newBitmap.Save("TestImage.png", ImageFormat.Png) ;
</Tab>

<Tab Name="VB">
Dim newBitmap As New Bitmap(800,600,PixelFormat.Format32bppArgb)
Dim g As Graphics = Graphics.FromImage(newBitmap)
g.FillRectangle(New SolidBrush(Color.White), new Rectangle(0,0,800,600))

Dim textFont As New Font("Lucida Sans Unicode", 12)
Dim rectangle As New RectangleF(100, 100, 250, 350)
Dim Lines As Integer
Dim Characters As Integer
Dim flowedText As String ="Simplicity and power: Windows Forms is a programming model for" &amp; ControlChars.CrLf _
    &amp; "developing Windows applications that combines the simplicity of the Visual" &amp; ControlChars.CrLf _
    &amp; "Basic 6.0 programming model with the power and flexibility of the common" &amp; ControlChars.CrLf _
    &amp; "language runtime." &amp; ControlChars.CrLf _
    &amp; "Lower total cost of ownership: Windows Forms takes advantage of the versioning and" &amp; ControlChars.CrLf _
    &amp; "deployment features of the common language runtime to offer reduced deployment" &amp; ControlChars.CrLf _
    &amp; "costs and higher application robustness over time. This significantly lowers the" &amp; ControlChars.CrLf _
    &amp; "maintenance costs (TCO) for applications" &amp; ControlChars.CrLf _
    &amp; "written in Windows Forms." &amp; ControlChars.CrLf _
    &amp; "Architecture for controls: Windows Forms offers an architecture for" &amp; ControlChars.CrLf _
    &amp; "controls and control containers that is based on concrete implementation of the" &amp; ControlChars.CrLf _
    &amp; "control and container classes. This significantly reduces" &amp; ControlChars.CrLf _
    &amp; "control-container interoperability issues." &amp; ControlChars.CrLf

g.FillRectangle(new SolidBrush(Color.Gainsboro), rectangle)
g.DrawString(flowedText, textFont, new SolidBrush(Color.Blue), rectangle)
Dim penExample As New Pen(Color.FromArgb(150, Color.Purple), 20)
penExample.DashStyle = DashStyle.Dash
penExample.StartCap = LineCap.Round
penExample.EndCap = LineCap.Round
g.DrawCurve(penExample, new Point() { _
            new Point(200, 140), _
            new Point(700, 240), _
            new Point(500, 340), _
            new Point(140, 140), _
            new Point(40, 340), _
})

newBitmap.Save("TestImage.png", ImageFormat.Png)
</Tab>

</Acme:TabControl><p>

<br><br>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/GDIPlus/Images/CS"
        ViewSource="/quickstart/winforms/Samples/GDIPlus/Images/Images.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Image Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/GDIPlus/Images/VB"
        ViewSource="/quickstart/winforms/Samples/GDIPlus/Images/Images.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Image Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<a name="Other information">
<span class="subhead">Other Information</span>
<p>
<span class="subhead">Standard Pens and Brushes</span>
<p>The <b>Pen</b> and <b>Brush</b> classes include a set of standard solid pens and brushes for all of the
known colors.
<span class="subhead">Anti-Aliasing</span>
Setting <b>Graphics.SmoothingMode</b> to <b>SmoothingMode.AntiAlias</b> will result in sharper text and graphics.
<span class="subhead">Scope of the Graphics Object</span>
The graphics object that is contained in the arguments to the <b>Paint</b> event (<b>PaintEventArgs</b>)
is disposed upon return from the <b>Paint</b> event handler. Therefore, you should not keep a reference
to this <b>Graphics</b> object that has scope outside the <b>Paint</b> event. Attempting to use this
<b>Graphics</b> object outside the <b>Paint</b> event will have unpredictable results.
<span class="subhead">Handling Resize</span>
<p>By default, the <b>Paint</b> event is not raised when a control or form is resized. If you
want the <b>Paint</b> event to be raised when a form is resized, you need to set the
control style appropriately.</p>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
public MyForm() {
    SetStyle(ControlStyles.ResizeRedraw,true);
}
</Tab>

<Tab Name="VB">
Public Sub MyForm()
    SetStyle(ControlStyles.ResizeRedraw,True)
End Sub
</Tab>

</Acme:TabControl><p>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
