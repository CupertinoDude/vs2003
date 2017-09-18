// (c) 2001 Microsoft Corporation

var bCopyOnly = false;


function OnFinish(selProj, selObj)
{	
	try
	{
		var strProjectPath = wizard.FindSymbol("PROJECT_PATH");
		var strProjectName = wizard.FindSymbol("PROJECT_NAME");
		var strProjTemplatePath = wizard.FindSymbol("PROJECT_TEMPLATE_PATH");
		var strSafeProjectName = CreateSafeName(strProjectName);
		var strProjTemplateFile = strProjTemplatePath + "\\default.csdproj"; 
		wizard.AddSymbol("SAFE_PROJECT_NAME", strSafeProjectName);
		var proj = CreateECSharpProject(strProjectName, strProjectPath, strProjTemplateFile);
		var InfFile = CreateInfFile();
		if (proj)
		{
			AddFilesToECSharpProject(proj, strProjectName, strProjectPath, InfFile, false, "");
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

function GetCSharpTargetName(strName, strProjectName)
{
	var strTarget = strName;

	switch (strName)
	{
		case "readme.txt":
			strTarget = "ReadMe.txt";
			break;
		case "File1.cs":
			strTarget = "Form1.cs";
			break;
		case "assemblyinfo.cs":
			strTarget = "AssemblyInfo.cs";
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
		case "Form1.cs":
		case "UserControl1.cs":
		case "Module1.cs":
		case "Class1.cs":
			bOpen = true;
			break;
	}
	return bOpen; 
}

function SetFileProperties( oFileItem, strFileName )
{
	oFileItem.Properties("SubType").Value = strFileName == "Form1.cs" ? "Form" : "Code";
}

//CreateCSharpProject in common.js has a the project type (.csproj) hard coded.  If they could use the "PROJECT_TYPE" 
//variable then we could use it. For now we are using a custom method.
function CreateECSharpProject(strProjectName, strProjectPath, strProjTemplate)
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
    		wizard.ReportError(e.number);
	if (e.number == VS_E_WIZARDBACKBUTTONPRESS)
		throw e;
	}
}

// cloned from common.js for the M1 milestone since we dont yet have designers
// REVIEW - nandu - remove this function after M1
function AddFilesToECSharpProject(oProj, strProjectName, strProjectPath, InfFile, AddItemFile, strDesigner)
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

                var strTemplate = strTemplatePath + "\\" + strTpl;
                var strFile = strTempFolder + "\\" + strTarget;

                var strClassName = strTarget.split(".");
                wizard.AddSymbol("SAFE_CLASS_NAME", CreateSafeName(strClassName[0]));
                wizard.AddSymbol("SAFE_ITEM_NAME", CreateSafeName(strClassName[0]));

                var strTemplate = strTemplatePath + "\\" + strTpl;
                DeleteFile(fso, strFile);
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

function AddReferencesForPocketPCWinForm(oProj)
{
	try
	{
		var refmanager = GetCSharpReferenceManager(oProj);
        	var bExpanded = IsEReferencesNodeExpanded(oProj, "References"); // This string needs to be localized
		refmanager.Add("MSCorLib.dll");
		refmanager.Add("System.dll");
		refmanager.Add("System.Drawing.dll");
		refmanager.Add("System.Windows.Forms.dll");
		refmanager.Add("System.Data.dll");
		refmanager.Add("System.XML.dll");
        	if(!bExpanded)
            		CollapseEReferencesNode(oProj, "References"); // This string needs to be localized
	}
	catch(e)
    	{
        	var L_ErrMsg30_Text = "Error in adding references for Class: ";
        	wizard.ReportError( L_ErrMsg30_Text + e.description);
    	}
}


