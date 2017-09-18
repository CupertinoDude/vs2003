// (c) 2001 Microsoft Corporation
/******************************************************************************
 Description: 
       oProj: Project object
******************************************************************************/
//eCSHARP : clone function from common.js. Don't collapse the References node
function AddReferencesForWinForm1(oProj)
{
	try
	{
		var refmanager = GetCSharpReferenceManager(oProj);
//        var bExpanded = IsReferencesNodeExpanded(oProj)
		refmanager.Add("System");
		refmanager.Add("System.Drawing");
		refmanager.Add("System.Windows.Forms");
		refmanager.Add("System.XML");
//        if(!bExpanded)
//            CollapseReferencesNode(oProj);
	}
	catch(e)
	{
        var L_ErrMsg33_Text ="Error in adding references for Windows form: ";
		wizard.ReportError( L_ErrMsg33_Text + e.description);
	}
}

function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
    var goBack;
	try
	{
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

		AddReferencesForWinForm1(selProj);
		goBack = AddFilesToCSharpProject(selObj, strProjectName, strProjectPath, InfFile, true, "Form");

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
	if( strFileName == "eNewWFCForm.cs" )
	{
		oFileItem.Properties("SubType").Value = "Form";
	}
}
