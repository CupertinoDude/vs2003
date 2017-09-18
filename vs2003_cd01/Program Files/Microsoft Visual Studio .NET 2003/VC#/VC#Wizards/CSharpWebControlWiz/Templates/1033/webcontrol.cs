using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;

namespace [!output SAFE_NAMESPACE_NAME]
{
	/// <summary>
	/// Summary description for [!output SAFE_CLASS_NAME].
	/// </summary>
	[DefaultProperty("Text"),
		ToolboxData("<{0}:[!output SAFE_CLASS_NAME] runat=server></{0}:[!output SAFE_CLASS_NAME]>")]
	public class [!output SAFE_CLASS_NAME] : System.Web.UI.WebControls.WebControl
	{
		private string text;

		[Bindable(true),
			Category("Appearance"),
			DefaultValue("")]
		public string Text
		{
			get
			{
				return text;
			}

			set
			{
				text = value;
			}
		}

		/// <summary>
		/// Render this control to the output parameter specified.
		/// </summary>
		/// <param name="output"> The HTML writer to write out to </param>
		protected override void Render(HtmlTextWriter output)
		{
			output.Write(Text);
		}
	}
}
