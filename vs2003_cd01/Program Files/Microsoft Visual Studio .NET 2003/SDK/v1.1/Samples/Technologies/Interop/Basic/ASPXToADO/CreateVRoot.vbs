

' ******************** ****************************************
' Create a new vdir for this sample
'
' Set vName  to name of virtual dir you want to publish
'
' A virtual dir will be created at http://localhost/NetSDK/vName
'
'
' Valid command line switches: -u -q
'   -u  Remove virtual directory
'   -q  Run in quiet mode (no dialog boxes)
'
' *************************************************************


Option Explicit
dim vPath,vNames,vPaths,scriptPath,vBaseName,objArgs,remove,quiet,I

' get current path to folder
vPath = left(Wscript.ScriptFullName,len(Wscript.ScriptFullName ) - len(Wscript.ScriptName))


vNames = Array("ASPXToADO") ' Names of webs to create
vPaths = Array(vPath) ' Paths of web to create


vBaseName="NetSDK"

remove = False
quiet = False

Set objArgs = WScript.Arguments

For I = 0 To objArgs.Count - 1 
    If InStr(LCase(objArgs(I)), "u") <> 0 Then
        remove = True
    End If
    If InStr(LCase(objArgs(I)), "q") <> 0 Then
        quiet = True
    End If
Next

If remove Then
    'call to delete vDir
    DeleteVDir vNames, vBaseName
Else
    'call to create vDir
    CreateVDir vNames, vPaths, vBaseName
End If



'code taken from mkwebdir.vbs and changed for single vDir creation.
Sub CreateVDir(vNames, vPaths, vBaseName)

    Dim vRoot,vBaseDir,vDir,vTempDir,webSite,ipSecurityObj,ipList
    On Error Resume Next

    ' get the local host default web
    set webSite = GetObject("IIS://localhost/w3svc/1")
    if IsObject(webSite)=False then
        If Not quiet Then
            Display "Unable to locate the Default Web Site.  IIS must be installed."
        End If
        exit sub
    else
        'display webSite.name
    end if

    ' get the root
    set vRoot = webSite.GetObject("IIsWebVirtualDir", "Root")
    If (Err <> 0) Then
        If Not quiet Then
            Display "Unable to access root for " & webSite.ADsPath
        End If
        Exit sub
    else
        'display vRoot.name
    End If

    ' find or create the NetSDK vroot.  This is the parent vroot for all the NetSDK samples.
    ' The physical path to http://localhost/NetSDK is set to the ...\Samples\Setup\VirtualDirRoot folder
    Err.Number = 0 'Clear Error
    Set vBaseDir = GetObject(vRoot.ADsPath & "/" & vBaseName)
    if Err.Number <> 0 then
        Err.Number = 0 ' Reset Error
        Set vBaseDir = vRoot.Create("IIsWebVirtualDir",vBaseName)
        vBaseDir.AccessRead = true
        vBaseDir.Accessflags = 529
        vBaseDir.AppCreate False
        vBaseDir.SetInfo

        ' This section restricts access to everyone except localhost (127.0.0.1).
        Set ipSecurityObj = vBaseDir.IpSecurity
        ipSecurityObj.GrantByDefault = False
        ipList = ipSecurityObj.IPGrant
        ReDim ipList(UBound(ipList) + 1)
        ipList(UBound(ipList)) = "127.0.0.1"
        ipSecurityObj.IPGrant = ipList
        vBaseDir.IpSecurity = ipSecurityObj
        vBaseDir.SetInfo
        Dim WshShell
        Set WshShell = WScript.CreateObject("WScript.Shell")
        vBaseDir.Path = WshShell.RegRead("HKLM\SOFTWARE\Microsoft\.NETFramework\sdkInstallRootv1.1") & "Samples\Setup\VirtualDirRoot"
        vBaseDir.SetInfo
        If (Err <> 0) Then
            If Not quiet Then
                Display "Unable to create " & vRoot.ADsPath & "/" & vBaseName
            End If
            exit sub
        else
            Err = 0
            'display vBaseDir.name
        end if
    end if

    Dim J
    For J = 0 To UBound(vNames)

        ' delete existing sample vroot if needed
        vBaseDir.Delete "IIsWebVirtualDir", vNames(J)
        vBaseDir.SetInfo
        Err=0 ' reset error 
    
        Set vDir = vBaseDir.Create("IIsWebVirtualDir",vNames(J))
        If (Err <> 0) Then
            If Not quiet Then
                Display "Unable to create " & vBaseDir.ADsPath & "/" & vNames(J) & "."
            End If
            exit sub
        else
            'display vdir.name
        end if

        ' set properties on the new vroot 
        vDir.AccessRead = true
        vDir.Path = vPaths(J)
        vDir.Accessflags = 529
        VDir.AppCreate False

        ' commit changes
        vDir.SetInfo
        If (Err <> 0) Then
            If Not quiet Then
                Display "Unable to create IIS Virtual Directory for " & vBaseDir.Name & "/" & vNames(J) & "."
            End If
            exit sub
        end if

        If Not quiet Then
            ' report all ok
            WScript.Echo "Virtual directory http://localhost/" & vBaseDir.Name & "/" & vnames(J) & " created successfully."
        End If
    Next
End Sub




'code taken from mkwebdir.vbs and changed for single vDir creation.
Sub DeleteVDir(vNames, vBaseName)

    Dim vRoot,vBaseDir,vDir,vTempDir,webSite,ipSecurityObj,ipList
    On Error Resume Next

    ' get the local host default web
    set webSite = GetObject("IIS://localhost/w3svc/1")
    if IsObject(webSite)=False then
        If Not quiet Then
            Display "Unable to locate the Default Web Site.  IIS must be installed and running."
        End If
        exit sub
    else
        'display webSite.name
    end if

    ' get the root
    set vRoot = webSite.GetObject("IIsWebVirtualDir", "Root")
    If (Err <> 0) Then
        If Not quiet Then
            Display "Unable to access root for " & webSite.ADsPath
        End If
        Exit sub
    else
        'display vRoot.name
    End If

    ' find or create the NetSDK vroot.  This is the parent vroot for all the NetSDK samples.
    ' The physical path to http://localhost/NetSDK is set to the ...\Samples\Setup\VirtualDirRoot folder
    Err.Number = 0 'Clear Error
    Set vBaseDir = GetObject(vRoot.ADsPath & "/" & vBaseName)

    Dim K
    For K = 0 To UBound(vNames)
        ' delete existing sample vroot if needed
        vBaseDir.Delete "IIsWebVirtualDir", vNames(K)
        vBaseDir.SetInfo

        If Not quiet Then
            WScript.Echo "Virtual directory http://localhost/" & vBaseDir.Name & "/" & vnames(K) & " deleted successfully."
        End If
    Next
End Sub


Sub Display(Msg)
    If Not quiet Then
        WScript.Echo Now & ". Error Code: " & Hex(Err) & " - " & Msg
    End If
End Sub

Sub Trace(Msg)
    If Not quiet Then
        WScript.Echo Now & " : " & Msg  
    End If
End Sub

Sub DeleteWeb(WebServer, WebName)
    ' delete the exsiting web (ignore error if missing)
    On Error Resume Next
    Dim vDir
    If Not quiet Then
        display "deleting " & WebName
    End If

    WebServer.Delete "IISWebVirtualDir",WebName
    WebServer.SetInfo
    If Err=0 Then
        If Not quiet Then
            DISPLAY "WEB " & WebName & " deleted."
        End If
    else
        If Not quiet Then
            display "can't find " & webname
        End If
    End If
End Sub


