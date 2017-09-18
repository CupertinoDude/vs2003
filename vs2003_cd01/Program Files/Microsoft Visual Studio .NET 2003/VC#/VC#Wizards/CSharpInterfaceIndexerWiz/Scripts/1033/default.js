// (c) Microsoft Corporation
function OnFinish(selProj, Class)
{
    var oldSuppressUIValue = true;
	try
	{
        oldSuppressUIValue = dte.SuppressUI;
		var strVarType = wizard.FindSymbol("PROP_TYPE_STRING");
		var strComment = wizard.FindSymbol("COMMENT");
        var strParams = wizard.FindSymbol("PARAMETER_LIST_STRING");
        var strPropName = "this[" + strParams + "]";
   		var func = Class.AddProperty(strPropName, strPropName, strVarType, vsCMAddPositionEnd, 0);

		if (func)
		{
			if(strComment)
            {
                func.Comment = strComment;
            }
			ShowTextPoint(func.StartPoint);			
		}
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

