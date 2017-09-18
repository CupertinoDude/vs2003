// (c) Microsoft Corporation
function OnFinish(selProj, Class)
{
	var undo = dte.UndoContext;
    var oldSuppressUIValue = true;
	try
	{
        oldSuppressUIValue = dte.SuppressUI;
		var strVarType = wizard.FindSymbol("PROP_TYPE_STRING");
		var vsAccess = wizard.FindSymbol("ACCESS");
		var strComment = wizard.FindSymbol("COMMENT");
        var strParams = wizard.FindSymbol("PARAMETER_LIST_STRING");

        var strPropName = "this[" + strParams + "]";

		var strUndoMsg = "Add Indexer " + strPropName + " to " + Class.Name;
		undo.Open(strUndoMsg);

   		var func = Class.AddProperty(strPropName, strPropName, strVarType, vsCMAddPositionEnd, vsAccess);

        if(func)
        {
            var funcGetter = func.Getter;
            if(funcGetter)
            {
                var bVirtual = wizard.FindSymbol("VIRTUAL");
                var bAbstract = wizard.FindSymbol("ABSTRACT");
            
                if(bVirtual)
                {
                    funcGetter.CanOverride = true;
                }
                else if(bAbstract)
                {
                    funcGetter.MustImplement = true;
                }
            }
            if(strComment)
            {
                func.Comment = strComment;
            }
            ShowTextPoint(func.StartPoint);
			undo.Close();
        }
		else
			undo.SetAborted();
	}
	catch(e)
	{
		undo.SetAborted();
		// Let's silently fail for now since the code model does not set the error discription corectly.
		wizard.ReportError(e.description);
	}
    finally
    {
   		dte.SuppressUI = oldSuppressUIValue;
    }
}
