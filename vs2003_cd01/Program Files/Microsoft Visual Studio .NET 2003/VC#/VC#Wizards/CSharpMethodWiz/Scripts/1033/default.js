// (c) Microsoft Corporation
function OnFinish(selProj, Class)
{
	var undo = dte.UndoContext;
    var oldSuppressUIValue = true;
	try
	{
        oldSuppressUIValue = dte.SuppressUI;
		var strFunc = wizard.FindSymbol("METHOD_NAME");
		var strComment = wizard.FindSymbol("COMMENT");
        var strType = wizard.FindSymbol("RETURN_TYPE_STRING");
        var strParams = wizard.FindSymbol("PARAMETER_LIST_STRING");
		var vsAccess = wizard.FindSymbol("ACCESS");

		var strUndoMsg = "Add Method " + strFunc + " to " + Class.Name;
		undo.Open(strUndoMsg);

       	var func = Class.AddFunction(strFunc, vsCMFunctionFunction, strType, vsCMAddPositionEnd, 0, null);
        if(func)
        {
			//EditPoint is used for unsupported keywords by Csharp codemodel.
			var epFunc = func.StartPoint.CreateEditPoint();
			if(wizard.FindSymbol("NEW"))
				epFunc.Insert("new ");
			if(wizard.FindSymbol("OVERRIDE"))
				epFunc.Insert("override ");
			if(wizard.FindSymbol("EXTERN"))
			{
				epFunc.Insert("extern ");
				var ep1 = func.StartPoint.CreateEditPoint();
				var ep2 = func.EndPoint.CreateEditPoint();
				ep1.EndOfLine();
				ep1.Cut(ep2);
				ep1.Insert(";");
			}
			
        	if(wizard.FindSymbol("STATIC"))
				func.IsShared = true;	
			if(wizard.FindSymbol("VIRTUAL"))
				func.CanOverride = true;
			if(wizard.FindSymbol("ABSTRACT"))
				func.MustImplement = true;
				
			func.Access = vsAccess;

		    var strParamList = strParams.split("|");
		    for(var n=0; n < strParamList.length-1; n++)
		    {
			    var strParam = strParamList[n];
			    var strTypeparamList = strParam.split(" ");
			    var strType;
			    if(strTypeparamList.length == 3)
			    {
			        strType = strTypeparamList[0] + " " + strTypeparamList[1];
			        strVarName = strTypeparamList[2];
			    }
			    else
			    {
			        strType = strTypeparamList[0];
			        strVarName = strTypeparamList[1];
			    }
			    func.AddParameter(strVarName, strType, vsCMAddPositionEnd);
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
		// The code model needs to set the error discription corectly.
		wizard.ReportError(e.description);
	}
    finally
    {
   		dte.SuppressUI = oldSuppressUIValue;
    }
}
