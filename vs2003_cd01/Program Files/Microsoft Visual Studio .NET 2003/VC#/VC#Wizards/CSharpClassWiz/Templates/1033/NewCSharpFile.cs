[!if !ADD_CLASS_MERGE]
using System;

namespace [!output CLASS_NAMESPACE]
{
[!endif]
	/// <summary>
	/// [!output COMMENT]
	/// </summary>
[!if ABSTRACT]
	[!output ACCESS_STRING] abstract class [!output CLASS_NAME][!output BASE_INTERFACE_NAME_STRING]
[!else]
[!if SEALED]
	[!output ACCESS_STRING] sealed class [!output CLASS_NAME][!output BASE_INTERFACE_NAME_STRING]
[!else]
	[!output ACCESS_STRING] class [!output CLASS_NAME][!output BASE_INTERFACE_NAME_STRING]
[!endif]
[!endif]
	{
		[!output ACCESS_STRING] [!output CLASS_NAME]()
		{
			// 
			// TODO: Add constructor logic here
			//
		}
	}
[!if !ADD_CLASS_MERGE]
}
[!endif]
