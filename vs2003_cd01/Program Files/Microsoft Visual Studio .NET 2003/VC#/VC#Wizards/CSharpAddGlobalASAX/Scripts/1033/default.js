// (c) Microsoft Corporation
function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
	try
	{
        oldSuppressUIValue = dte.SuppressUI;
		var strProjectName		= wizard.FindSymbol("PROJECT_NAME");
		var strSafeProjectName = CreateSafeName(strProjectName);
		wizard.AddSymbol("SAFE_PROJECT_NAME", strSafeProjectName);
		SetTargetFullPath(selObj);
		var strProjectPath		= wizard.FindSymbol("TARGET_FULLPATH");
		var strTemplatePath		= wizard.FindSymbol("TEMPLATES_PATH");
		wizard.AddSymbol("ITEM_NAME", "Global.asax");
		AddDesignerFileToCSharpWebProject(selObj, strProjectName, strProjectPath, "Global.asax", true);
	}
	catch(e)
	{
		if( e.description.length > 0 )
			SetErrorInfo(e);
		return e.number;
	}
    finally
    {
   		dte.SuppressUI = oldSuppressUIValue;
    }
}

function SetFileProperties(oFileItem, strFileName)
{
    if(strFileName == "Global.asax")
    {
        oFileItem.Properties("SubType").Value = "Component";
    }
}

