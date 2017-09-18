// (c) 2001 Microsoft Corporation
//eCSHARP : clone function from common.js. Don't collapse the References node
function AddReferencesForClass1(oProj)
{
	try
	{
		var refmanager = GetCSharpReferenceManager(oProj);
//        var bExpanded = IsReferencesNodeExpanded(oProj)
		refmanager.Add("MSCorLib");
		refmanager.Add("System");
		refmanager.Add("System.XML");
//        if(!bExpanded)
//            CollapseReferencesNode(oProj);
	}
	catch(e)
	{
	    var L_ErrMsg30_Text = "Error in adding references for Class: ";
		wizard.ReportError( L_ErrMsg30_Text + e.description);
	}
}


function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
    var goBack;
	try
	{
        oldSuppressUIValue = dte.SuppressUI;
		var strProjectName 	= wizard.FindSymbol("PROJECT_NAME");
		var strSafeProjectName 	= CreateSafeName(strProjectName);
		wizard.AddSymbol("SAFE_PROJECT_NAME", strSafeProjectName);
		SetTargetFullPath(selObj);
		var strProjectPath	= wizard.FindSymbol("TARGET_FULLPATH");
		var strTemplatePath 	= wizard.FindSymbol("TEMPLATES_PATH");

		var strTpl = "";
		var strName = "";
		var InfFile = CreateInfFile();
		AddReferencesForClass1(selProj);
		goBack = AddFilesToCSharpProject(selObj, strProjectName, strProjectPath, InfFile, true, "");
		InfFile.Delete();
	}
	catch(e)
	{
        if(goBack == 8191)
            return goBack;
		// let the env-project handle all error messages - wizard.ReportError(e.description);
	}
    finally
    {
   		dte.SuppressUI = oldSuppressUIValue;
    }
}

function SetFileProperties( oFileItem, strFileName )
{
}