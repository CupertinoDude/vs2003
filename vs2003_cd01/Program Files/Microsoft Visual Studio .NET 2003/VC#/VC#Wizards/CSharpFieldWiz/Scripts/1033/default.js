// (c) Microsoft Corporation
function OnFinish(selProj, Class)
{
	var undo = dte.UndoContext;
    var oldSuppressUIValue = true;
	try
	{
        oldSuppressUIValue = dte.SuppressUI;
		var strFieldName = wizard.FindSymbol("FIELD_NAME");
		var strFieldType = wizard.FindSymbol("FIELD_TYPE_STRING");
		var vsAccess = wizard.FindSymbol("ACCESS");
		var strComment = wizard.FindSymbol("COMMENT");

		var strUndoMsg = "Add Variable " + strFieldName + " to " + Class.Name;
		undo.Open(strUndoMsg);

       	var oField = Class.AddVariable(strFieldName, strFieldType, vsCMAddPositionEnd, vsAccess, null);
        if(oField)
        {
            var bStatic = wizard.FindSymbol("STATIC");
            var bConst = wizard.FindSymbol("CONSTANT");

            var strFieldVal = wizard.FindSymbol("FIELD_VALUE");

            if(bStatic)
            {
                oField.IsShared = true;
            }
            if(bConst)
            {
                oField.InitExpression = strFieldVal;
                oField.IsConstant = true;
            }
            if(strComment)
            {
                oField.Comment = strComment;
            }
			undo.Close();
			ShowTextPoint(oField.StartPoint);
        }
		else
			undo.SetAborted();
	}
	catch(e)
	{
		undo.SetAborted();
		wizard.ReportError(e.description);
		return VS_E_WIZARDBACKBUTTONPRESS;
	}
    finally
    {
   		dte.SuppressUI = oldSuppressUIValue;
    }
}

