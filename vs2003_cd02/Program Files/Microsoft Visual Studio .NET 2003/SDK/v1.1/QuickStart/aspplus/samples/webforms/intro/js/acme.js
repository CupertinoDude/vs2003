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

import System;
import System.Collections;
import System.Collections.Specialized;
import System.Globalization;
import System.Text;
import System.Web;
import System.Web.UI;
import System.Reflection;

[assembly: AssemblyTitle("")]
[assembly: AssemblyDescription("A QuickStart Tutorial Assembly")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Microsoft Corporation")]
[assembly: AssemblyProduct("Microsoft QuickStart Tutorials")]
[assembly: AssemblyCopyright(" Microsoft Corporation.  All rights reserved.")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]
[assembly: AssemblyVersion("1.1.*")]

package AcmeJS
{
    public class Calendar extends Control implements IPostBackEventHandler, IPostBackDataHandler
    {
        private var monthNames:String[] = new String[12];
        private var currentDate:DateTime = DateTime.Now;
        private var backColor:String = "#dcdcdc";
        private var foreColor:String = "#eeeeee";

        protected function OnInit(E:EventArgs) : void
        {
            Page.RegisterRequiresPostBack(this);

            currentDate = DateTime.Now;

            monthNames[0] = "January";
            monthNames[1] = "February";
            monthNames[2] = "March";
            monthNames[3] = "April";
            monthNames[4] = "May";
            monthNames[5] = "June";
            monthNames[6] = "July";
            monthNames[7] = "August";
            monthNames[8] = "September";
            monthNames[9] = "October";
            monthNames[10] = "November";
            monthNames[11] = "December";
        }

        protected function LoadViewState(viewState:Object) : void
        {
            // If we've done a post-back, the old date will be available to us

            if (null != viewState)
            {
                currentDate = DateTime.Parse(String(viewState));
            }
        }

        public function RaisePostBackEvent(eventArgument:String) : void
        {
            if (eventArgument == null)
            {
                return;
            }

            // Keep track of old date (for event firing purposes)

            var oldDate:DateTime = currentDate;

            if (String.Compare("NavNextMonth", eventArgument, true, CultureInfo.InvariantCulture) == 0)
            {
                currentDate = currentDate.AddMonths(1);
            }
            else if (String.Compare("NavPrevMonth", eventArgument, true, CultureInfo.InvariantCulture) == 0)
            {
                currentDate = currentDate.AddMonths(-1);
            }
            else
            {
                var daySelected:int = Int32.Parse(eventArgument);
                currentDate = new DateTime(currentDate.Year, currentDate.Month, daySelected);
            }
        }

        protected function SaveViewState() : Object
        {
            // Save CurrentDate out as view state for postback scenarios

            return currentDate.ToString();
        }

        protected function Render(output:HtmlTextWriter) : void
        {
            if ((Page.Request.UserAgent != null) &&
                (Page.Request.Browser.Browser.ToUpper(CultureInfo.InvariantCulture).IndexOf("IE") > -1) &&
		(Double.Parse(Page.Request.Browser.Version) >= 5.5))
               RenderUpLevel(output);
            else
               RenderDownLevel(output);
        }

        protected function RenderUpLevel(output:HtmlTextWriter) : void
        {
            output.WriteLine("<input name='" + UniqueID + "_CurrentDate' id='" + UniqueID + "_CurrentDate' type=hidden>");
            output.WriteLine("<span id='" + UniqueID + "'></span>");
            output.WriteLine("<script language=jscript>drawcalendar('" + UniqueID + "', '" + currentDate.Year.ToString() + "/" + currentDate.Month.ToString() + "/" + currentDate.Day.ToString() + "');</script>");
        }

        protected function OnPreRender(E:EventArgs) : void
        {
            var DHTMLFunction:StringBuilder = new StringBuilder();

            DHTMLFunction.Append("<script language='JavaScript'> \n");
            DHTMLFunction.Append("   function drawcalendar(calname, newDate) \n");
            DHTMLFunction.Append("   { \n");
            DHTMLFunction.Append("     var CurrentDate = new Date(newDate);\n");
            DHTMLFunction.Append("     var MonthArray = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');\n");
            DHTMLFunction.Append("     var MonthDays = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);\n");
            DHTMLFunction.Append("     var calText;\n");
            DHTMLFunction.Append("     calText = '<table bgcolor=#dcdcdc border=0 height=190 valign=top>';\n");
            DHTMLFunction.Append("     calText = calText + '<tr><td>';\n");
            DHTMLFunction.Append("     calText = calText + '<center>';\n");
            DHTMLFunction.Append("     calText = calText + \"<a href='javascript:drawcalendar(\\\"\" + calname + \"\\\", \\\"\" + CurrentDate.getFullYear() + \"/\" + CurrentDate.getMonth() + \"/\" + CurrentDate.getDate() + \"\\\")'>\";\n");
            DHTMLFunction.Append("     calText = calText + '<img src=/quickstart/aspplus/images/left4.gif width=11 height=11 border=0></a>';\n");
            DHTMLFunction.Append("     calText = calText + '    <b>' + MonthArray[CurrentDate.getMonth()] + ' ' + CurrentDate.getFullYear() + '</b>';\n");
            DHTMLFunction.Append("     calText = calText + \"   <a href='javascript:drawcalendar(\\\"\" + calname + \"\\\", \\\"\" + CurrentDate.getFullYear() + \"/\" + (CurrentDate.getMonth() + 2) + \"/\" + CurrentDate.getDate() + \"\\\")'>\";\n");
            DHTMLFunction.Append("     calText = calText + '<IMG SRC=/quickstart/aspplus/images/right4.gif width=11 height=11 border=0></a>';\n");
            DHTMLFunction.Append("     calText = calText + '</center>';\n");
            DHTMLFunction.Append("     calText = calText + '</td></tr>';\n");
            DHTMLFunction.Append("     calText = calText + '<tr valign=top><td valign=top>';\n");
            DHTMLFunction.Append("     calText = calText + '<table border=1 bgcolor=#eeeeee height=160>';\n");
            DHTMLFunction.Append("     calText = calText + '<tr height=20>';\n");
            DHTMLFunction.Append("     calText = calText + '   <td align=right width=23> Sun </td>';\n");
            DHTMLFunction.Append("     calText = calText + '   <td align=right width=23> Mon </td>';\n");
            DHTMLFunction.Append("     calText = calText + '   <td align=right width=23> Tue </td>';\n");
            DHTMLFunction.Append("     calText = calText + '   <td align=right width=23> Wed </td>';\n");
            DHTMLFunction.Append("     calText = calText + '   <td align=right width=23> Thu </td>';\n");
            DHTMLFunction.Append("     calText = calText + '   <td align=right width=23> Fri </td>';\n");
            DHTMLFunction.Append("     calText = calText + '   <td align=right width=23> Sat </td>';\n");
            DHTMLFunction.Append("     calText = calText + '</tr>';\n");
            DHTMLFunction.Append("     calText = calText + '<tr>';\n");
            DHTMLFunction.Append("     var numDays  = MonthDays[CurrentDate.getMonth()];\n");
            DHTMLFunction.Append("     var firstDayOfMonth = new Date(CurrentDate.getFullYear(),CurrentDate.getMonth(),1);\n");
            DHTMLFunction.Append("     firstDay = firstDayOfMonth.getDay();\n");
            DHTMLFunction.Append("     for (var x=0; x<firstDay; x++)\n");
            DHTMLFunction.Append("     {\n");
            DHTMLFunction.Append("         calText = calText + '<td align=right width=23></td>'\n");
            DHTMLFunction.Append("     }\n");
            DHTMLFunction.Append("     for (var x=1; x<=numDays; x++) \n");
            DHTMLFunction.Append("     { \n");
            DHTMLFunction.Append("         if (CurrentDate.getDate() == x) \n");
            DHTMLFunction.Append("         { \n");
            DHTMLFunction.Append("             calText = calText + '<td align=right width=23>';\n");
            DHTMLFunction.Append("             calText = calText + '<font color=red><b><u>' + x + '</u></b></font>';\n");
            DHTMLFunction.Append("             calText = calText + '</td>';\n");
            DHTMLFunction.Append("         }\n");
            DHTMLFunction.Append("         else \n");
            DHTMLFunction.Append("         { \n");
            DHTMLFunction.Append("             calText = calText + '<td align=right width=23>';\n");
            DHTMLFunction.Append("             calText = calText + \"<a href='javascript:drawcalendar(\\\"\" + calname + \"\\\", \\\"\" + CurrentDate.getFullYear() + \"/\" + (CurrentDate.getMonth()+1) + \"/\" + x + \"\\\")'>\" + x + \"</a>\";");
            DHTMLFunction.Append("             calText = calText + '</td>';\n");
            DHTMLFunction.Append("         }\n");
            DHTMLFunction.Append("         if (((firstDay+x) % 7) == 0)\n");
            DHTMLFunction.Append("         {\n");
            DHTMLFunction.Append("             calText = calText + '</tr><tr>';\n");
            DHTMLFunction.Append("         }\n");
            DHTMLFunction.Append("     }\n");
            DHTMLFunction.Append("     calText = calText + '</tr>';");
            DHTMLFunction.Append("     calText = calText + '</table></td></tr></table>';");
            DHTMLFunction.Append("     var CalendarSpan = document.all(calname);");
            DHTMLFunction.Append("     if (CalendarSpan != null)");
            DHTMLFunction.Append("        CalendarSpan.innerHTML = calText;");
            DHTMLFunction.Append("     var CalendarValue = document.all(calname + '_CurrentDate');");
            DHTMLFunction.Append("     if (CalendarValue != null)");
            DHTMLFunction.Append("        CalendarValue.value = '' + (CurrentDate.getMonth() + 1) + '/' + CurrentDate.getDate() + '/' + CurrentDate.getFullYear();");
            DHTMLFunction.Append("   } \n");
            DHTMLFunction.Append("</script>\n");

            if ((Page.Request.UserAgent != null) &&
                (Page.Request.Browser.Browser.ToUpper(CultureInfo.InvariantCulture).IndexOf("IE") > -1) &&
		(Double.Parse(Page.Request.Browser.Version) >= 5.5))
               Page.RegisterClientScriptBlock("ACME_CALENDAR_DHTML", DHTMLFunction.ToString());
        }

        protected function RenderDownLevel(output:HtmlTextWriter) : void
        {
            // Output Calendar Header

            output.WriteLine("<table bgcolor=" + backColor + " border=0 height=190 valign=top><tr><td>");
            output.WriteLine("<table bgcolor=" + backColor + " border=0 height=190 valign=top>");
            output.WriteLine("<tr><td>");
            output.WriteLine("<center>");
            output.WriteLine("    <a href=\"javascript:" + Page.GetPostBackEventReference(this, "NavPrevMonth") + "\">");
            output.WriteLine("<img src=/quickstart/aspplus/images/left4.gif width=11 height=11 border=0></a>");
            output.WriteLine("    <b>" + monthNames[currentDate.Month-1] + " " + currentDate.Year.ToString() + "</b>");
            output.WriteLine("    <a href=\"javascript:" + Page.GetPostBackEventReference(this, "NavNextMonth") + "\">");
            output.WriteLine("<IMG SRC=/quickstart/aspplus/images/right4.gif width=11 height=11 border=0></a>");
            output.WriteLine("</center>");
            output.WriteLine("</td></tr>");
            output.WriteLine("<tr valign=top><td valign=top>");
            output.WriteLine("<table border=1 bgcolor=" + foreColor + " height=160>");
            output.WriteLine("<tr height=20>");
            output.WriteLine("   <td align=right width=23> Sun </td>");
            output.WriteLine("   <td align=right width=23> Mon </td>");
            output.WriteLine("   <td align=right width=23> Tue </td>");
            output.WriteLine("   <td align=right width=23> Wed </td>");
            output.WriteLine("   <td align=right width=23> Thu </td>");
            output.WriteLine("   <td align=right width=23> Fri </td>");
            output.WriteLine("   <td align=right width=23> Sat </td>");
            output.WriteLine("</tr>");
            output.WriteLine("<tr>");

            // Calculate how many days are in the month

            var numDays:int = DateTime.DaysInMonth(currentDate.Year, currentDate.Month);

            // Calculate what day of week the first day of the month is on

            var firstDay:int = new DateTime(currentDate.Year, currentDate.Month, 1).DayOfWeek;

            // Pre-Day Padding
            var x:int;
            for ( x=0; x<firstDay; x++)
            {
                output.WriteLine("<td align=right width=23></td>");
            }

            // Output each day

            for ( x=1; x<=numDays; x++)
            {
                if (currentDate.Day == x)
                {
                    output.Write("<td align=right width=23>");
                    output.Write("<font color=red><b><u>" + x.ToString() + "</u></b></font>");
                    output.WriteLine("</td>");
                }
                else
                {
                    output.Write("<td align=right width=23>");
                    output.Write("<a href=\"javascript:" + Page.GetPostBackEventReference(this, x.ToString()) + "\">");
                    output.Write(x.ToString() + "</a>");
                    output.WriteLine("</td>");
                }

                // PerPage row break as appropriate
                if (((firstDay+x) % 7) == 0)
                {
                    output.WriteLine("</tr><tr>");
                }
            }

            output.WriteLine("</tr>");
            output.WriteLine("</table></td></tr></table></table>");
        }

        public function get Date() : DateTime
        {
                return currentDate;
        }
        public function set Date(value:DateTime)
        {
                currentDate = value;
        }

        public function get BackColor() : String
        {
                return backColor;
        }
        public function set BackColor(value:String)
        {
                backColor = value;
        }

        public function get ForeColor() : String
        {
                return foreColor;
        }
        public function set ForeColor(value:String)
        {
                foreColor = value;
        }

        public function LoadPostData(postDataKey:String, values:NameValueCollection) : Boolean
        {
            var clientDate:String = values[UniqueID + "_CurrentDate"];

            if (clientDate != null) {
                try {
                    currentDate = DateTime.Parse(clientDate);
                } catch(e:Exception) {
                    currentDate = DateTime.Now;
                }
            }

            return false;
        }

        public function RaisePostDataChangedEvent() : void
        {

        }
    }
}