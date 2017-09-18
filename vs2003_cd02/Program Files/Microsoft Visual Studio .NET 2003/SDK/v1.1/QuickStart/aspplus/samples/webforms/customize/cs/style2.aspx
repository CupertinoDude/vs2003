<%@ Page Language="C#" %>

<html>
<head>

  <style>

      .spanstyle   
      { 
          font: 12pt verdana; 
          font-weight:700;
          color:orange;
      }

      .buttonstyle 
      { 
          font: 8pt verdana;
          background-color:lightgreen;
          border-color:black;
          width:100 
      }
      .inputstyle  
      { 
          font: 14pt verdana;
          background-color:yellow;
          border-style:dashed;
          border-color:red;
          width:300; 
      }
      .selectstyle 
      { 
          font: 14pt verdana;
          background-color:lightblue;
          color:purple; 
      }
      .radiostyle  
      { 
          width:50;
          background-color:red;
          zoom:200% 
      }

  </style>


</head>
<body>

  <h3><font face="verdana">Applying Styles to HTML Controls</font></h3>

  <p><font face="verdana"><h4>Styled Span</h4></font><p>

  <span class="spanstyle" runat="server">
      This is some literal text inside a styled span control
  </span>

  <p><font face="verdana"><h4>Styled Button</h4></font><p>

  <button class="buttonstyle" runat="server">Click me!</button>

  <p><font face="verdana"><h4>Styled Text Input</h4></font><p>

  Enter some text: <p>
  <input type="text" value="One, Two, Three" class="inputstyle" runat="server"/>

  <p><font face="verdana"><h4>Styled Select Input</h4></font><p>

  Select an item: <p>
  <select class="selectstyle" runat="server">
    <option>Item 1</option>
    <option>Item 2</option>
    <option>Item 3</option>
  </select>

  <p><font face="verdana"><h4>Styled Radio Buttons</h4></font><p>

  Select an option: <p>
  <span style="font: 16 pt verdana;font-weight:300">
  <input type="radio" name="Mode" checked class="radiostyle" runat="server"/>Option 1<br>
  <input type="radio" name="Mode" class="radiostyle" runat="server"/>Option 2<br>
  <input type="radio" name="Mode" class="radiostyle" runat="server"/>Option 3
  </span>

</body>
</html>
