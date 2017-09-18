//
// Copyright (c) Microsoft Corporation. All rights reserved.
//

function LocalizeTemplatePath(templatePath)
{
    var rex = /^(.*\\)(\d{4})(\\)?$/;
    if(rex.exec(templatePath) == null)
    {
        wizard.ReportError("templatePath was not of expected format.");
    }

    var localizedPath = RegExp.$1 + dte.LocaleID + RegExp.$3;
    fso = new ActiveXObject("Scripting.FileSystemObject");
    if(fso.FolderExists(localizedPath))
    {
        templatePath = localizedPath;
    }
    return templatePath;
}

function AddFileToVSProject(strItemName, selProj, selObj, strTemplateFile, bValidate)
{
    AddBaseNameToWizard("SAFE_ITEM_NAME", strItemName, ".");

    if( bValidate )
    {
        var strSafeName = wizard.FindSymbol( "SAFE_ITEM_NAME" );
        if( !wizard.ValidateCLRIdentifier( strSafeName, false ))
        {
            strSafeName = "_" + strSafeName;
            wizard.AddSymbol("SAFE_ITEM_NAME", strSafeName);
        }
    }

    var isReferenceExpanded;
    if(selProj != null) 
        isReferenceExpanded = IsReferenceExpanded(selProj);

    // Get project item for selObj collection
    var folder = selObj.parent;

    var strURL = folder.Properties("URL").Value;
    if (strURL.length > 0) //if a web project
        var strProjectPath = folder.Properties("LocalPath");
    else
        var strProjectPath = folder.Properties("FullPath");

    var strItemFile = strProjectPath + strItemName;

    var fsoTemporaryFolder = 2;
    fso = new ActiveXObject("Scripting.FileSystemObject");
    var tFolder = fso.GetSpecialFolder(fsoTemporaryFolder);
    var strTempName = fso.GetTempName();
    var strTempFile = tFolder.Path + "\\" + strTempName;
    SafeDeleteFile(fso, strTempFile);
    wizard.RenderTemplate(strTemplateFile, strTempFile, false);
    var item = folder.ProjectItems.AddFromTemplate(strTempFile, strItemName );
    SafeDeleteFile(fso, strTempFile);

    if(selProj != null)
    {
        if(isReferenceExpanded == true)
 	    ExpandReferencesNode(selProj);
        else
            CollapseReferencesNode(selProj);
    }

    return item;
}

function AddBaseNameToWizard( strName, strValue, strDelim )
{
    var strLegalItemName;
    var nIndex = strValue.lastIndexOf(strDelim);
    if( nIndex > 0 )
        strLegalItemName = strValue.substr(0, nIndex);
    else
        strLegalItemName = strValue;
    wizard.AddSymbol(strName, CreateLegalIdentifier(strLegalItemName));
}

function SafeDeleteFile( fso, strFilespec )
{
	if (fso.FileExists(strFilespec))
	{
		var tmpFile = fso.GetFile(strFilespec);
		tmpFile.Delete();
	}
}


function CreateLegalIdentifier(strName)
{
    var nLen = strName.length;
    var strLegalName = "";
    var cChar = strName.charAt(0);
    switch(cChar)
    {
        case "0":
        case "1":
        case "2":
        case "3":
        case "4":
        case "5":
        case "6":
        case "7":
        case "8":
        case "9":
            strLegalName += "_";
            break;
    }
    for (nCntr = 0; nCntr < nLen; nCntr++)
    {
        cChar = strName.charAt(nCntr);
        switch(cChar)
        {
            case " ":
            case "~":
            case "&":
            case "'":
            case "#":
            case "!":
            case "@":
            case "$":
            case "%":
            case "^":
            case "(":
            case ")":
            case "-":
            case "+":
            case "=":
            case "{":
            case "}":
            case "[":
            case "]":
            case ";":
            case ",":
            case "`":
            case ".":
                strLegalName += "_";
                break;
            default:
                strLegalName += cChar;
                break;
        }
    }
    return strLegalName;
}

function ReplaceDots(strName)
{
    var nLen = strName.length;
    var strLegalName = "";
    for (nCntr = 0; nCntr < nLen; nCntr++)
    {
        var cChar = strName.charAt(nCntr);
        if (cChar == ".")
                strLegalName += "_";
        else
                strLegalName += cChar;
    }
    return strLegalName;
}

function IsReferenceExpanded(oProj)
{
    UIItem = GetUIReferencesNode(oProj);
    if( UIItem != null )
        return UIItem.Expanded;
}		

function ExpandReferencesNode(oProj)
{
    UIItem = GetUIReferencesNode(oProj);
    if( UIItem != null )
        UIItem.Expanded = true;
}

function CollapseReferencesNode(oProj)
{
    UIItem = GetUIReferencesNode(oProj);
    if( UIItem != null )
        UIItem.Expanded = false;
}

function GetUIReferencesNode(oProj)
{
    var L_strREferencesNode_Text = "References"; // This string needs to be localized
    var UIItemX = null;

    UIItemX = GetUIItem( oProj, L_strREferencesNode_Text);
    if( UIItemX )
        return UIItemX.UIHierarchyItems;
    else
        return null;
}

function GetUIItem( oProj, sName )
{
    try
    {
        if( sName != "" )
        {
            sSaveName = sName;
            sName = oProj.Name + "\\" + sSaveName;
        }
        else
        {
            sName = oProj.Name;
        }

        var parent = getParent( oProj );

        while( parent != null )
        {
            sSaveName = sName;
            sName = parent.Name + "\\" + sSaveName;
            parent = getParent( parent );

        }

        //
        // we have arrived at the top of the soltuion explorer hierarchy - return the sName index into the solution's UIHierarchyItem collection
        //
        var strSolutionName = dte.Solution.Properties("Name");
        var vsHierObject = dte.Windows.Item(vsWindowKindSolutionExplorer).Object;   
        return vsHierObject.GetItem( strSolutionName + "\\" + sName );
    }	
    catch(e)
    {
        return null;
    }
}

function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
    try
    {
        oldSuppressUIValue = dte.SuppressUI;
        dte.SuppressUI = false;

        var strProjectName = wizard.FindSymbol("PROJECT_NAME");
        var strProjectPath = wizard.FindSymbol("PROJECT_PATH");
        var strTemplatePath = LocalizeTemplatePath(wizard.FindSymbol("TEMPLATES_PATH"));

        // Next few lines intentionally different than VB project
        strTemplateFile = "CSharpMobileWebAppWiz\\Templates\\" + dte.LocaleID + "\\defaultwebproject.csproj"; 	
        var project = CreateCSharpProject(strProjectName, strProjectPath, strTemplateFile);
        AddReferencesForWebForm(project);
        AddReferencesForMobileWebForm(project);
        
        if( project )
        {
            strProjectName = project.Name;  //In case it got changed

            var item;
            var editor;

            strNameSpace = project.Properties("RootNamespace").Value;
            wizard.AddSymbol("ITEM_NAME", "MobileWebForm1.aspx");
            wizard.AddSymbol("NAMESPACE", strNameSpace);
            wizard.AddSymbol("SAFE_CLASS_NAME", "MobileWebForm1");

            strTemplateFile = strTemplatePath + "\\Global.asax"; 
            item = AddFileToVSProject("Global.asax", project, project.ProjectItems, strTemplateFile, false);

            if( !DoesFileExistInProj( project, "Web.config" ) )
            {
                strTemplateFile = strTemplatePath + "\\Web.config"; 
                item = AddFileToVSProject("Web.config", project, project.ProjectItems, strTemplateFile, false);
            }

            var strRawGuid = wizard.CreateGuid();
            wizard.AddSymbol("GUID_ASSEMBLY", wizard.FormatGuid(strRawGuid, 0));

            strTemplateFile = strTemplatePath + "\\AssemblyInfo.cs"; 
            item = AddFileToVSProject("AssemblyInfo.cs", project, project.ProjectItems, strTemplateFile, false);
            if( item )
            {
                item.Properties("SubType").Value = "Code";
            }

//            AddDefaultWebFormsPropertiesToWizard(dte, wizard, project);
            strTemplateFile = strTemplatePath + "\\MobileWebForm1.aspx.cs";
            var subItem = AddFileToVSProject("MobileWebForm1.aspx.cs", project, project.ProjectItems, strTemplateFile, false);
            
            strTemplateFile = strTemplatePath + "\\MobileWebForm1.aspx"; 
            item = AddFileToVSProject("MobileWebForm1.aspx", project, project.ProjectItems, strTemplateFile, false);
            subItem.Properties("SubType").Value = "ASPXCodeBehind";

            var configs = new Enumerator(project.ConfigurationManager);
            for(;!configs.atEnd();configs.moveNext())
            {
                configs.item().Properties("StartPage").Value = "MobileWebForm1.aspx";
            }
            editor = item.Open(vsViewKindPrimary);
            editor.Visible = true;
        }
        
        return 0;
    }
    catch(e)
    {   
        switch(e.number)
        {
        case -2147024816 /* FILE_ALREADY_EXISTS */ :
            return -2147213313;

        default:
            SetErrorInfo(e);
            return e.number;
        }
    }
    finally
    {
   		dte.SuppressUI = oldSuppressUIValue;
    }
}

function DoOpenFile(strName)
{
    var bOpen = false;
    
    switch (strName)
    {
        case "MobileWebForm1.aspx":
            bOpen = true;
            break;
    }
    return bOpen; 
}

function SetFileProperties(oFileItem, strFileName)
{
    if(strFileName == "MobileWebForm1.aspx")
    {
        oFileItem.Properties("SubType").Value = "Form";
    }
    if(strFileName == "Global.asax")
    {
        oFileItem.Properties("SubType").Value = "Component";
    }
}

function AddReferencesForMobileWebForm(oProj)
{
	// try/catch commented out in common.js (9212)

    // try
    // {
        var refmanager = GetCSharpReferenceManager(oProj);
        var bExpanded = IsReferencesNodeExpanded(oProj)
        refmanager.Add("System.Web.Mobile");
        if(!bExpanded)
            CollapseReferencesNode(oProj);
    // }
    // catch(e)
    // {
    //     var L_ErrMsg36_Text ="Error in adding references for WebMobileForm: ";
    //     wizard.ReportError( L_ErrMsg36_Text + e.description);
    //  }
}
