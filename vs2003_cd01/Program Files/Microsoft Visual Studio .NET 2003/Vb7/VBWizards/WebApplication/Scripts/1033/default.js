//
// Copyright (c) Microsoft Corporation 2001-2002. All rights reserved.
//

function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
    try
    {
        oldSuppressUIValue = dte.SuppressUI;
        var bSilent = wizard.FindSymbol("SILENT_WIZARD");
        dte.SuppressUI = bSilent;

        var strProjectName = wizard.FindSymbol("PROJECT_NAME");
        var strProjectPath = wizard.FindSymbol("PROJECT_PATH");
        var strTemplatePath = wizard.FindSymbol("TEMPLATES_PATH");
        var strTemplateFile = strTemplatePath + "\\WebApplication.vbproj"; 

        var project = CreateVSProject(strProjectName, ".vbproj", strProjectPath, strTemplateFile);
        if( project )
        {
            strProjectName = project.Name;  //In case it got changed

            var item;
            var editor;

            strTemplateFile = strTemplatePath + "\\Global.asax"; 
            item = AddFileToVSProject("Global.asax", project, project.ProjectItems, strTemplateFile, false);


	    item = DoesFileExistInProj(project,"Web.config")
            if (item == null) 
            {
               strTemplateFile = strTemplatePath + "\\Web.config"; 
               item = AddFileToVSProject("Web.config", project, project.ProjectItems, strTemplateFile, false);
            }

            strTemplateFile = strTemplatePath + "\\Styles.css"; 
            item = AddFileToVSProject("Styles.css", project, project.ProjectItems, strTemplateFile, false);


            var strRawGuid = wizard.CreateGuid();
            wizard.AddSymbol("GUID_ASSEMBLY", wizard.FormatGuid(strRawGuid, 0));

            strTemplateFile = strTemplatePath + "\\AssemblyInfo.vb"; 
            item = AddFileToVSProject("AssemblyInfo.vb", project, project.ProjectItems, strTemplateFile, false);
            if( item )
            {
                item.Properties("SubType").Value = "Code";
            }

            AddDefaultWebFormsPropertiesToWizard(dte, wizard, project);
            strTemplateFile = strTemplatePath + "\\WebForm.aspx"; 
            item = AddFileToVSProject("WebForm1.aspx", project, project.ProjectItems, strTemplateFile, false);

            var configs = new Enumerator(project.ConfigurationManager);
            for(;!configs.atEnd();configs.moveNext())
            {
                configs.item().Properties("StartPage").Value = "WebForm1.aspx";
            }
            editor = item.Open(vsViewKindPrimary);
            editor.Visible = true;

            project.Save();
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

