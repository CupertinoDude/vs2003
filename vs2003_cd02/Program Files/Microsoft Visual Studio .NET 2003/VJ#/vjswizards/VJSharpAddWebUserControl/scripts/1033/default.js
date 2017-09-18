// (c) Microsoft Corporation
function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
    var goBack;
	try
	{
		var strTarget = wizard.FindSymbol("ITEM_NAME");
		var strClassName = strTarget.split(".");
		var bValid = wizard.ValidateCLRIdentifier(strClassName[0]);
		if (!bValid)
		{
			wizard.ReportError();
			return VS_E_WIZARDBACKBUTTONPRESS;
		}

	        oldSuppressUIValue = dte.SuppressUI;
		var strProjectName		= wizard.FindSymbol("PROJECT_NAME");
		var strSafeProjectName 		= CreateSafeName(strProjectName);
		wizard.AddSymbol("SAFE_PROJECT_NAME", strSafeProjectName);
		SetTargetFullPath(selObj);
		var strProjectPath		= wizard.FindSymbol("TARGET_FULLPATH");
		var strTemplatePath		= wizard.FindSymbol("TEMPLATES_PATH");

		var strTpl = "";
		var strName = "";
		var InfFile = CreateInfFile();

		AddDefaultTargetSchemaToWizard(selProj);

		goBack = AddFilesToBJProject(selObj, strProjectName, strProjectPath, InfFile, true);
        if (goBack == VS_E_WIZARDBACKBUTTONPRESS)
            return goBack;

		InfFile.Delete();
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
    if(strFileName == "WebUserControl.ascx")
    {
        oFileItem.Properties("SubType").Value = "UserControl";
    }
}
