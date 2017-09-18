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
using System.Web.UI.MobileControls;
using System.Web.UI.MobileControls.Adapters;

namespace Acme
{
    // ====================================================================
    //
    // TimerForm Control Class
    //
    // The TimerForm control inherits from Form, and adds the ability
    // to make the browser navigate to a URL or post back to the server
    // after a specified time.
    //
    // To set the specified delay, set the Delay property.
    //
    // To make the browser navigate to a URL, set the AutoNavigateUrl
    // property.
    //
    // To make the browser post back, leave AutoNavigateUrl blank. To
    // handle the resulting event, set an event handler for the Timer
    // event, or override OnTimer in an inheriting class.
    //
    // ====================================================================

    public class TimerFormCS : Form
    {
        protected static readonly Object EventTimer = new Object();

        // ================================================================
        //
        // Delay property
        //
        // Defines, in seconds, how long to delay before executing action.
        // Defaults to ten seconds.
        //
        // ================================================================

        public int Delay
        {
            get
            {
                Object o = ViewState["Delay"];
                return o != null ? (int)o : 10;
            }

            set
            {
                ViewState["Delay"] = value;
            }
        }

        // ================================================================
        //
        // AutoNavigateUrl property 
        //
        // If defined, renders markup to make the browser automatically 
        // navigate to the given URL after the specified time.
        //
        // ================================================================

        public String AutoNavigateUrl
        {
            get
            {
                String s = (String)ViewState["AutoNavigateUrl"];
                return s != null ? s : String.Empty;
            }

            set
            {
                ViewState["AutoNavigateUrl"] = value;
            }
        }

        // ================================================================
        //
        // Timer event
        //
        // This event is raised when the timer elapses, and the browser
        // posts back to the server. If AutoNavigateUrl is defined, no
        // postback happens.
        //
        // ================================================================

        public event EventHandler Timer
        {
            add
            {
                Events.AddHandler(EventTimer, value);
            }

            remove
            {
                Events.RemoveHandler(EventTimer, value);
            }
        }

        // ================================================================
        //
        // OnTimer method
        //
        // This protected method allows inheriting classes to internally 
        // handle a post back following the specified delay. The default
        // implementation raises the Timer event.
        //
        // ================================================================

        protected virtual void OnTimer(EventArgs e)
        {
            EventHandler onTimer = (EventHandler)Events[EventTimer];
            if (onTimer != null)
            {
                onTimer(this, e);
            }
        }

        // ================================================================
        //
        // RaiseTimer method
        //
        // Called by the adapters to raise the timer event.
        //
        // ================================================================

        public void RaiseTimer()
        {
            OnTimer(new EventArgs());
        }
    }

    // ====================================================================
    //
    // WmlTimerFormAdapter Class
    //
    // The WmlTimerFormAdapter class renders a TimerForm control on
    // WML devices. The timer functionality is rendered using an
    // <onevent type="timer"> construct. All other behavior
    // is inherited from WmlFormAdapter.
    //
    // ====================================================================

    public class WmlTimerFormAdapterCS : WmlFormAdapter
    {
        private const String TimerEventArgument = "$timer";

        protected new TimerFormCS Control
        {
            get
            {
                return (TimerFormCS)base.Control;
            }
        }

        // ================================================================
        //
        // RenderExtraCardElements method
        //
        // By overriding this method, the adapter can render additional
        // content immediately after the <card> tag in the WML output.
        //
        // ================================================================

        protected override void RenderExtraCardElements(WmlMobileTextWriter writer)
        {
            String autoNavigateUrl = Control.AutoNavigateUrl;

            // A URL to another form on the same page will also cause a postback.

            bool renderAsPostBack = autoNavigateUrl.Length == 0 || 
                                    DeterminePostBack(autoNavigateUrl) != null;

            writer.WriteBeginTag("onevent");
            writer.WriteAttribute("type", "ontimer");
            writer.Write(">");
                
            if (renderAsPostBack)
            {
                writer.RenderGoAction(Control.UniqueID, 
                                      TimerEventArgument, 
                                      WmlPostFieldType.Normal,
                                      false);
            }
            else
            {
                // Resolve the URL relative to the page.
                autoNavigateUrl = Control.ResolveUrl(autoNavigateUrl);

                writer.WriteBeginTag("go");
                writer.Write(" href=\"");
                writer.WriteEncodedUrl(autoNavigateUrl);
                writer.Write("\">");
            }

            writer.WriteEndTag("onevent");
            writer.WriteLine();

            writer.WriteBeginTag("timer");
            // WML timer lengths are in 10th of seconds.
            writer.WriteAttribute("value", (Control.Delay*10).ToString());
            writer.WriteLine("/>");
        }

        // ================================================================
        //
        // HandlePostBackEvent method
        //
        // By overriding this method, the adapter can handle the postback
        // generated from the timer.
        //
        // ================================================================

        public override bool HandlePostBackEvent(String eventArgument)
        {
            if (eventArgument == TimerEventArgument)
            {
                String autoNavigateUrl = Control.AutoNavigateUrl;
                if (autoNavigateUrl.Length > 0)
                {
                    if (autoNavigateUrl.Length > 1 && autoNavigateUrl[0] == '#')
                    {
                        Page.ActiveForm = Control.ResolveFormReference(autoNavigateUrl.Substring(1));
                    }
                }
                else
                {
                    Control.RaiseTimer();
                }

                return true;
            }
            else
            {
                // Let the base adapter class handle any events.

                return base.HandlePostBackEvent(eventArgument);
            }
        }
    }

    // ====================================================================
    //
    // HtmlTimerFormHelper Class
    //
    // The HtmlTimerFormHelper class is a helper class used by both
    // HtmlTimerFormAdapter and ChtmlTimerFormAdapter. Although both
    // these classes require identical functionality, they have different
    // base classes, making a helper class useful.
    //
    // On HTML devices, the timer functionality is rendered using a
    // <meta http-equiv="refresh"> construct. All other behavior
    // is inherited from the base form adapter.
    //
    // ====================================================================

    class HtmlTimerFormHelperCS
    {
        private const String TimerEventArgument = "$timer";

        // ================================================================
        //
        // RenderTimerMetaTag method
        //
        // Renders the metatag for the timer behavior.
        //
        // ================================================================

        public static void RenderTimerMetaTag(TimerFormCS form, HtmlMobileTextWriter writer)
        {
            String autoNavigateUrl = form.AutoNavigateUrl;

            // A URL to another form on the same page will also cause a postback.

            bool renderAsPostBack = autoNavigateUrl.Length == 0 || 
                                    autoNavigateUrl[0] == '#';

            writer.WriteBeginTag("meta");
            writer.WriteAttribute("http-equiv", "refresh");
            writer.Write(" content=\"");
            writer.Write(form.Delay.ToString());
            writer.Write(";url=");
            if (renderAsPostBack)
            {
                HtmlPageAdapter pageAdapter = (HtmlPageAdapter)form.MobilePage.Adapter;
                pageAdapter.RenderUrlPostBackEvent(writer, form.UniqueID, TimerEventArgument);
            }
            else
            {
                writer.WriteEncodedUrl(autoNavigateUrl);
            }
            writer.WriteLine("\">");
        }

        // ================================================================
        //
        // HandlePostBackEvent method
        //
        // Handles a timer postback event.
        //
        // ================================================================

        public static bool HandlePostBackEvent(TimerFormCS form, String eventArgument)
        {
            if (eventArgument == TimerEventArgument)
            {
                String autoNavigateUrl = form.AutoNavigateUrl;

                if (autoNavigateUrl.Length > 0)
                {
                    if (autoNavigateUrl.Length > 1 && autoNavigateUrl[0] == '#')
                    {
                        form.MobilePage.ActiveForm = form.ResolveFormReference(autoNavigateUrl.Substring(1));
                    }
                }
                else 
                {
                    form.RaiseTimer();
                }

                return true;
            }
            else
            {
                return false;
            }
        }
    }

    // ====================================================================
    //
    // HtmlTimerFormAdapter Class
    //
    // The HtmlTimerFormAdapter class renders a TimerForm control on
    // HTML devices. The timer functionality is rendered using a
    // <meta http-equiv="refresh"> construct. All other behavior
    // is inherited from HtmlFormAdapter.
    //
    // ====================================================================

    public class HtmlTimerFormAdapterCS : HtmlFormAdapter
    {
        protected new TimerFormCS Control
        {
            get
            {
                return (TimerFormCS)base.Control;
            }
        }

        // ================================================================
        //
        // RenderExtraHeadElements method
        //
        // By overriding this method, the adapter can render additional
        // content inside the <head> tag of the rendered page. The adapter
        // must call the base class implementation.
        //
        // ================================================================

        protected override bool RenderExtraHeadElements(HtmlMobileTextWriter writer)
        {
            base.RenderExtraHeadElements(writer);

            // The method is called twice - once with the writer set to null,
            // to determine if there is anything to be written; and once with
            // a valid writer.

            if (writer != null)
            {
                HtmlTimerFormHelperCS.RenderTimerMetaTag(Control, writer);
            }

            return true;
        }

        // ================================================================
        //
        // HandlePostBackEvent method
        //
        // By overriding this method, the adapter can handle the postback
        // generated from the timer.
        //
        // ================================================================

        public override bool HandlePostBackEvent(String eventArgument)
        {
            if (HtmlTimerFormHelperCS.HandlePostBackEvent(Control, eventArgument))
            {
                return true;
            }
            else
            {
                // Let the base adapter class handle any events.

                return base.HandlePostBackEvent(eventArgument);
            }
        }
    }

    // ====================================================================
    //
    // ChtmlTimerFormAdapter Class
    //
    // The ChtmlTimerFormAdapter class renders a TimerForm control on
    // scriptless HTML devices. The timer functionality is rendered using 
    // a <meta http-equiv="refresh"> construct. All other behavior
    // is inherited from ChtmlFormAdapter.
    //
    // ====================================================================

    public class ChtmlTimerFormAdapterCS : ChtmlFormAdapter
    {
        protected new TimerFormCS Control
        {
            get
            {
                return (TimerFormCS)base.Control;
            }
        }

        // ================================================================
        //
        // RenderExtraHeadElements method
        //
        // By overriding this method, the adapter can render additional
        // content inside the <head> tag of the rendered page. The adapter
        // must call the base class implementation.
        //
        // ================================================================

        protected override bool RenderExtraHeadElements(HtmlMobileTextWriter writer)
        {
            base.RenderExtraHeadElements(writer);

            // The method is called twice - once with the writer set to null,
            // to determine if there is anything to be written; and once with
            // a valid writer.

            if (writer != null)
            {
                HtmlTimerFormHelperCS.RenderTimerMetaTag(Control, writer);
            }

            return true;
        }

        // ================================================================
        //
        // HandlePostBackEvent method
        //
        // By overriding this method, the adapter can handle the postback
        // generated from the timer.
        //
        // ================================================================

        public override bool HandlePostBackEvent(String eventArgument)
        {
            if (HtmlTimerFormHelperCS.HandlePostBackEvent(Control, eventArgument))
            {
                return true;
            }
            else
            {
                // Let the base adapter class handle any events.

                return base.HandlePostBackEvent(eventArgument);
            }
        }
    }
}
