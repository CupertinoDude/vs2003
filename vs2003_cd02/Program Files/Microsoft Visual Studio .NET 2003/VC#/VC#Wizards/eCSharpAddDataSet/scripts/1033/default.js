// (c) 2001 Microsoft Corporation
function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
    var goBack;
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
		goBack = AddFilesToCSharpProject(selObj, strProjectName, strProjectPath, InfFile, true, "");

		InfFile.Delete();
	}
	catch(e)
	{
        if(goBack == 8191)
            return goBack;
		// let the env-project handle all error messages - 	wizard.ReportError(e.description);
	}
    finally
    {
   		dte.SuppressUI = oldSuppressUIValue;
    }
}

function SetFileProperties( oFileItem, strFileName )
{
	var strExt = strFileName.substr(strFileName.lastIndexOf("."));
	if( strExt == ".xsd" )
	{
		oFileItem.Properties("CustomTool").Value = "MSDataSetCodeGenerator";
	}
}