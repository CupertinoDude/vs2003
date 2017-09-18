// (c) 2001 Microsoft Corporation
/******************************************************************************
 Description: 
       oProj: Project object
******************************************************************************/
//eCSHARP : clone function from common.js. Don't collapse the References node
function AddReferencesForComponent1(oProj)
{
	try
	{
		var refmanager = GetCSharpReferenceManager(oProj);
//        var bExpanded = IsReferencesNodeExpanded(oProj)
		refmanager.Add("System");
//        if(!bExpanded)
//            CollapseReferencesNode(oProj);
	}
	catch(e)
	{
        var L_ErrMsg31_Text = "Error in adding references for Component: ";
		wizard.ReportError( L_ErrMsg31_Text + e.description);
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
		var strSafeProjectName = CreateSafeName(strProjectName);
		wizard.AddSymbol("SAFE_PROJECT_NAME", strSafeProjectName);
		SetTargetFullPath(selObj);
		var strProjectPath		= wizard.FindSymbol("TARGET_FULLPATH");
		var strTemplatePath		= wizard.FindSymbol("TEMPLATES_PATH");

		var strTpl = "";
		var strName = "";
		var InfFile = CreateInfFile();
		AddReferencesForComponent1(selProj);
		goBack = AddFilesToECSharpProject(selObj, strProjectName, strProjectPath, InfFile, true, "Component" );

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
	if( strFileName == "NewComponent.cs" )
	{
		oFileItem.Properties("SubType").Value = "Component";
	}
}

/******************************************************************************
    Description: Adds all the files to the project based on the Templates.inf file.
          oProj: Project object
 strProjectName: Project name
 strProjectPath: Project path
        InfFile: Templates.inf file object
    AddItemFile: Wether the wizard is invoked from the Add Item Dialog or not
******************************************************************************/
function AddFilesToECSharpProject(oProj, strProjectName, strProjectPath, InfFile, AddItemFile)
{
	try
	{
		var projItems;
		if(AddItemFile)
	  	    projItems = oProj;
		else
	  	    projItems = oProj.ProjectItems;

		var strTemplatePath = wizard.FindSymbol("TEMPLATES_PATH");

		var strTpl = "";
		var strName = "";

		// if( Not a web project )
		if(strProjectPath.charAt(strProjectPath.length - 1) != "\\")
		    strProjectPath += "\\";	

		var strTextStream = InfFile.OpenAsTextStream(1, -2);
		while (!strTextStream.AtEndOfStream)
		{
			strTpl = strTextStream.ReadLine();
			if (strTpl != "")
			{
				strName = strTpl;
				bCopyOnly = false;
				var strTarget = "";
				var strFile = "";
				if(!AddItemFile)
				{
					strTarget = GetCSharpTargetName(strName, strProjectName);
				}
				else
				{
					strTarget = wizard.FindSymbol("ITEM_NAME");
				}

				var fso;
				fso = new ActiveXObject("Scripting.FileSystemObject");
				var TemporaryFolder = 2;
				var tfolder = fso.GetSpecialFolder(TemporaryFolder);
				var strTempFolder = fso.GetAbsolutePathName(tfolder.Path);

				var strFile = strTempFolder + "\\" + strTarget;

				var strClassName = strTarget.split(".");

				wizard.AddSymbol("SAFE_CLASS_NAME", strClassName[0]);
	    			wizard.AddSymbol("SAFE_ITEM_NAME", strClassName[0]);

				var strTemplate = strTemplatePath + "\\" + strTpl;
				wizard.RenderTemplate(strTemplate, strFile, bCopyOnly);
				var projfile = projItems.AddFromTemplate(strFile, strTarget);
				DeleteFile(fso, strFile);
				if(projfile)
					SetFileProperties(projfile, strName);

				var bOpen = false;
				if(AddItemFile)
					bOpen = true;
				else if (DoOpenFile(strTarget))
					bOpen = true;

				if(bOpen)
				{
					var window = projfile.Open(vsViewKindCode);
					window.visible = true;
				}
			}
		}
		strTextStream.Close();
	}
	catch(e)
	{
		if( e.number == VS_E_WIZARDBACKBUTTONPRESS || e.number == FILE_ALREADY_EXISTS)
			return VS_E_WIZARDBACKBUTTONPRESS;  // go back to the new item dialog

		if(e.number == OLE_E_PROMPTSAVECANCELLED)
			return 0;

		// some other error, report the error
		wizard.ReportError(e.description);

		// if we were adding a file, return to the new item dlg
		if (AddItemFile)
			return VS_E_WIZARDBACKBUTTONPRESS;  // go back to the new item dialog
	}
}
