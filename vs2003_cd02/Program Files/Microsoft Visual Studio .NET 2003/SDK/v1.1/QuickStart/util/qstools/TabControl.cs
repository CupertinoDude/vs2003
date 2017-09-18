//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

using System;
using System.Collections;
using System.Globalization;
using System.Web;
using System.Web.UI;

namespace Acme {
    public class TabControlBuilder: ControlBuilder {
        public override Type GetChildControlType(String tagName, IDictionary attributes) {
            if (String.Compare(tagName, "Tab", true, CultureInfo.InvariantCulture) == 0) {
                return typeof(Acme.Tab);
            }
            return null;
        }
    }

    [
       ControlBuilderAttribute(typeof(TabControlBuilder))
    ]
    public class TabControl : Control {

        private ArrayList _tabs = new ArrayList();
        private bool _encode = false;

        protected override void AddParsedSubObject(Object obj) {
            if (obj is Tab) {
                _tabs.Add(obj);
            }
        }

        private String Encode(String text) {
            if (!_encode) return text;
            return Page.Server.HtmlEncode(text);
        }

        public bool HtmlEncode {
            get {
                return _encode;
            }
            set {
                _encode = value;
            }
        }

        private void RenderSupportScripts(HtmlTextWriter output) {
            int _numTabs = _tabs.Count;

            output.WriteLine("  <script language=\"JavaScript\">");
            output.WriteLine("    function doClick(index, numTabs, id) {");
            output.WriteLine("        document.all(\"tab\" + id, index).className = \"tab\";");
            output.WriteLine("        for (var i=1; i < numTabs; i++) {");
            output.WriteLine("            document.all(\"tab\" + id, (index + i) % numTabs).className = \"backtab\";");
            output.WriteLine("        }");
            output.WriteLine("        document.all(\"code\" + id, index).style.display = \"\";");
            output.WriteLine("        for (var j=1; j < numTabs; j++) {");
            output.WriteLine("          document.all(\"code\" + id, (index + j) % numTabs).style.display = \"none\";");
            output.WriteLine("        }");
            output.WriteLine("    }");
            output.WriteLine("  </script>\n");
            output.WriteLine("  <style>");
            output.WriteLine("    td.code {");
            output.WriteLine("      padding:0,10,0,10;");
            output.WriteLine("      border-style:solid;");
            output.WriteLine("      border-width:1;");
            output.WriteLine("      border-bottom:0;");
            output.WriteLine("      border-top:0;");
            output.WriteLine("      border-right:0;");
            output.WriteLine("      border-color:cccccc;");
            output.WriteLine("      background-color:ffffee");
            output.WriteLine("    }");
            output.WriteLine("    td.tab {");
            output.WriteLine("      text-align:center;");
            output.WriteLine("      font:x-small verdana;");
            output.WriteLine("      width:15%;");
            output.WriteLine("      padding:3,3,3,3;");
            output.WriteLine("      border-style:solid;");
            output.WriteLine("      border-width:1;");
            output.WriteLine("      border-right:0;");
            output.WriteLine("      border-color:black;");
            output.WriteLine("      background-color:eeeeee;");
            output.WriteLine("      cursor:hand");
            output.WriteLine("    }");
            output.WriteLine("    td.backtab {");
            output.WriteLine("      text-align:center;");
            output.WriteLine("      font:x-small verdana;");
            output.WriteLine("      width:15%;");
            output.WriteLine("      padding:3,3,3,3;");
            output.WriteLine("      border-style:solid;");
            output.WriteLine("      border-width:1;");
            output.WriteLine("      border-right:0;");
            output.WriteLine("      border-color:black;");
            output.WriteLine("      background-color:cccccc;");
            output.WriteLine("      cursor:hand");
            output.WriteLine("    }");
            output.WriteLine("    td.space {");
            output.WriteLine("      width:" + (100 - _numTabs * 15).ToString() + "%;");
            output.WriteLine("      font:x-small verdana;");
            output.WriteLine("      padding:0,0,0,0;");
            output.WriteLine("      border-style:solid;");
            output.WriteLine("      border-bottom:0;");
            output.WriteLine("      border-right:0;");
            output.WriteLine("      border-width:1;");
            output.WriteLine("      border-color:cccccc;");
            output.WriteLine("      border-left-color:black;");
            output.WriteLine("      background-color:white");
            output.WriteLine("    }");
            output.WriteLine("  </style>");
        }

        protected override void Render(HtmlTextWriter output) {
            bool isUpLevel = (Page.Request.Browser.Browser == "IE");

            if ( isUpLevel ) {

                if ( !Page.IsClientScriptBlockRegistered("Acme_TabControl") ){
                    Page.RegisterClientScriptBlock("Acme_TabControl", "");
                    RenderSupportScripts(output);
                }

                RenderUpLevel(output);
            } else {
                RenderDownLevel(output);
            }
        }

        private void RenderDownLevel(HtmlTextWriter output) {
            int _selectedindex = 0;
            int _numTabs = _tabs.Count;

            for (int i=0; i< _numTabs; i++) {
                HttpCookie codeCookie = Page.Request.Cookies["langpref"];
                Tab _tab = (Tab) _tabs[i];
                String value = "VB";

                if (codeCookie != null)
                    value = codeCookie.Value;

                if (_tab.Name==value)
                    _selectedindex = i;
            }

            output.WriteLine("<div class=\"code\"><pre>");
            for (int i=0; i< _numTabs; i++) {
                Tab _tab = (Tab) _tabs[i];

                if (_tab.HasControls() && i == _selectedindex ) {
                    for (int x=0; x<_tab.Controls.Count; x++) {
                        if (_tab.Controls[x] is LiteralControl)
                            output.Write(Encode(((LiteralControl) _tab.Controls[x]).Text));
                    }
                    output.WriteLine("</pre></div>");
                    output.WriteLine("<div class=\"langtab\"><b>" + _tab.Name + "</b>");
                }
            }
            output.WriteLine("</div>");
        }

        private void RenderUpLevel(HtmlTextWriter output) {
            int _selectedindex = 0;
            int _numTabs = _tabs.Count;

            for (int i=0; i< _numTabs; i++) {
                HttpCookie codeCookie = Page.Request.Cookies["langpref"];
                Tab _tab = (Tab) _tabs[i];
                String value = "VB";

                if (codeCookie != null)
                    value = codeCookie.Value;

                if (_tab.Name==value)
                    _selectedindex = i;
            }

            output.WriteLine("    <table cellpadding=0 cellspacing=0 width=\"95%\">");
            output.WriteLine("      <tr>");
            output.WriteLine("        <td class=\"code\" colspan=\"" + (_numTabs + 1).ToString() + "\">");

            for (int i=0; i< _numTabs; i++) {
                Tab _tab = (Tab) _tabs[i];
                String _display = "none";

                if (i == _selectedindex)
                    _display = "";

                output.WriteLine("<pre id=\"code" + this.UniqueID + "\" style=\"display:" + _display + "\">");

                if (_tab.HasControls()) {
                    for (int x=0; x<_tab.Controls.Count; x++) {
                        if (_tab.Controls[x] is LiteralControl)
                            output.Write(Encode(((LiteralControl) _tab.Controls[x]).Text));
                    }
                }

                output.WriteLine("</pre>");
            }
            output.WriteLine("        </td>");
            output.WriteLine("      </tr>");
            output.WriteLine("      <tr>");

            for (int i=0; i< _numTabs; i++) {
                Tab _tab = (Tab) _tabs[i];
                String _className = "backtab";

                if (i == _selectedindex)
                    _className = "tab";

                output.WriteLine("        <td class=\"" + _className + "\" id=\"tab" + this.UniqueID + "\" onclick=\"doClick(" + i.ToString() + ", " + _numTabs.ToString() + ", '" + this.UniqueID + "')\">");
                output.WriteLine("          <b>" + _tab.Name + "</b>");
                output.WriteLine("        </td>");
            }
            output.WriteLine("        <td class=\"space\">&nbsp;</td>");
            output.WriteLine("      </tr>");
            output.WriteLine("    </table>");
        }
    }
}