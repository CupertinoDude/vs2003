
function AddDefaultServerScriptToWizard(selProj)
{
	wizard.AddSymbol("DEFAULT_SERVER_SCRIPT", "JavaScript");
}

function AddDefaultClientScriptToWizard(selProj)
{
    var prjScriptLang = selProj.Properties("DefaultClientScript").Value;
    // 0 = JScript
    // 1 = VBScript
    if(prjScriptLang == 0)
    {
        wizard.AddSymbol("DEFAULT_CLIENT_SCRIPT", "JavaScript");
    }
    else
    {
        wizard.AddSymbol("DEFAULT_CLIENT_SCRIPT", "VBScript");
    }
}


function AddDefaultDefaultHTMLPageLayoutToWizard(selProj)
{
    var prjPageLayout = selProj.Properties("DefaultHTMLPageLayout").Value;
    // 0 = FlowLayout
    // 1 = GridLayout
    if(prjPageLayout == 0)
    {
        wizard.AddSymbol("DEFAULT_HTML_LAYOUT", "FlowLayout");
    }
    else
    {
        wizard.AddSymbol("DEFAULT_HTML_LAYOUT", "GridLayout");
    }
}

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

		var InfFile = CreateInfFile();
		if (!bEmptyProject && proj)
		{
			AddReferencesForWebForm(proj);

			// add the default project props for the aspx file before we
			// render it
			AddDefaultServerScriptToWizard(proj);
			AddDefaultClientScriptToWizard(proj);
			AddDefaultTargetSchemaToWizard(proj);
			AddDefaultDefaultHTMLPageLayoutToWizard(proj);

			// render our files
			AddDesignerFileToCSharpWebProject(proj, strProjectName, strProjectPath, "Global.asax", false);
			AddFilesToCSharpProject(proj, strProjectName, strProjectPath, InfFile, false);
			SetStartupPage(proj, "WebForm1.aspx");
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
		case "WebForm1.aspx":
			strTarget = "WebForm1.aspx";
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
	return false;
}
function SetFileProperties(oFileItem, strFileName)
{
    if(strFileName == "WebForm1.aspx")
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