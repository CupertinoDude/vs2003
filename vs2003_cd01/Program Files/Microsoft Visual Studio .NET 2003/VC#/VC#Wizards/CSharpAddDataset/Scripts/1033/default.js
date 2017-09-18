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
		var InfFile = CreateInfFile();
		AddFilesToCSharpProject(selObj, strProjectName, strProjectPath, InfFile, true);
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
   		if( InfFile )
			InfFile.Delete();
    }
}

function SetFileProperties(oFileItem, strFileName)
{
    // get file extension
	var strExt = strFileName.substr(strFileName.lastIndexOf("."));
    if(strExt.toLowerCase() == ".xsd")
    {
        oFileItem.Properties("CustomTool").Value = "MSDataSetGenerator";
    }
}

