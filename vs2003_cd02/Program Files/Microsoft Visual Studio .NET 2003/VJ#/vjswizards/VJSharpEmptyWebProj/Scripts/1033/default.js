// (c) Microsoft Corporation

function OnFinish(selProj, selObj)
{
    var oldSuppressUIValue = true;
	try
	{
        oldSuppressUIValue = dte.SuppressUI;
	    var strProjectPath = wizard.FindSymbol("PROJECT_PATH");
	    var strProjectName = wizard.FindSymbol("PROJECT_NAME");

	    var bEmptyProject = 0; //wizard.FindSymbol("EMPTY_PROJECT");

 	    var proj = CreateBJProject(strProjectName, strProjectPath, "defaultwebproject.vjsproj");
		proj.Save();

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
    }
}

function GetBJTargetName(strName, strProjectName)
{
	var strTarget = strName;

	return strTarget; 
}

function DoOpenFile(strName)
{
	return false; 
}

function SetFileProperties( oFileItem, strFileName )
{
}
