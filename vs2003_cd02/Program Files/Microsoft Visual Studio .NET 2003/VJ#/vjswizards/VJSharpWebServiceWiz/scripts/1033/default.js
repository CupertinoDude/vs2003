// (c) Microsoft Corporation

function OnFinish(selProj, selObj)
{
	var oldSuppressUIValue = true;
	try
	{
		oldSuppressUIValue = dte.SuppressUI;

		var strProjectPath = wizard.FindSymbol("PROJECT_PATH");
		var strProjectName = wizard.FindSymbol("PROJECT_NAME");

		var bEmptyProject = 0; //wizard.FindSymbol("EMPTY_PROJECT");

		var proj = CreateBJProject(strProjectName, strProjectPath, "defaultwebproject.vjsproj");
		// use the new project name, for cases where the creation process renamed the project
		strProjectName = proj.Name;

		if( !ProjectIsARootWeb( strProjectPath ) )
		{
			wizard.AddSymbol("NOT_ROOT_WEB_APP", true);
		}

		// if a web.config file has already been added (via the ASP.NET
		// version conflict dialog), don't try to add another one
	    item = DoesFileExistInProj( proj,"Web.config" )
        if( item == null ) 
		{
			wizard.AddSymbol( "WEB_CONFIG_NOT_ADDED_YET", true );
		}
		else
		{
			wizard.AddSymbol( "WEB_CONFIG_NOT_ADDED_YET", false );
		}

		var InfFile = CreateInfFile();
		if (!bEmptyProject && proj)
		{
			AddReferencesForWebService(proj);
			AddDesignerFileToBJWebProject(proj, strProjectName, strProjectPath, "WebService.asmx", false);
			AddDesignerFileToBJWebProject(proj, strProjectName, strProjectPath, "Global.asax", false);
			AddFilesToBJProject(proj, strProjectName, strProjectPath, InfFile, false);
			SetStartupPage(proj, "Service1.asmx");
			CollapseReferencesNode(proj);

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
		case "WebService.asmx":
			strTarget = "Service1.asmx";
			break;
		case "assemblyinfo":
			strTarget = "AssemblyInfo";
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
		case "WebService.asmx":
			bOpen = true;
			break;
	}

    return bOpen; 
}


function SetFileProperties( oFileItem, strFileName )
{
	if( strFileName == "WebService.asmx" )
	{
		oFileItem.Properties("SubType").Value = "Form";
	}
	if( strFileName == "Global.asax" )
	{
		oFileItem.Properties("SubType").Value = "Component";
	}
}
