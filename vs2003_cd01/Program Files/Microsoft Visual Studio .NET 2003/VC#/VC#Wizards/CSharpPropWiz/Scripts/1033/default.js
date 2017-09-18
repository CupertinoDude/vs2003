// (c) Microsoft Corporation
function OnFinish(selProj, Class)
{
	var undo = dte.UndoContext;

	try
	{
		var strPropName = wizard.FindSymbol("PROP_NAME");
		var PropGetSet = wizard.FindSymbol("GET_SET");
		var PropGet = wizard.FindSymbol("GET");
		var PropSet = wizard.FindSymbol("SET");
		var strVarType = wizard.FindSymbol("PROP_TYPE_STRING");
		var vsAccess = wizard.FindSymbol("ACCESS");
		var strComment = wizard.FindSymbol("COMMENT");

		
		var L_strUndoMsg_Text = "Add Property ";
		var L_strUndoMsg1_Text = " to ";
		L_strUndoMsg_Text = L_strUndoMsg_Text  + strPropName + L_strUndoMsg1_Text + Class.Name;
		undo.Open(L_strUndoMsg_Text);

		var func;
		if(PropGetSet)
		{

       		func = Class.AddProperty(strPropName, strPropName, strVarType, vsCMAddPositionEnd, vsAccess);
		}
		else if(PropGet)
		{
       		func = Class.AddProperty(strPropName, "", strVarType, vsCMAddPositionEnd, vsAccess);
		}
		else
		{
       		func = Class.AddProperty("", strPropName, strVarType, vsCMAddPositionEnd, vsAccess);
		}

        if(func)
        {			
            if (PropGet || PropGetSet)
			{
				SetPropertyModifier(func.Getter);
			}
            if (PropSet || PropGetSet)
			{
				SetPropertyModifier(func.Setter);
			}			

            if(strComment)
            {
                func.Comment = strComment;
            }
			undo.Close();
			ShowTextPoint(func.StartPoint);
        }
		else
			undo.SetAborted();
	}
	catch(e)
	{
		undo.SetAborted();
        L_Error1_Text = "Error in Add Property: ";
        wizard.ReportError(L_Error1_Text + e.description);
	}
}

function SetPropertyModifier(oObj)
{
	var bStatic = wizard.FindSymbol("STATIC");
	var bVirtual = wizard.FindSymbol("VIRTUAL");
	var bAbstract = wizard.FindSymbol("ABSTRACT");

	if(oObj)
	{	
		if(bStatic)
			oObj.IsShared = true;
		else if(bVirtual)
			oObj.CanOverride = true;
		else if(bAbstract)
			oObj.MustImplement = true;
	}
}
