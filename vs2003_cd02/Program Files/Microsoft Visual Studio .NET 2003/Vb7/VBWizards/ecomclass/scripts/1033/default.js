function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
    try
    {
        oldSuppressUIValue = dte.SuppressUI;
        var bSilent = wizard.FindSymbol("SILENT_WIZARD");
        dte.SuppressUI = bSilent;

        var strItemName = wizard.FindSymbol("ITEM_NAME");
        var strTemplatePath = wizard.FindSymbol("TEMPLATES_PATH");
        var strTemplateFile = strTemplatePath + "\\ComClass.vb";

        // Programmatic Identifiers
        var strSafeName = strItemName.split(".");
        var strClassName = CreateLegalIdentifier(strSafeName[0]);
        wizard.AddSymbol("CLASS_NAME", strClassName);
        wizard.AddSymbol("INTERFACE_NAME", strClassName+"Interface");
        wizard.AddSymbol("EVENTS_NAME", strClassName+"Events");

        // GUIDS
        var strRawGuid = wizard.CreateGuid();
        wizard.AddSymbol("GUID_COCLASS", wizard.FormatGuid(strRawGuid, 0));
        strRawGuid = wizard.CreateGuid();
        wizard.AddSymbol("GUID_INTERFACE", wizard.FormatGuid(strRawGuid, 0));
        strRawGuid = wizard.CreateGuid();	
        wizard.AddSymbol("GUID_EVENTS", wizard.FormatGuid(strRawGuid, 0));

        // Add the file to the project
        var item = AddFileToVSProject(strItemName, selProj, selObj, strTemplateFile, true);
        if( item )
        {
            item.Properties("SubType").Value = "Code";
            var editor = item.Open(vsViewKindCode);
            editor.Visible = true;
        }

        // Set all configurations to register the thing for COM interop
        var configs = new Enumerator(selProj.ConfigurationManager);
        for(;!configs.atEnd();configs.moveNext())
        {
            configs.item().Properties("RegisterForComInterop").Value = 1;
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
            wizard.ReportError(e.description);
            return -2147213313;
        }
    }
    finally
    {
        dte.SuppressUI = oldSuppressUIValue;
    }
}
