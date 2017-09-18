
function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
	try
	{
        oldSuppressUIValue = dte.SuppressUI;

		var strProjectPath = wizard.FindSymbol("PROJECT_PATH");
		var strProjectName = wizard.FindSymbol("PROJECT_NAME");

		var bEmptyProject = 0; //wizard.FindSymbol("EMPTY_PROJECT");

		var proj = CreateCSharpProject(strProjectName, strProjectPath, "..\\projects\\csharp building blocks\\" + wizard.FindSymbol("EFT_PROTOTYPE") );
		// use the new project name, for cases where the creation process renamed the project
		strProjectName = proj.Name;

		var InfFile = CreateInfFile();
		if (!bEmptyProject && proj)
		{
			AddReferencesForWebService(proj);
			AddDesignerFileToCSharpWebProject(proj, strProjectName, strProjectPath, "WebService.asmx", false);
			AddDesignerFileToCSharpWebProject(proj, strProjectName, strProjectPath, "Global.asax", false);
			AddFilesToCSharpProject(proj, strProjectName, strProjectPath, InfFile, false);
			SetStartupPage(proj, "Service1.asmx");
			CollapseReferencesNode(proj);
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
		case "WebService.asmx":
			strTarget = "Service1.asmx";
			break;
		case "assemblyinfo.cs":
			strTarget = "AssemblyInfo.cs";
			break;
		case "Global.asax":
			strTarget = "Global.asax";
			break;
		case "Web.config":
			strTarget = "Web.config";
			break;
	}
	return strTarget; 
}

function DoOpenFile(strName)
{
	var bOpen = false;
    
 	switch (strName)
	{
		case "Service1.asmx":
			bOpen = false;
			break;
	}

    return bOpen; 
}

function SetFileProperties(oFileItem, strFileName)
{
    if(strFileName == "WebService.asmx")
    {
        oFileItem.Properties("SubType").Value = "Form";
    }

    if(strFileName == "Global.asax")
    {
        oFileItem.Properties("SubType").Value = "Component";
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