// (c) 2001 Microsoft Corporation

var bCopyOnly = false;

var VS_E_WIZARDBACKBUTTONPRESS = -2147213313;

/******************************************************************************
 Description: Generates a C++ friendly name
     strName: The old, unfriendly name
******************************************************************************/
function CreateSafeName(strName)
{
	try
	{
		var nLen = strName.length;
		var strSafeName = "";
		
		for (nCntr = 0; nCntr < nLen; nCntr++)
		{
			var cChar = strName.charAt(nCntr);
			if ((cChar >= 'A' && cChar <= 'Z') || (cChar >= 'a' && cChar <= 'z') || 
					(cChar == '_') || (cChar >= '0' && cChar <= '9'))
			{
				// valid character, so add it
				strSafeName += cChar;
			}
			// otherwize, we skip it
		}
		if (strSafeName=="")
		{
			// if it's empty, we add My
			strSafeName = "My";
		}
		else if (strSafeName.charAt(0) >= '0' && strSafeName.charAt(0) <= '9')
		{
			// if it starts with a digit, we prepend My
			strSafeName = "My" + strSafeName;
		}
		return strSafeName;
	}
	catch(e)
	{   
		throw e;
	}
}

/******************************************************************************
 Description: Creates the Templates.inf file.
              Templates.inf is created based on TemplatesInf.txt and contains
			  a list of file names to be created by the wizard.
******************************************************************************/
function CreateInfFile()
{
	try
	{
		var oFSO, TemplatesFolder, TemplateFiles, strTemplate;
		oFSO = new ActiveXObject("Scripting.FileSystemObject");

		var TemporaryFolder = 2;
		var oFolder = oFSO.GetSpecialFolder(TemporaryFolder);

		var strTempFolder = oFSO.GetAbsolutePathName(oFolder.Path);
		var strWizTempFile = strTempFolder + "\\" + oFSO.GetTempName();

		var strTemplatePath = wizard.FindSymbol("TEMPLATES_PATH");
		var strInfFile = strTemplatePath + "\\Templates.inf";
		wizard.RenderTemplate(strInfFile, strWizTempFile);

		var oWizTempFile = oFSO.GetFile(strWizTempFile);
		return oWizTempFile;

	}
	catch(e)
	{   
		throw e;
	}
}

function OnFinish(selProj, selObj)
{	
	try
	{
		var strProjectPath = wizard.FindSymbol("PROJECT_PATH");
		var strProjectName = wizard.FindSymbol("PROJECT_NAME");
		var strProjTemplatePath = wizard.FindSymbol("PROJECT_TEMPLATE_PATH");
		var strSafeProjectName = CreateSafeName(strProjectName);
		var strProjTemplateFile = strProjTemplatePath + "\\default.vbdproj"; 
		wizard.AddSymbol("SAFE_PROJECT_NAME", strSafeProjectName);
		var proj = CreateEVBProject(strProjectName, strProjectPath, strProjTemplateFile);
		var InfFile = CreateInfFile();
		if (proj)
		{
			AddFilesToEVBProject(proj, strProjectName, strProjectPath, InfFile, false, "");
			proj.Properties("OutputFileFolder").Value= "\\Program Files\\" + strProjectName;
			InfFile.Delete();
		} 

	}
	catch(e)
	{
		if (e.number!=VS_E_WIZARDBACKBUTTONPRESS)
			wizard.ReportError(e.description);
		else
			return VS_E_WIZARDBACKBUTTONPRESS;
	}
    
}

function GetVBTargetName(strName, strProjectName)
{
	var strTarget = strName;

	switch (strName)
	{
		case "readme.txt":
			strTarget = "ReadMe.txt";
			break;
		case "File1.vb":
			strTarget = "Form1.vb";
			break;
		case "assemblyinfo.vb":
			strTarget = "AssemblyInfo.vb";
			break;

	}
	return strTarget; 
}

//We may need to do project specific processing here. But we should not need to open to a particular file when we get the designers in. 
//So we will wait on this - Roy
function DoOpenFile(strName)
{
	var bOpen = false;
    
	switch (strName)
	{
		case "Form1.vb":
		case "UserControl1.vb":
		case "Module1.vb":
		case "Class1.vb":
			bOpen = true;
			break;
	}
	return bOpen; 
}

function SetFileProperties( oFileItem, strFileName )
{
	oFileItem.Properties("SubType").Value = strFileName == "Form1.vb" ? "Form" : "Code";
}

//CreateCSharpProject in common.js has a the project type (.csproj) hard coded.  If they could use the "PROJECT_TYPE" 
//variable then we could use it. For now we are using a custom method.
function CreateEVBProject(strProjectName, strProjectPath, strProjTemplate)
{
	try
	{
		var Solution = dte.Solution;
		var strSolutionName = "";
		if (wizard.FindSymbol("CLOSE_SOLUTION"))
		{
			Solution.Close();
			strSolutionName = wizard.FindSymbol("VS_SOLUTION_NAME");
			if (strSolutionName.length)
			{

				var strSolutionPath = strProjectPath.substr(0, strProjectPath.length - strProjectName.length);
				Solution.Create(strSolutionPath, strSolutionName);
			}
		}
        
        var strProjectType = wizard.FindSymbol("PROJECT_TYPE");
        strProjectNameWithExt = strProjectName + "." + strProjectType;
       
		var oTarget = wizard.FindSymbol("TARGET");
		var oPrj;
		
		if (wizard.FindSymbol("WIZARD_TYPE") == vsWizardAddSubProject)  // vsWizardAddSubProject
		{
            		var nPos = strProjectPath.search("http://");
            		var prjItem
            		if(nPos == 0)
                		prjItem = oTarget.AddFromTemplate(strProjTemplate, strProjectPath + "/" + strProjectNameWithExt);    
           		else
			    prjItem = oTarget.AddFromTemplate(strProjTemplate, strProjectPath + "\\" + strProjectNameWithExt);
			oPrj = prjItem.SubProject;
		}
		else
		{
			oPrj = oTarget.AddFromTemplate(strProjTemplate, strProjectPath, strProjectNameWithExt);
		}
		var strNameSpace = "";
		strNameSpace = oPrj.Properties("RootNamespace").Value;
		wizard.AddSymbol("SAFE_NAMESPACE_NAME",  strNameSpace);

		return oPrj;
	}
	catch(e)
	{
        if(e.number != -2147221492 && e.number != -2147024816 && e.number!=VS_E_WIZARDBACKBUTTONPRESS)  //OLE_E_PROMPTSAVECANCELLED (0x8004000CL)
    		wizard.ReportError(e.description);
	if (e.number == VS_E_WIZARDBACKBUTTONPRESS)
		throw e;
	}
}

// cloned from common.js for the M1 milestone since we dont yet have designers
// REVIEW - nandu - remove this function after M1
function AddFilesToEVBProject(oProj, strProjectName, strProjectPath, InfFile, AddItemFile, strDesigner)
{
    // we'll need this later
    var strRawGuid = wizard.CreateGuid();
    wizard.AddSymbol("GUID_ASSEMBLY", wizard.FormatGuid(strRawGuid, 0));
    
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
                    strTarget = GetVBTargetName(strName, strProjectName);
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

                var strTemplate = strTemplatePath + "\\" + strTpl;
                var strFile = strTempFolder + "\\" + strTarget;

                var strClassName = strTarget.split(".");
                wizard.AddSymbol("SAFE_CLASS_NAME", CreateSafeName(strClassName[0]));
                wizard.AddSymbol("SAFE_ITEM_NAME", CreateSafeName(strClassName[0]));

                var strTemplate = strTemplatePath + "\\" + strTpl;
		SafeDeleteFile(fso, strFile);
		wizard.RenderTemplate(strTemplate, strFile, bCopyOnly);
                var projfile = projItems.AddFromTemplate(strFile, strTarget);
                SafeDeleteFile(fso, strFile);
                if(projfile)
                    SetFileProperties(projfile, strName);

		if(strName == "Form1.vb") oProj.Properties("StartupObject").Value = oProj.Properties("RootNamespace").Value + "." + wizard.FindSymbol("SAFE_CLASS_NAME");

                var bOpen = false;
                if(AddItemFile)
                    bOpen = true;
                else if (DoOpenFile(strTarget))
                    bOpen = true;

                if(bOpen)
                {
                    var window = projfile.Open(vsViewKindPrimary);
                    window.visible = true;
                }
            }
        }
        strTextStream.Close();
    }
    catch(e)
    {
        if(e.number == -2147024816)
            return 8191;                    // go back to the new item dialog
        if(e.number != -2147221492  && e.number != -2147024816)  //OLE_E_PROMPTSAVECANCELLED (0x8004000CL)
            wizard.ReportError(e.description);
    }
}



