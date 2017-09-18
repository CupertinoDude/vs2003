
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

		var proj = CreateCSharpProject(strProjectName, strProjectPath, "..\\projects\\csharp building blocks\\" + wizard.FindSymbol("EFT_PROTOTYPE") );

		var InfFile = CreateInfFile();
		if (!bEmptyProject)
		{
			AddReferencesForClass(proj);
			AddFilesToCSharpProject(proj, strProjectName, strProjectPath, InfFile, false);
		}
		proj.Save();
		CollapseProjectNode( proj );
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
			strTarget = "Class1.cs";
			break;
		case "assemblyinfo.cs":
			strTarget = "AssemblyInfo.cs";
			break;
	}
	return strTarget; 
}

function DoOpenFile(strName)
{
	return false;
}

function SetFileProperties(oFileItem, strFileName)
{
    if(strFileName == "File1.cs")
    {
        oFileItem.Properties("SubType").Value = "Code";
    }
}

function CollapseProjectNode( oProj )
{
    try
    {
	if( !IsSubProject( oProj ) )
        {
            return;
        }
	var UIItemX = GetUIItem( oProj, "" );
	UIItem = UIItemX.UIHierarchyItems;
	UIItem.Expanded = false;
    }
    catch(e)
    {}
}