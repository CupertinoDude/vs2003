' =====================================================================
'  File:      Permissions.vb
'
'  Summary:   Demonstrates how use code access security.
'
' ---------------------------------------------------------------------
'  This file is part of the Microsoft .NET Framework SDK Code Samples.
'
'  Copyright (C) Microsoft Corporation.  All rights reserved.
'
' This source code is intended only as a supplement to Microsoft
' Development Tools and/or on-line documentation.  See these other
' materials for detailed information regarding Microsoft code samples.
'
' THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
' KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
' IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
' PARTICULAR PURPOSE.
' =====================================================================*/

Option Explicit On 
Option Strict On


'  Add the classes in the following namespaces to our namespace
imports System
imports System.IO
imports System.Security.Permissions
imports System.Security

public Module Permissions

' /////////////////////////////////////////////////////////////////////////////


'  This class represents the application itself
class App
    public sub Run()
        '  Try to access resources using the permissions currently available.
        AttemptAccess("Default permissions")

        '  Create a permission set that allows read access to the TEMP 
        '  environment variable and read, write, and append access to SomeFile
        dim ps as new PermissionSet(PermissionState.None)
        dim fs as FileIOPermission
        dim ep as EnvironmentPermission	

            fs = New FileIOPermission(FileIOPermissionAccess.Read Or FileIOPermissionAccess.Write Or FileIOPermissionAccess.Append, Path.GetFullPath("SomeFile"))
        ep = new EnvironmentPermission(EnvironmentPermissionAccess.Read, "TEMP")

        ps.AddPermission(ep)
        ps.AddPermission(fs)

        ' Use caution in asserting permissions in publicly callable code without
        ' any kind of check on the caller.  There is a danger of the assert being
        ' used to exploit a downstream caller by stopping its security check, 
        ' allowing the malicious code access to unauthorized resources.

        ' Stop security checks at this point in the stack walk
        ' for the specified permissions
        ps.Assert()

        '  Try to access resources using the permissions we've just asserted.
        AttemptAccess("Assert permissions")

        '  Remove this stack frame's Assert
        CodeAccessPermission.RevertAssert()


        '  Deny access to the resources we specify
        ps.Deny()

        '  Try to access resources using the permissions we've just denied.
        AttemptAccess("Deny permissions")

        '  Remove this stack frame's Deny so we're back to default permissions.
        CodeAccessPermission.RevertDeny()

        '  Make the permissions indicate the only things that we're allowed to do.
        ps.PermitOnly()

        '  Try to access resources using only the permissions we've just permitted.
        AttemptAccess("PermitOnly permissions")

        '  Remove this stack frame's PermitOnly so we're back to default permissions.
        CodeAccessPermission.RevertPermitOnly()



        '  Remove the FileIOPermissions from the permission set
        ps.RemovePermission(fs.gettype())


        '  Try to access resources using only the Environment permissions.
        ps.PermitOnly()
        AttemptAccess("PermitOnly without FileIOPermission permissions")
        CodeAccessPermission.RevertPermitOnly()

        '  Remove the EnvironmentPermission from the permission set
        ps.RemovePermission(ep.GetType())


        '  Try to access resources using no permissions.
        ps.PermitOnly()
        AttemptAccess("PermitOnly without any permissions")
        CodeAccessPermission.RevertPermitOnly()

        ' Show how to use Demand/Assert to improve performance
        CopyFile(".\\Permissions.exe", ".\\Permissions.copy.exe")

        ' Delete .exe copy
        File.Delete(".\\Permissions.copy.exe")

    end sub


    public sub AttemptAccess(s as String)
        dim fs as FileStream
        dim ev as String = ""

        '  Try to access a file
        try
            fs = new FileStream("SomeFile", FileMode.OpenOrCreate) 
        catch e as Exception
        end try



        '  Try to read an environment variable
        try
            ev = Environment.GetEnvironmentVariable("TEMP")
        catch e as Exception
        end try



        '  Display what we sucessfully did.
        dim str as String

        if Not fs Is nothing then
            str = "FileOpen"
        else
            str = "FileNotOpened"
        end if


        str = str & ", "

        if ev <> "" then
            str = str & "EVRead"
        else
            str = str & "EVNotRead"
        end if

        Console.WriteLine(s & " test: " & str)


        '  If we opened the file, close it & delete it
        if Not fs Is nothing then 
            fs.Close() 
            File.Delete("SomeFile")
        end if

    end sub


    public shared sub CopyFile(srcPath as String, dstPath as String)

        '  Create a file permission set indicating all of this method's intentions.
        dim fp as FileIOPermission = new FileIOPermission(FileIOPermissionAccess.Read, Path.GetFullPath(srcPath))
            fp.AddPathList(FileIOPermissionAccess.Write Or FileIOPermissionAccess.Append, Path.GetFullPath(dstPath))

        '  Verify that we can be granted all the permissions we'll need.
        fp.Demand()

        '  Assert the desired permissions here.
        fp.Assert()

        '  For the remainder of this method, demands for source file read access
        '  and demands for destination file write/append access will be granted
        '  immediately; walking the remainder of the stack will not be necessary.

        dim srcFile as FileInfo = new FileInfo(srcPath)
        dim dstFile as FileInfo = new FileInfo(dstPath)
        dim src as Stream = srcFile.Open(FileMode.Open, FileAccess.Read, FileShare.Read)
        dim dst as Stream = dstFile.Open(FileMode.Create, FileAccess.Write, FileShare.None)
        if srcFile.Length > Int32.MaxValue then 
            throw new Exception("CopyFile requires that the source file be less than 2GB.")
        end if

        dim buffer(Convert.ToInt32(srcFile.Length)) as Byte
        src.Read(buffer, 0, Convert.ToInt32(srcFile.Length))
        dst.Write(buffer, 0, Convert.ToInt32(srcFile.Length))

        src.Close()
        dst.Close()

        ' We do not need a RevertAssert here because we are going out of scope
    end sub

end class   ' Application

    sub Main()
        dim obj as App = new App

        obj.Run
    end sub

end Module  ' Permissions

' /////////////////////////////// End of File /////////////////////////////////
