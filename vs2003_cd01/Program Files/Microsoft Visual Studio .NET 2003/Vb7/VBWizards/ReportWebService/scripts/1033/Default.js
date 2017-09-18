////////////////////////////////////////////////////////
//
// Copyright (c) Crystal Decisions, Inc. All rights reserved.
//
//
//  Script for the VB report web service wizard
//

var L_RptWebServWizError_ErrorFindingProjRefs = "Error finding project references. Please re-install or repair Visual Studio. ";
var L_RptWebServWizError_ErrorAddingRefs ="Error in adding references for the new report web service: ";


/////////////////////////////////////////////////


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
        wizard.ReportError( L_RptWebServWizError_ErrorFindingProjRefs + e.description);
    }
}


function AddReferencesForReportWebService( oProj )
{
    try
    {
        var refmanager = GetCSharpReferenceManager(oProj);
        var bExpanded = IsReferenceExpanded(oProj)
        refmanager.Add("System.Xml");
        refmanager.Add("CrystalDecisions.Shared");
        refmanager.Add("CrystalDecisions.CrystalReports.Engine");
        refmanager.Add("CrystalDecisions.ReportSource");
        refmanager.Add("CrystalDecisions.Web");
        if(!bExpanded)
            CollapseReferencesNode(oProj);
    }
    catch(e)
    {
        wizard.ReportError( L_RptWebServWizError_ErrorAddingRefs + e.description);
    }
}


function TrimExtension(fileName)
{
    var index = fileName.lastIndexOf(".");
    if(index >= 0)
    {
        fileName = fileName.substr(0, index);
    }
    return fileName; 
}

function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
    try
    {

        oldSuppressUIValue = dte.SuppressUI;
        dte.SuppressUI = true;

        var strItemName = wizard.FindSymbol("ITEM_NAME");


        var strItemRoot = TrimExtension( strItemName );
        wizard.AddSymbol("ITEM_ROOT", strItemRoot);

        var strTemplatePath = wizard.FindSymbol( "TEMPLATES_PATH" );

        AddNamespaceName( selObj );

        var strItemClassName = CreateLegalIdentifier( strItemRoot );
        wizard.AddSymbol("SAFE_REPORT_CLASS_NAME", strItemClassName );

        var strWebServiceSuffix = "Service";
        var strWebServiceClassName = strItemClassName + strWebServiceSuffix;
        wizard.AddSymbol("SAFE_CLASS_NAME", strWebServiceClassName );

        var strTemplateFile;

        strTemplateFile = strTemplatePath + "\\ReportWebService.asmx";
        var item = AddFileToVSProject( strItemRoot + strWebServiceSuffix + ".asmx",
                selProj, selObj, strTemplateFile );

        strTemplateFile = strTemplatePath + "\\ReportWebService.asmx.vb";
        AddFileToVSProject( strItemRoot + strWebServiceSuffix + ".asmx.vb",
                selProj, item.ProjectItems, strTemplateFile );

        AddReferencesForReportWebService( selProj );

    }
    catch(e)
    {
        if(e.number == -2147221492)         //OLE_E_PROMPTSAVECANCELLED (0x8004000CL)
            return 0;
        else if(e.number == -2147024816)    //FILE_ALREADY_EXISTS (0x80070050)
            return 8191;
        else
            wizard.ReportError(e.description);
    }
    finally
    {
        dte.SuppressUI = oldSuppressUIValue;
    }
}


function AddNamespaceName( oSelObjCollection )
{
    var parent = oSelObjCollection.Parent;
    var kind = parent.Kind;
    var strNameSpace = "";

    if ( kind == GUID_ItemType_PhysicalFolder || kind == GUID_ItemType_VirtualFolder )
    {
        strNameSpace = parent.Properties("DefaultNamespace").Value;
    }
    else
    {
        strNameSpace = parent.Properties("RootNamespace").Value;
    }
    wizard.AddSymbol("SAFE_NAMESPACE_NAME", strNameSpace);
}
