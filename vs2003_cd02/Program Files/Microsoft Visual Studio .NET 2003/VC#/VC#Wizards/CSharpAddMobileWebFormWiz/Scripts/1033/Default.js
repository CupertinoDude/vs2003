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

function AddNamespaceSymbolToWizard(dtex, wizardx, selObj) 
{
    var parent = selObj.Parent;
    var kind = parent.Kind;
    if(kind == GUID_ItemType_PhysicalFolder)
    {
        wizardx.AddSymbol("NAMESPACE", parent.Properties("DefaultNamespace").Value);
    }
    else
    {
        wizardx.AddSymbol("NAMESPACE", parent.Properties("RootNamespace").Value);
    }
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

function ReportError( strErr )
{
    if( dte.SuppressUI == false )
    {
        wizard.ReportError(strErr);
    }
}

function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
    try
    {
        oldSuppressUIValue = dte.SuppressUI;
        dte.SuppressUI = false;

        var strItemName = wizard.FindSymbol("ITEM_NAME");
        var strItemRoot = TrimExtension(strItemName);
        var strTemplatePath = LocalizeTemplatePath(wizard.FindSymbol("TEMPLATES_PATH"));

        var strTemplateFile;

        AddReferencesForWebForm(selProj);
		AddReferencesForMobileWebForm(selProj);
        // AddDefaultWebFormsPropertiesToWizard(dte, wizard, selProj);
		AddNamespaceSymbolToWizard(dte, wizard, selObj);
        wizard.AddSymbol("SAFE_CLASS_NAME",
            ConstructUniqueClassNameForItem(selProj, strItemRoot));

        strTemplateFile = strTemplatePath + "\\MobileWebForm1.aspx.cs";
        var subItem = AddFileToVSProject(strItemRoot + ".aspx.cs", selProj, selObj, strTemplateFile, false);

        strTemplateFile = strTemplatePath + "\\MobileWebForm1.aspx";
        var item = AddFileToVSProject(strItemRoot + ".aspx", selProj, selObj, strTemplateFile, false);
        subItem.Properties("SubType").Value = "ASPXCodeBehind";
        if( item )
        {
            var editor = item.Open(vsViewKindPrimary);
            editor.Visible = true;
        }
        
        return 0;
    }
    catch(e)
    {   
        switch(e.number)
        {
        case -2147221492 /* OLE_E_PROMPTSAVECANCELLED */ :
            return -2147221492;

        case -2147024816 /* FILE_ALREADY_EXISTS */ :
        case -2147213313 /* VS_E_WIZARDBACKBUTTONPRESS */ :
            return -2147213313;

        default:
            ReportError(e.description);
            return -2147213313;
        }
    }
    finally
    {
        dte.SuppressUI = oldSuppressUIValue;
    }
}

function CodeTypeFromFullName(codeModel, fullName)
{
    var codeType = null;
    try
    {
        codeType = codeModel.CodeTypeFromFullName(fullName);
    }
    catch(e)
    {
        // don't check HRESULT since C# returns E_FAIL
    }
    return codeType;
}

function ConstructUniqueClassNameForItem(selProj, classNameRoot)
{
    classNameRoot = ConvertToIdentifier(classNameRoot);
    var codeModel = selProj.CodeModel;

    // Check if root is a keyword
    if (!codeModel.IsValidID(classNameRoot))
    {
        // Prepend an underscore 
        classNameRoot = "_" + classNameRoot;
    }

    // Check if the root is unused
    var namespace = wizard.FindSymbol("NAMESPACE");
    var fullName = namespace + "." + classNameRoot;
    var codeType = CodeTypeFromFullName(codeModel, fullName);
 
    // Loop until an unused name is found by appending a number to the root
    var index = 0;
    var className = classNameRoot;
    while(codeType != null)
    {
        index++;
        className = classNameRoot + index;
        fullName = namespace + "." + className;
        codeType = CodeTypeFromFullName(codeModel, fullName);
    }

    return className;
}

function IsAlpha(char)
{
    if((char >= 'a' && char <= 'z') || (char >= 'A' && char <='Z'))
    {
        return true;
    }
    return false;
}

function IsDigit(char)
{
    if(char >= '0' && char <= '9')
    {
        return true;
    }
    return false;
}

function ConvertToIdentifier(strIn)
{
    var id = "";
    
    if (!IsAlpha(strIn) || (strIn.toLowerCase() == "default")) // special case for VB keyword which is a common aspx name
    {
        id = id.concat("_");
    }
  
    // Write out letters and digits, substitute underscores for everything else
    for (i = 0; i < strIn.length; i++)
    {
        var char = strIn.charAt(i);
        if (IsAlpha(char) || IsDigit(char))
        {
            id = id.concat(char);
        }
        else
        {
            id = id.concat("_");
        }
    }
    return id;
}

function AddReferencesForMobileWebForm(oProj)
{
    try
    {
        var refmanager = GetCSharpReferenceManager(oProj);
        var bExpanded = IsReferenceExpanded(oProj)
        refmanager.Add("System.Web.Mobile");
        if(!bExpanded)
            CollapseReferencesNode(oProj);
    }
    catch(e)
    {
        var L_ErrMsg36_Text ="Error in adding references for Mobile Web Form: ";
        wizard.ReportError( L_ErrMsg36_Text + e.description);
    }
}

function TrimExtension(fileName)
{
    var index = fileName.lastIndexOf(".aspx");
    if(index >= 0)
    {
        fileName = fileName.substr(0, index);
    }
    return fileName; 
}
