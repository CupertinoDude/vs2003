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

		var proj = CreateBJProject(strProjectName, strProjectPath, "DefaultWinExe.vjsproj");

		var InfFile = CreateInfFile();
		if (!bEmptyProject)
		{
			AddReferencesForWinService(proj);
			AddFilesToBJProject(proj, strProjectName, strProjectPath, InfFile, false);
		}
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
		case "File1":
			strTarget = "Service1";
			break;
		case "assemblyinfo":
			strTarget = "AssemblyInfo";
			break;
	}
	return strTarget; 
}

function DoOpenFile(strName)
{
	var bOpen = false;
    
	switch (strName)
	{
		case "File1":
			bOpen = true;
			break;
	}
	return bOpen; 
}

function SetFileProperties( oFileItem, strFileName )
{
    if(strFileName == "File1")
	{
		oFileItem.Properties("SubType").Value = "Component";
	}
}
