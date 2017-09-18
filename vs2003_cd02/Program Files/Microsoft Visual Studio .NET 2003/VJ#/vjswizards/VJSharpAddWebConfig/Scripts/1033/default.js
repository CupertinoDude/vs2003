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
		wizard.AddSymbol("ITEM_NAME", "Web.config");

		AddDesignerFileToBJWebProject(selObj, strProjectName, strProjectPath, "Web.config", true);

	}
	catch(e)
	{
		// let the env-project handle all error messages - 	wizard.ReportError(e.description);
	}
    finally
    {
   		dte.SuppressUI = oldSuppressUIValue;
    }
}

function SetFileProperties(oFileItem, strFileName)
{
    if(strFileName == "Web.Config")
    {
        oFileItem.Properties("SubType").Value = "Code";
    }
}

