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

namespace LocalizedControlsCS {
  using System;
  using System.Globalization;
  using System.Reflection;
  using System.Resources;
  using System.Threading;
  using System.Web;
  using System.Web.UI;
  using System.Web.UI.WebControls;


  internal class ResourceFactory {
    static ResourceManager _rm;

    public static ResourceManager RManager {
      get {
        if(_rm == null) {
          _rm = new ResourceManager( "LocalizedStringsCS",
                   Assembly.GetExecutingAssembly(),
                   null);
        }
        return _rm;
      }
    }
  }

  public class LocalizedButton : Button {

    override protected void Render (HtmlTextWriter writer) {
      Text = ResourceFactory.RManager.GetString(Text);
      base.Render(writer);
    }
  }
}

