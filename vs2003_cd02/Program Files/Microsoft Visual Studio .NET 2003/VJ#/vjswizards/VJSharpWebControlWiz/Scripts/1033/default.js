// (c) Microsoft Corporation

function OnFinish(selProj, selObj)
{
	var oldSuppressUIValue = true;
	try
	{
		oldSuppressUIValue = dte.SuppressUI;

		var strProjectPath = wizard.FindSymbol("PROJECT_PATH");
		var strProjectName = wizard.FindSymbol("PROJECT_NAME");
		var strSafeProjectName = CreateSafeName(strProjectName);
		wizard.AddSymbol("SAFE_PROJECT_NAME", strSafeProjectName);

		var bEmptyProject = 0; //wizard.FindSymbol("EMPTY_PROJECT");

		var proj = CreateBJProject(strProjectName, strProjectPath, "DefaultDll.vjsproj");

		var InfFile = CreateInfFile();
		if (!bEmptyProject && proj)
		{
		    AddReferencesForWebControl(proj);
		AddFilesToBJProject(proj, strProjectName, strProjectPath, InfFile, false);
		}
		proj.Save();
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

function GetBJTargetName(strName, strProjectName)
{
	var strTarget = strName;

	switch (strName)
	{
		case "readme.txt":
			strTarget = "ReadMe.txt";
			break;
		case "assemblyinfo":
			strTarget = "AssemblyInfo";
			break;
		case "webcontrol":
			strTarget = "WebCustomControl1";
			break;
	}
	return strTarget; 
}

function DoOpenFile(strName)
{
	var bOpen = false;
    
 	switch (strName)
	{
		case "webcontrol":
			bOpen = true;
			break;
	}

    return bOpen; 
}

function SetFileProperties( oFileItem, strFileName )
{
    if(strFileName == "webcontrol")
	{
		oFileItem.Properties("SubType").Value = "Code";
	}
}
