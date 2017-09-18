 Namespace BasicEventSrcSetup
        
    Module modBasicEventSrcSetup
                
        'The Null GUID
        Public Const GUID_NULL As String = "{00000000-0000-0000-0000-000000000000}"
                                                
        'These are the definitions of the standard event field names in
        'Visual Studio Analyzer. They are used in the Key array when passing data
        Public Const PARAM_SourceMachine As String = "SourceMachine"
        Public Const PARAM_SourceProcessID As String = "SourceProcessId"
        Public Const PARAM_SourceThread As String = "SourceThread"
        Public Const PARAM_SourceComponent As String = "SourceComponent"
        Public Const PARAM_SourceSession As String = "SourceSession"
        Public Const PARAM_TargetMachine As String = "TargetMachine"
        Public Const PARAM_TargetProcessID As String = "TargetProcessId"
        Public Const PARAM_TargetThread As String = "TargetThread"
        Public Const PARAM_TargetComponent As String = "TargetComponent"
        Public Const PARAM_TargetSession As String = "TargetSession"
        Public Const PARAM_SecurityIdentity As String = "SecurityIdentity"
        Public Const PARAM_CausalityID As String = "CausalityID"
        Public Const PARAM_SourceProcessName As String = "SourceProcessName"
        Public Const PARAM_TargetProcessName As String = "TargetProcessName"
        Public Const PARAM_SourceHandle As String = "SourceHandle"
        Public Const PARAM_TargetHandle As String = "TargetHandle"
        Public Const PARAM_Arguments As String = "Arguments"
        Public Const PARAM_ReturnValue As String = "ReturnValue"
        Public Const PARAM_Exception As String = "Exception"
        Public Const PARAM_CorrelationID As String = "CorrelationID"
                                
        'Event types used when registering custom events
        Public Const DEBUG_EVENT_TYPE_FIRST As Integer = 0
        Public Const DEBUG_EVENT_TYPE_OUTBOUND As Integer = 0
        Public Const DEBUG_EVENT_TYPE_INBOUND As Integer = 1
        Public Const DEBUG_EVENT_TYPE_GENERIC As Integer = 2
        Public Const DEBUG_EVENT_TYPE_DEFAULT As Integer = 2
        Public Const DEBUG_EVENT_TYPE_MEASURED As Integer = 3
        Public Const DEBUG_EVENT_TYPE_BEGIN As Integer = 4
        Public Const DEBUG_EVENT_TYPE_END As Integer = 5
        Public Const DEBUG_EVENT_TYPE_LAST As Integer = 5
                                
                                
        'Event categories used when registering custom events
        'Startup and shutdown events
        Public Const DEBUG_EVENT_CATEGORY_STARTSTOP As String = "{6c736d81-BCBF-11D0-8A23-00AA00B58E10}"
        'Function call/return
        Public Const DEBUG_EVENT_CATEGORY_CALLRETURN As String = "{6c736d82-BCBF-11D0-8A23-00AA00B58E10}"
        'Query start and completion
        Public Const DEBUG_EVENT_CATEGORY_QUERYRESULT As String = "{6c736d83-BCBF-11D0-8A23-00AA00B58E10}"
        'Transactional events.
        Public Const DEBUG_EVENT_CATEGORY_TRANSACTION As String = "{6c736d84-BCBF-11D0-8A23-00AA00B58E10}"
        'All events.
        Public Const DEBUG_EVENT_CATEGORY_ALL As String = "{6c736d85-BCBF-11D0-8A23-00AA00B58E10}"
        'All measured
        Public Const DEBUG_EVENT_CATEGORY_MEASURED_ALL As String = "{6c736d86-BCBF-11D0-8A23-00AA00B58E10}"
        'Performance monitor category
        Public Const DEBUG_EVENT_CATEGORY_PERFMON As String = "{6c736d87-BCBF-11D0-8A23-00AA00B58E10}"
                        
        'These are the definitions of the stock events that are available in Visual Studio Analyzer
        'These are defined in detail in the MSDN documentation.
        Public Const DEBUG_EVENT_CALL As String = "{6C736D61-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_RETURN As String = "{6C736D62-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_COMPONENT_START As String = "{6C736D63-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_COMPONENT_STOP As String = "{6C736D64-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_CALL_DATA As String = "{6C736D65-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_ENTER As String = "{6C736D66-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_ENTER_DATA As String = "{6C736D67-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_LEAVE_NORMAL As String = "{6C736D68-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_LEAVE_EXCEPTION As String = "{6C736D69-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_LEAVE_DATA As String = "{6C736D6A-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_RETURN_DATA As String = "{6C736D6B-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_RETURN_NORMAL As String = "{6C736D6C-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_RETURN_EXCEPTION As String = "{6C736D6D-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_QUERY_SEND As String = "{6C736D6E-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_QUERY_ENTER As String = "{6C736D6F-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_QUERY_LEAVE As String = "{6C736D70-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_QUERY_RESULT As String = "{6C736D71-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_TRANSACTION_START As String = "{6C736D72-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_TRANSACTION_COMMIT As String = "{6C736D73-BCBF-11D0-8A23-00AA00B58E10}"
        Public Const DEBUG_EVENT_TRANSACTION_ROLLBACK As String = "{6C736D74-BCBF-11D0-8A23-00AA00B58E10}"
        
    End Module
        
 End Namespace
 