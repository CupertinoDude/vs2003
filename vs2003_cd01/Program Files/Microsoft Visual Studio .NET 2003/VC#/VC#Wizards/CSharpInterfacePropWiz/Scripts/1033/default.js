// (c) Microsoft Corporation
function OnFinish(selProj, Class)
{
    var oldSuppressUIValue = true;
	try
	{
        oldSuppressUIValue = dte.SuppressUI;
		var strPropName = wizard.FindSymbol("PROP_NAME");
		var PropGetSet = wizard.FindSymbol("GET_SET");
		var PropGet = wizard.FindSymbol("GET");
		var PropSet = wizard.FindSymbol("SET");		
		var strVarType = wizard.FindSymbol("PROP_TYPE_STRING");
		var strComment = wizard.FindSymbol("COMMENT");

		var func;
		if(PropGetSet)
        {
       		func = Class.AddProperty(strPropName, strPropName, strVarType, vsCMAddPositionEnd, 0);
        }
		else if(PropGet)
		{
       		func = Class.AddProperty(strPropName, "", strVarType, vsCMAddPositionEnd, 0);
		}
		else
		{
       		func = Class.AddProperty("", strPropName, strVarType, vsCMAddPositionEnd, 0);
		}
		
        if(func)
        {
            if(strComment)
            {
                func.Comment = strComment;
            }
        }
		ShowTextPoint(func.StartPoint);
	}
	catch(e)
	{
		wizard.ReportError(e.description);
	}
    finally
    {
   		dte.SuppressUI = oldSuppressUIValue;
    }
}

