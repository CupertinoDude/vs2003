// (c) Microsoft Corporation
function OnFinish(selProj, Class)
{
    var oldSuppressUIValue = true;
	try
	{
        oldSuppressUIValue = dte.SuppressUI;
	    var strFunc = wizard.FindSymbol("METHOD_NAME");
	    var strComment = wizard.FindSymbol("COMMENT");
        var strType = wizard.FindSymbol("RETURN_TYPE_STRING");
        var strParams = wizard.FindSymbol("PARAMETER_LIST_STRING");

       	var func = Class.AddFunction(strFunc, vsCMFunctionFunction, strType, vsCMAddPositionEnd, 0);
        if(func)
        {
            if(strParams)
            {
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
            }

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
