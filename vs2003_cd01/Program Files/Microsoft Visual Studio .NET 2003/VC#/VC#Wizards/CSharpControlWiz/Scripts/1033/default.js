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

		var proj = CreateCSharpProject(strProjectName, strProjectPath, "defaultDll.csproj");

		var InfFile = CreateInfFile();
		if (!bEmptyProject && proj)
		{
			AddReferencesForControl(proj);
			AddFilesToCSharpProject(proj, strProjectName, strProjectPath, InfFile, false);
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

function GetCSharpTargetName(strName, strProjectName)
{
	var strTarget = strName;

	switch (strName)
	{
		case "readme.txt":
			strTarget = "ReadMe.txt";
			break;
		case "File1.cs":
			strTarget = "UserControl1.cs";
			break;
		case "assemblyinfo.cs":
			strTarget = "AssemblyInfo.cs";
			break;

	}
	return strTarget; 
}

function DoOpenFile(strName)
{
	var bOpen = false;
    
	switch (strName)
	{
		case "UserControl1.cs":
			bOpen = true;
			break;
	}
	return bOpen; 
}
function SetFileProperties(oFileItem, strFileName)
{
    if(strFileName == "File1.cs")
    {
        oFileItem.Properties("SubType").Value = "UserControl";
    }
}

