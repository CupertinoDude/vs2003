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
import System.Globalization;
import System.Reflection;
import System.Resources;
import System.Threading;
import System.Web;
import System.Web.UI;
import System.Web.UI.WebControls;

package LocalizedControlsJS {

  internal class ResourceFactory {
      static var _rm:ResourceManager;

      public static function get RManager() : ResourceManager {
          if(_rm == null) {
              _rm = new ResourceManager("LocalizedStringsJS", Assembly.GetExecutingAssembly());
          }
          return _rm;
      }
  }

  public class LocalizedButton extends Button {
      override protected function Render(writer:HtmlTextWriter) : void {
          this.Text = ResourceFactory.RManager.GetString(this.Text);
          super.Render(writer);
      }
  }
}

