//
// Copyright (c) Microsoft Corporation 2002. All rights reserved.
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

function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
    try
    {
        oldSuppressUIValue = dte.SuppressUI;
        var bSilent = wizard.FindSymbol("SILENT_WIZARD");
        dte.SuppressUI = bSilent;

        var strItemName = wizard.FindSymbol("ITEM_NAME");
        var strItemRoot = TrimExtension(strItemName);
        var strTemplatePath = LocalizeTemplatePath(wizard.FindSymbol("TEMPLATES_PATH"));

        var strTemplateFile;
       
        AddReferencesForMobileWebForm(selProj);
        AddDefaultWebFormsPropertiesToWizard(dte, wizard, selProj);
		AddNamespaceSymbolToWizard(dte, wizard, selObj);
        wizard.AddSymbol("SAFE_CLASS_NAME",
            ConstructUniqueClassNameForItem(selProj, strItemRoot));

        strTemplateFile = strTemplatePath + "\\MobileWebForm1.aspx.vb"; 
        var subItem = AddFileToVSProject(strItemName + ".vb", selProj, selObj, strTemplateFile, false);

        strTemplateFile = strTemplatePath + "\\MobileWebForm1.aspx"; 
        var item = AddFileToVSProject(strItemName, selProj, selObj, strTemplateFile, false);
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
    try
    {
        var codeType = codeModel.CodeTypeFromFullName(fullName);
    }
    catch(e)
    {
        // don't check HRESULT since C# returns E_FAIL
    }

    // Loop until an unused name is found by appending a number to the root
    var index = 0;
    var className = classNameRoot;
    while(codeType != null)
    {
        index++;
        className = classNameRoot + index;
        fullName = namespace + "." + className;
        codeType = null;
        codeType = codeModel.CodeTypeFromFullName(fullName);
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

function GetCSharpReferenceManager(oProj)
{
    try
    {
        var VSProject = oProj.Object;
        var refmanager = VSProject.References;
        return refmanager;
    }
    catch(e)
    {
        var L_ErrMsg29_Text = "Error finding an internal object. Please re-install or repair Visual Studio. ";
        wizard.ReportError(L_ErrMsg29_Text  + e.description);
    }
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
