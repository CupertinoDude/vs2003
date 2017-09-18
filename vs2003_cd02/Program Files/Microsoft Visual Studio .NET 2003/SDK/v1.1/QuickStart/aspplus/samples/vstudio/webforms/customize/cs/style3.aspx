<%@ Page CodeBehind="style3.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="Customize.Cs.style3" %>

<html>
<body>

  <form runat="server">

      <h3><font face="verdana">Programmatically Accessing Styles</font></h3>

      <div style="BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 10px; BORDER-TOP: black 1px solid; PADDING-LEFT: 10px; PADDING-BOTTOM: 25px; FONT: 8pt verdana; BORDER-LEFT: black 1px solid; PADDING-TOP: 1px; BORDER-BOTTOM: black 1px solid; BACKGROUND-COLOR: #cccccc">
          <span id="Message" EnableViewState="false" runat="server"></span>
          <p>
          Select a color for the span: <p>
          <select id="ColorSelect" style="FONT: 700 11pt verdana" runat="server">
            <option selected>red</option>
            <option>green</option>
            <option>blue</option>
          </select>
          <input type="submit" id="SubmitBtn" runat="server" Value="Change Style"></p>
      </div>

      <p><font face="verdana"><h4>Styled Span</h4></font><p>

      <span id="MySpan" style="FONT: 700 12pt verdana; color: orange" runat="server">
          This is some literal text inside a styled span control
      </span>

      <p><font face="verdana"><h4>Styled Button</h4></font><p>

      <button id="MyButton" style="BORDER-LEFT-COLOR: black; BORDER-BOTTOM-COLOR: black; FONT: 8pt verdana; WIDTH: 100px; BORDER-TOP-COLOR: black; BACKGROUND-COLOR: lightgreen; BORDER-RIGHT-COLOR: black" runat="server" type=button>Click me!</button>

      <p><font face="verdana"><h4>Styled Text Input</h4></font><p>

      Enter some text: <p>
      <input id="MyText" type="text" value="One, Two, Three" style="BORDER-LEFT-COLOR: red; BORDER-BOTTOM-COLOR: red; FONT: 14pt verdana; width: 300px; BORDER-TOP-STYLE: dashed; BORDER-TOP-COLOR: red; BORDER-RIGHT-STYLE: dashed; BORDER-LEFT-STYLE: dashed; BACKGROUND-COLOR: yellow; BORDER-RIGHT-COLOR: red; BORDER-BOTTOM-STYLE: dashed" runat="server">

      <p><font face="verdana"><h4>Styled Select Input</h4></font><p>

      Select an item: <p>
      <select id="MySelect" style="FONT: 14pt verdana; COLOR: purple; BACKGROUND-COLOR: lightblue" runat="server">
        <option selected>Item 1</option>
        <option>Item 2</option>
        <option>Item 3</option>
      </select>

      <p><font face="verdana"><h4>Styled Radio Buttons</h4></font><p>

      Select an option: <p>
      <span style="FONT: 300 16pt verdana">
          <input id="MyRadio1" type="radio" name="Mode" checked style="WIDTH:50px;ZOOM:200%;BACKGROUND-COLOR:red" runat="server">Option 1<br>
          <input id="MyRadio2" type="radio" name="Mode" style="WIDTH:50px;ZOOM:200%;BACKGROUND-COLOR:red" runat="server">Option 2<br>
          <input id="MyRadio3" type="radio" name="Mode" style="WIDTH:50px;ZOOM:200%;BACKGROUND-COLOR:red" runat="server">Option 3
      </span>

    </form>
    
</body>
</html>
