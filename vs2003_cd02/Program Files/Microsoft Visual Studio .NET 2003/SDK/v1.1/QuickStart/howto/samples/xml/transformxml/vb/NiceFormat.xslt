<xsl:stylesheet version="1.0" exclude-result-prefixes="msxsl local" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:local="#local-functions"><!-- [XSL-XSLT] Updated namespace, added the required version attribute, and added namespaces necessary for script extensions. -->
	<!-- [XSL-XSLT] Explicitly apply the default (and only) indent-result behavior -->
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
	<!-- [XSL-XSLT] Simulate lack of built-in templates -->
	<xsl:template match="@*|/|node()"/>
	<xsl:template match="/">
		<HTML xmlns:xsl="http://www.w3.org/TR/WD-xsl">
			<HEAD>
				<TITLE><xsl:value-of select="doc/assembly/name" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:value-of></TITLE>
				<LINK rel="" type="" href=""></LINK>
			</HEAD>
			<BODY>
				<xsl:apply-templates select="doc/members/member" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:apply-templates>
			</BODY>
		</HTML>
	</xsl:template>
	<xsl:template match="member">
		<xsl:choose>
			<xsl:when test="local:expr_IDADBAT(.)">
				<h1 xmlns:xsl="http://www.w3.org/TR/WD-xsl"><!-- [XSL-XSLT] Converted xsl:eval to xsl:value-of --><xsl:value-of select="local:eval_IDAHBAT(.)" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></h1>
				<xsl:apply-templates select="summary"></xsl:apply-templates>
				<xsl:apply-templates select="remarks"></xsl:apply-templates>
				<xsl:apply-templates select="example"></xsl:apply-templates>
				<xsl:if test="seealso">
					<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">See Also</h4>
					<xsl:apply-templates select="seealso"></xsl:apply-templates>
				</xsl:if>
			</xsl:when>
			<xsl:when test="local:expr_IDA2BAT(.)">
				<h2 xmlns:xsl="http://www.w3.org/TR/WD-xsl"><!-- [XSL-XSLT] Converted xsl:eval to xsl:value-of --><xsl:value-of select="local:eval_IDAACAT(.)" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/> method</h2>
				<xsl:apply-templates select="summary"></xsl:apply-templates>
				<xsl:if test="param">
					<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">Parameters</h4>
					<dl xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates select="param" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:apply-templates></dl>
				</xsl:if>
				<xsl:apply-templates select="returns"></xsl:apply-templates>
				<xsl:if test="exception">
					<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">Exceptions</h4>
					<dl xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates select="exception" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:apply-templates></dl>
				</xsl:if>
				<xsl:apply-templates select="remarks"></xsl:apply-templates>
				<xsl:apply-templates select="example"></xsl:apply-templates>
				<xsl:if test="seealso">
					<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">See Also</h4>
					<xsl:apply-templates select="seealso"></xsl:apply-templates>
				</xsl:if>
			</xsl:when>
			<xsl:when test="local:expr_IDANDAT(.)">
				<h2 xmlns:xsl="http://www.w3.org/TR/WD-xsl"><!-- [XSL-XSLT] Converted xsl:eval to xsl:value-of --><xsl:value-of select="local:eval_IDARDAT(.)" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/> property</h2>
				<xsl:apply-templates select="summary"></xsl:apply-templates>
				<xsl:if test="param">
					<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">Parameters</h4>
					<dl xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates select="param" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:apply-templates></dl>
				</xsl:if>
				<xsl:apply-templates select="value"></xsl:apply-templates>
				<xsl:if test="exception">
					<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">Exceptions</h4>
					<dl xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates select="exception" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:apply-templates></dl>
				</xsl:if>
				<xsl:apply-templates select="remarks"></xsl:apply-templates>
				<xsl:apply-templates select="example"></xsl:apply-templates>
				<xsl:if test="seealso">
					<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">See Also</h4>
					<xsl:apply-templates select="seealso"></xsl:apply-templates>
				</xsl:if>
			</xsl:when>
			<xsl:when test="local:expr_IDA4EAT(.)">
				<h2 xmlns:xsl="http://www.w3.org/TR/WD-xsl"><!-- [XSL-XSLT] Converted xsl:eval to xsl:value-of --><xsl:value-of select="local:eval_IDACFAT(.)" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/> field</h2>
				<xsl:apply-templates select="summary"></xsl:apply-templates>
				<xsl:apply-templates select="value"></xsl:apply-templates>
				<xsl:apply-templates select="remarks"></xsl:apply-templates>
				<xsl:apply-templates select="example"></xsl:apply-templates>
				<xsl:if test="seealso">
					<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">See Also</h4>
					<xsl:apply-templates select="seealso"></xsl:apply-templates>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="overload"><h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">Overload</h4><p xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></p></xsl:template>
	<xsl:template match="summary"><p xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></p></xsl:template>
	<xsl:template match="param">
		<dt xmlns:xsl="http://www.w3.org/TR/WD-xsl"><i><xsl:value-of select="@name" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:value-of></i></dt>
		<dd xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></dd>
	</xsl:template>
	<xsl:template match="value">
		<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">Value</h4>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="returns">
		<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">Returns</h4>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="exception">
		<dt xmlns:xsl="http://www.w3.org/TR/WD-xsl"><i><!-- [XSL-XSLT] Converted xsl:eval to xsl:value-of --><xsl:value-of select="local:eval_IDAJHAT(.)" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></i></dt>
		<dd xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></dd>
	</xsl:template>
	<xsl:template match="remarks">
		<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">Remarks</h4>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="example">
		<h4 xmlns:xsl="http://www.w3.org/TR/WD-xsl">Example</h4>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="seealso">
		<a xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:attribute name="href" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:value-of select="@cref"></xsl:value-of></xsl:attribute><!-- [XSL-XSLT] Converted xsl:eval to xsl:value-of --><xsl:value-of select="local:eval_IDAKQAT(.)" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></a> 
</xsl:template>
	<xsl:template match="text()"><xsl:value-of select="."></xsl:value-of></xsl:template>
	<xsl:template match="para"><p xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></p></xsl:template>
	<xsl:template match="code"><pre xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:value-of select="." xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:value-of></pre></xsl:template>
	<xsl:template match="see">
		<xsl:if test="@langword">
			<b xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:value-of select="@langword" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:value-of></b>
		</xsl:if>
		<xsl:if test="@cref">
			<a xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:attribute name="href" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:value-of select="@cref"></xsl:value-of></xsl:attribute><!-- [XSL-XSLT] Converted xsl:eval to xsl:value-of --><xsl:value-of select="local:eval_IDAORAT(.)" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></a>
		</xsl:if>
		<xsl:if test="@href">
			<a xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:attribute name="href" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:value-of select="@cref"></xsl:value-of></xsl:attribute><!-- [XSL-XSLT] Converted xsl:eval to xsl:value-of --><xsl:value-of select="local:eval_IDAZRAT(.)" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></a>
		</xsl:if>
	</xsl:template>
	<xsl:template match="list">
		<xsl:if test="@type[.='bullet']">
			<ul xmlns:xsl="http://www.w3.org/TR/WD-xsl">
				<xsl:for-each select="item" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<xsl:for-each select="term"><li xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></li></xsl:for-each>
				</xsl:for-each>
			</ul>
		</xsl:if>
		<xsl:if test="@type[.='number']">
			<ol xmlns:xsl="http://www.w3.org/TR/WD-xsl">
				<xsl:for-each select="item" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<xsl:for-each select="term"><li xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></li></xsl:for-each>
				</xsl:for-each>
			</ol>
		</xsl:if>
		<xsl:if test="@type[.='table']">
			<table xmlns:xsl="http://www.w3.org/TR/WD-xsl">
				<xsl:for-each select="listheader" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<xsl:for-each select="term"><td xmlns:xsl="http://www.w3.org/TR/WD-xsl"><b><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></b></td></xsl:for-each>
					<xsl:for-each select="description"><td xmlns:xsl="http://www.w3.org/TR/WD-xsl"><b><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></b></td></xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="item" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<tr xmlns:xsl="http://www.w3.org/TR/WD-xsl">
						<xsl:for-each select="term" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><td xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></td></xsl:for-each>
						<xsl:for-each select="description" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><td xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></td></xsl:for-each>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template match="c"><code xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:apply-templates xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/></code></xsl:template>
	<xsl:template match="paramref"><i xmlns:xsl="http://www.w3.org/TR/WD-xsl"><xsl:value-of select="@name" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"></xsl:value-of></i></xsl:template>
	<msxsl:script implements-prefix="local"><![CDATA[
  
    // ******************************************************* //
    // **  xsl:script                                          //
    // **                                                      //
    // **  functions converted from xsl:script blocks          //
    // ******************************************************* //
    
  
function isType(node) {
    return node.getAttribute("name").charAt(0) == 'T';
}

function isMethod(node) {
    return node.getAttribute("name").charAt(0) == 'M';
}

function isProperty(node) {
    return node.getAttribute("name").charAt(0) == "P";
}

function isField(node) {
    return node.getAttribute("name").charAt(0) == "F";
}

function crefName(node) {
    return node.getAttribute("cref").substr(2);
}

function fullName(node) {
    return node.getAttribute("name").substr(2);
}

function isBullet(node) {
    return node.getAttribute("type")=="Bullet";
}


function memberName(node)
{
    var name = node.getAttribute("name").substr(2);
	var p = name.indexOf("#ctor");
	if (p >= 0) {
		basename = name.substr(0, p - 1);
		var params = name.substr(p + 5);
		if (params == "") params = "()";
		return basename.substr(basename.lastIndexOf(".") + 1) + params;
	}
	else {
		var p = name.indexOf("(");
		if (p == -1) p = name.length + 1;
		var basename = name.substr(0, p);
		var member = basename.substr(basename.lastIndexOf(".") + 1);
		return member + name.substr(p);
	}	
}

  
  
    // ******************************************************* //
    // **  xsl:eval                                            //
    // **                                                      //
    // **  functions representing xsl:eval statements          //
    // ******************************************************* //

    // !! Warning - "this" changed to "__this" throughout, possible undesireable consequences !!  

  
    function eval_IDAHBAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return fullName(__this)
    }
    
    
    function eval_IDAACAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return memberName(__this)
    }
    
    
    function eval_IDARDAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return memberName(__this)
    }
    
    
    function eval_IDACFAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return memberName(__this)
    }
    
    
    function eval_IDAJHAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return crefName(__this)
    }
    
    
    function eval_IDAKQAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return crefName(__this)
    }
    
    
    function eval_IDAORAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return crefName(__this)
    }
    
    
    function eval_IDAZRAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return crefName(__this)
    }
    
    
  
  
    // ******************************************************* //
    // **  expr functions                                      //
    // **                                                      //
    // **  functions representing xsl:if expr="" or            //
    // **  xsl:when expr="" statements                         //
    // ******************************************************* //

    // !! Warning - "this" changed to "__this" throughout, possible undesireable consequences !!  

  
    function expr_IDADBAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return isType(__this)
    }
    
    
    function expr_IDA2BAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return isMethod(__this)
    }
    
    
    function expr_IDANDAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return isProperty(__this)
    }
    
    
    function expr_IDA4EAT(_contextNodeList)
    {
      var __this = _contextNodeList.item(0);
      return isField(__this)
    }
    
    
    
  
    // ******************************************************* //
    // **  Boilerplate follows                                 //
    // **                                                      //
    // **  implementations of XTLRuntime functions             //
    // ******************************************************* //
    
    function absoluteChildNumber(pNode)
    {
      var n = 1;
      while (pNode = pNode.previousSibling)
        n++;
      return n;
    }
    function xtlruntime_absoluteChildNumber(pNodeList)
    {
      if (pNodeList)
        return absoluteChildNumber(pNodeList.item(0));
      else
        return "";
    }
  
    
    function ancestorChildNumber(bstrNodeName, pNode)
    {
      var a = pNode.selectSingleNode("ancestor(" + bstrNodeName + ")");
      if (a)
        return childNumber(a);
      else
        return null;
    }
    function xtlruntime_ancestorChildNumber(bstrNodeName, pNodeList)
    {
      if (pNodeList)
      {
        var n = ancestorChildNumber(bstrNodeName, pNodeList.item(0));
        if (n)
          return n;
      }
      return "";
    }
      
    function childNumber(pNode)
    {
      var n = 1;
      var name = pNode.nodeName;
      while (pNode = pNode.previousSibling)
        if (pNode.nodeName == name)
          n++;
      return n;
    }
    function xtlruntime_childNumber(pNodeList)
    {
      if (pNodeList)
        return childNumber(pNodeList.item(0));
      else
        return "";
    }

    function depth(pNode)
    {
      var n = 0;
      while (pNode = pNode.parentNode)
        n++;
      return n;
    }
    function xtlruntime_depth(pNodeList)
    {
      if (pNodeList)
        return depth(pNodeList.item(0));
      else
        return 0;
    }
    
    function formatDate(varDate, bstrFormat, varDestLocale)
    {
      var date = varDate;  
      
      var result = "";
      for (var i=0; i<bstrFormat.length; i++)
      {
        switch (bstrFormat.charAt(i)) {
        case "d":
          if (bstrFormat.charAt(i+1) == "d") {
            i++;
            if (bstrFormat.charAt(i+1) == "d") {
              i++;
              if (bstrFormat.charAt(i+1) == "d") {
                //dddd
                i++;
                var longMonthName = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
                result += longMonthName[date.getDay()];
              }
              else { //ddd
                var shortMonthName = new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");
                result += shortMonthName[date.getDay()];
              }
            }
            else //dd
               result += (date.getDate()<10 ? "0" : "") + (date.getDate());
          }
          else //dd
            result += date.getDate();
          break;
        case "M":
          if (bstrFormat.charAt(i+1) == "M") {
            i++;
            if (bstrFormat.charAt(i+1) == "M") {
              i++;
              if (bstrFormat.charAt(i+1) == "M") {
                //MMMM
                i++;
                var longMonthName = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
                result += longMonthName[date.getMonth()];
              }
              else { //MMM
                var shortMonthName = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
                result += shortMonthName[date.getMonth()];
              }
            }
            else //MM
              result += (date.getMonth()<9 ? "0" : "") + (date.getMonth() + 1);
          }
          else //M
            result += date.getMonth() + 1;
          break;
        case "y":
          if (bstrFormat.charAt(i+1) == "y") {
            i++;
            if (bstrFormat.charAt(i+1) == "y" && bstrFormat.charAt(i+2) == "y") {
              // yyyy
              i += 2;
              result += date.getFullYear();
            }
            else //yy
              result += (date.getFullYear() + "").substr(2,2);
          }
          else //y
            result += date.getFullYear() % 100;
          break;
        case "'":
          i++;
          while (bstrFormat.charAt(i) != "'" && i < bstrFormat.length)
            result += bstrFormat.charAt(i++);
          // Handle quoted quotes ('') in the literal
          if (bstrFormat.charAt(i+1) == "'")
            result += "'";
          break;
        default:
          result += bstrFormat.charAt(i);
        }
      }
      
      return result;
    }
    
    function formatIndex(lIndex, bstrFormat)
    {
      var flag = false;
      switch (bstrFormat) {
      case "1":
        return lIndex.toString();
        break;
      case "A":
      case "a":
        var n = (lIndex - 1) % 26;
        var r = Math.floor((lIndex - 1) / 26);
        var digit = String.fromCharCode(bstrFormat.charCodeAt(0) + n);
        var result = "";
        for (var i=0; i<=r; i++)
          result += digit;
        return result;
        break;
      case "i":
        flag = true;
      case "I":
        if (lIndex < 1) return null;
        switch (lIndex % 10) {
        case 0: var ones = ""; break;
        case 1: var ones = "I"; break;
        case 2: var ones = "II"; break;
        case 3: var ones = "III"; break;
        case 4: var ones = "IV"; break;
        case 5: var ones = "V"; break;
        case 6: var ones = "VI"; break;
        case 7: var ones = "VII"; break;
        case 8: var ones = "VIII"; break;
        case 9: var ones = "IX"; break;
        }
        switch (Math.floor(lIndex/10) % 10) {
        case 0: var tens = ""; break;
        case 1: var tens = "X"; break;
        case 2: var tens = "XX"; break;
        case 3: var tens = "XXX"; break;
        case 4: var tens = "XL"; break;
        case 5: var tens = "L"; break;
        case 6: var tens = "LX"; break;
        case 7: var tens = "LXX"; break;
        case 8: var tens = "LXXX"; break;
        case 9: var tens = "XC"; break;
        }
        switch (Math.floor(lIndex/100) % 10) {
        case 0: var hundreds = ""; break;
        case 1: var hundreds = "C"; break;
        case 2: var hundreds = "CC"; break;
        case 3: var hundreds = "CCC"; break;
        case 4: var hundreds = "CD"; break;
        case 5: var hundreds = "D"; break;
        case 6: var hundreds = "DC"; break;
        case 7: var hundreds = "DCC"; break;
        case 8: var hundreds = "DCCC"; break;
        case 9: var hundreds = "CM"; break;
        }
        var thousands = "MMMMMMMMM".substring(0,Math.floor(lIndex/1000) % 10);
        var digits = thousands + hundreds + tens + ones;
        if (flag)
          return digits.toLowerCase();
        else
          return digits;
        break;
      default: // 01, 001, etc.
        // No error checking done.  formatStrings like ".....1" produce some interesting results
        var n = lIndex.toString();
        var leadingZeroes = bstrFormat.substring(0, bstrFormat.length - n.length);
        return leadingZeroes + n;
        break;
      }
    }
    

    function tenToTheNth(n)
    {
      if (n == 0)
        return 1;
      else
        return 10 * tenToTheNth(n-1);
    }

    function formatNumber(number, bstrFormat)
    {
      var afterDecimal = false;
      var afterDecimalPrecision = 0;
      
      // parse the format string, building a template determining precision required for
      //  rounding, whether there is a thousands separator, and performing scaling.
      var thousandsSeparator = false;
      var afterDecimalMinPrecision = 0;
      var afterDecimalMaxPrecision = 0;
      var beforeDecimalMinPrecision = 0;
      var template = "";
      for (var i=0; i<bstrFormat.length; i++)
      {
        switch (bstrFormat.charAt(i)) {
        case "0":
          if (afterDecimal)
          {
            afterDecimalPrecision++;
            afterDecimalMinPrecision = afterDecimalPrecision;
            afterDecimalMaxPrecision = afterDecimalPrecision;
          }
          else
          {
            beforeDecimalMinPrecision++;
          }
          template += "0";
          break;
        case "#":
          if (afterDecimal)
          {
            afterDecimalPrecision++;
            afterDecimalMaxPrecision = afterDecimalPrecision;
          }
          else
          {
            if (beforeDecimalMinPrecision > 0)
              beforeDecimalMinPrecision++;
          }
          template += "#";
          break;
        case ".":
          afterDecimal = true;
          template += ".";
          break;
        case ",":
          if (afterDecimal)
            template += ",";
          else
          {
            if (bstrFormat.charAt(i+1) == "0" || bstrFormat.charAt(i+1) == "#")
              thousandsSeparator = true;
            else
              number /= 1000;
          }
          break;
        case "%":
          number *= 100;
          template += "%";
          break;          
       case '"':
          i++;
          while (bstrFormat.charAt(i) != '"' && i < bstrFormat.length)
            template += '"' + bstrFormat.charAt(i++);
          break;
        default:
          template += bstrFormat.charAt(i);
        }
      }

      // Round the number to the correct number of digits and convert it to to a string;
      number = (Math.round(number*tenToTheNth(afterDecimalMaxPrecision)))/tenToTheNth(afterDecimalMaxPrecision);
      var numberString = number + "";
      if (number < 1)
        numberString = numberString.substring(1);

      // Where is the decimal point?
      quotedTemplate = template.replace(/"\./g,'""');
      var decimalPosition = quotedTemplate.indexOf(".");
      if (decimalPosition < 0)
        decimalPosition = template.length;

      // Fill in the template starting at the decimal point and working left
      var j = numberString.indexOf(".");
      if (j < 0)
        j = numberString.length;
      var insertionPoint = 0;
      var thousands = 0;
      for (var i=decimalPosition; i >=0; i--)
      {
        if (template.charAt(i-1) != '"')
        {
          if ((template.charAt(i) == "0" || template.charAt(i) == "#") && j > 0)
          {
            template = template.substring(0,i) + numberString.charAt(--j) + template.substring(i+1);
            if (thousandsSeparator && j > 0)
            {
              thousands++;
              if (thousands > 2) {
                thousands = 0;
                template = template.substring(0,i) + "," + template.substring(i);
              }
            }
            insertionPoint = i;
          }
          if (template.charAt(i) == "#" && j <= 0)
            template = template.substring(0,i) + template.substring(i+1);
        }
      }
      
      // Insert remaining left digits, with thousands separators as necessary
      if (j > 0)
      {
        for (j; j>0; j--)
        {
          template = template.substring(0,insertionPoint) + numberString.substring(j-1,j) + template.substring(insertionPoint);
          if (thousandsSeparator)
          {
            if (thousands > 2) {
              thousands = 0;
              template = template.substring(0,insertionPoint+1) + "," + template.substring(insertionPoint+1);
            }
            thousands++;
          }
        }
      }
      

      // Where is the decimal point now?
      quotedTemplate = template.replace(/"\./g,'""');
      var decimalPosition = quotedTemplate.indexOf(".");
      if (decimalPosition < 0)
        decimalPosition = template.length;

      // Fill in the template starting at the decimal point and working right
      var j = numberString.indexOf(".");
      if (j < 0)
        j = numberString.length;
      
      for (var i=decimalPosition + 1; i < template.length; i++)
      {
        if (template.charAt(i) == "0" && j < numberString.length)
        {
          j++
          template = template.substring(0,i) + numberString.charAt(j) + template.substring(i+1);
        }
        if (template.charAt(i) == "#")
        {
          if (j < numberString.length)
          {
            j++
            template = template.substring(0,i) + numberString.charAt(j) + template.substring(i+1);
          }
          else
          {
            template = template.substring(0,i) + template.substring(i+1);
            i--;
          }
        }
        if (template.charAt(i) == '"')
          i++;
      }

      template = template.replace(/"/g,"");
      return template;      
    }

    function formatTime(varDate, bstrFormat)
    {
      var time = varDate;  
      
      var result = "";
      for (var i=0; i<bstrFormat.length; i++)
      {
        switch (bstrFormat.charAt(i)) {
        case "H":
          if (bstrFormat.charAt(i+1) == "H") {
            // HH
            i++;
            result += (time.getHours()<10 ? "0" : "") + (time.getHours());
          }
          else // H
            result += time.getHours();
          break;
        case "h":
          var hours = time.getHours() % 12;
          if (hours == 0) hours = 12;
          if (bstrFormat.charAt(i+1) == "h") {
            // hh
            i++;
            result += (hours<10 ? "0" : "") + hours;
          }
          else // h
            result += hours;
          break;
        case "m":
          if (bstrFormat.charAt(i+1) == "m") {
            // mm
            i++;
            result += (time.getMinutes()<10 ? "0" : "") + (time.getMinutes());
          }
          else // m
            result += time.getMinutes();
          break;
       case "s":
          if (bstrFormat.charAt(i+1) == "s") {
            // ss
            i++;
            result += (time.getSeconds()<10 ? "0" : "") + (time.getSeconds());
          }
          else // s
            result += time.getSeconds();
          break;
       case "t":
          if (bstrFormat.charAt(i+1) == "t") {
            // tt
            i++;
            result += time.getHours() < 12 ? "AM" : "PM";
          }
          else // t
            result += time.getHours() < 12 ? "A" : "P";
          break;
       case "'":
          i++;
          while (bstrFormat.charAt(i) != "'" && i < bstrFormat.length)
            result += bstrFormat.charAt(i++);
          // Handle quoted quotes ('') in the literal
          if (bstrFormat.charAt(i+1) == "'")
            result += "'";
          break;
        default:
          result += bstrFormat.charAt(i);
        }
      }
      
      return result;
    }


    // Note that this now returns a string instead of a number
    function uniqueID(pNode)
    {
      if (pNode)
      {
        if (pNode.nodeType == 2)
          return uniqueID(pNode.selectSingleNode("..")) + "_" + pNode.nodeName;
        else if (pNode.parentNode)
          return uniqueID(pNode.parentNode) + "_" + absoluteChildNumber(pNode);
        else
          return absoluteChildNumber(pNode);
      }
      return "";
    }
    function xtlruntime_uniqueID(pNodeList)
    {
      if (pNodeList)
        return uniqueID(pNodeList.item(0));
      else
        return "";
    }

  ]]></msxsl:script>
</xsl:stylesheet>
