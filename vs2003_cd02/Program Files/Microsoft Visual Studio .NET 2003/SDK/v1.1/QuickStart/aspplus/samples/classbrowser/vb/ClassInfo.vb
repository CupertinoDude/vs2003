'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Collections
Imports System.Globalization
Imports System.Reflection

Namespace ClassInfoVB

    public class SortTable : Inherits Hashtable : Implements IComparable
        Public sortField As String

        Sub New()
            sortField = Nothing
        End Sub

        Sub New(sField As String)
           sortField = sField
        End Sub

        Public Function CompareTo(B As Object) As Integer Implements IComparable.CompareTo
            If sortField Is Nothing Then
                Return 0
            End If
            Return (String.Compare(CStr(Me(sortField)), CStr((CType(b, SortTable))(sortField)), false, CultureInfo.InvariantCulture))
        End Function
    End Class



Public Class DisplayEvents : Inherits ArrayList
    Public Sub New(classType As Type)
        Dim eventInfos() As System.Reflection.EventInfo = classType.GetEvents()

        If eventInfos Is Nothing Then Return

        Dim eventTable As ArrayList = New ArrayList()
        Dim X As Integer

        For X = 0 To eventInfos.Length - 1
            Dim eventDetails As New SortTable("Name")

            eventDetails("Assembly")    = eventInfos(x).EventHandlerType.Assembly.ToString()
            eventDetails("Name")        = eventInfos(x).Name
            eventDetails("Type")        = eventInfos(x).EventHandlerType.Name
            eventDetails("GetType")     = eventInfos(x).EventHandlerType.Name
            eventDetails("Namespace")   = eventInfos(x).EventHandlerType.Namespace

            If eventInfos(x).IsMulticast Then
                eventDetails("Access") = "multicast "
            End If

            Me.Add(eventDetails)
        Next
        Me.Sort()
    End Sub
End Class

public class DisplayFields : Inherits ArrayList
    Public Sub New(classType As Type)
        Dim fieldInfos() As System.Reflection.FieldInfo = classType.GetFields()

        If fieldInfos Is Nothing Then Return

        Dim fieldTable As New ArrayList()
        Dim X As Integer

        For X = 0 To fieldInfos.Length - 1
            Dim fieldDetails As New SortTable("Name")

            fieldDetails("Assembly") = fieldInfos(x).GetType().Assembly.ToString()
            fieldDetails("Name") = fieldInfos(x).Name
            fieldDetails("Type") = fieldInfos(x).FieldType.Name

            If (fieldInfos(x).FieldType.IsArray And fieldInfos(x).FieldType.Name <> "Array") Or fieldInfos(x).FieldType.IsPointer Then
                fieldDetails("GetType")   = fieldInfos(x).FieldType.GetElementType().Name
                fieldDetails("Namespace") = fieldInfos(x).FieldType.GetElementType().Namespace
            Else
                fieldDetails("GetType")   = fieldInfos(x).FieldType.Name
                fieldDetails("Namespace") = fieldInfos(x).FieldType.Namespace
            End If

            If fieldInfos(x).IsPublic Then
                fieldDetails("Access") = "public "
            Else If fieldInfos(x).IsPrivate Then
                fieldDetails("Access") = "private "
            Else If fieldInfos(x).IsFamily Then
                fieldDetails("Access") = "protected "
            End If

            If fieldInfos(x).IsStatic Then
                fieldDetails("Access") = CStr(fieldDetails("Access")) & "static "
            End If

            If fieldInfos(x).IsLiteral Then
                fieldDetails("Access") = CStr(fieldDetails("Access")) & "const "
            End If

            Me.Add(fieldDetails)
        Next
        Me.Sort()
    End Sub
End Class

Public Class DisplayConstructors : Inherits ArrayList
    Public Sub New(classType As Type)
        Dim constructorInfos() As System.Reflection.ConstructorInfo = classType.GetConstructors()

        If constructorInfos Is Nothing Then Return

        Dim X As Integer
        For X = 0 To constructorInfos.Length - 1
            Dim constructorDetails As New SortTable()

            constructorDetails("Assembly") = constructorInfos(x).GetType().Assembly.ToString()
            constructorDetails("Name") = classType.Name

            If constructorInfos(x).IsPublic Then
                constructorDetails("Access") = "public "
            Else If constructorInfos(x).IsPrivate Then
                constructorDetails("Access") = "private "
            Else If constructorInfos(x).IsFamily Then
                constructorDetails("Access") = "protected "
            End If

            Dim paramInfos() As System.Reflection.ParameterInfo = constructorInfos(x).GetParameters()

            If Not paramInfos Is Nothing
                Dim paramTable As New ArrayList()
                Dim Y As Integer

                For Y = 0 To paramInfos.Length - 1
                    Dim paramDetails As New SortTable()
                    paramDetails("Assembly")  = paramInfos(y).GetType().Assembly.ToString()
                    paramDetails("ParamName") = paramInfos(y).Name
                    paramDetails("ParamType") = paramInfos(y).ParameterType.Name
                    if ( ( paramInfos(y).ParameterType.IsArray And paramInfos(y).ParameterType.Name <> "Array" ) Or paramInfos(y).ParameterType.IsPointer )
                        paramDetails("GetType")   = paramInfos(y).ParameterType.GetElementType().Name
                        paramDetails("Namespace") = paramInfos(y).ParameterType.GetElementType().Namespace
                    Else
                        paramDetails("GetType")   = paramInfos(y).ParameterType.Name
                        paramDetails("Namespace") = paramInfos(y).ParameterType.Namespace
                    End If
                    paramTable.Add(paramDetails)
                Next

                constructorDetails("Params") = paramTable
            End If

            Me.Add(constructorDetails)
        Next
    End Sub
End Class


Public Class DisplayProperties : Inherits ArrayList
    Public Sub New(classType As Type)
        Dim propertyInfos() As System.Reflection.PropertyInfo = classType.GetProperties()

        If propertyInfos Is Nothing Then Return

        Dim propertyTable As New ArrayList()
        Dim X As Integer
        For X = 0 To propertyInfos.Length - 1
            Dim propertyDetails As New SortTable("Name")

            If Not propertyInfos(x).GetGetMethod() Is Nothing
                If (propertyInfos(x).GetGetMethod().ReturnType.IsArray And propertyInfos(x).GetGetMethod().ReturnType.Name <> "Array") Or propertyInfos(x).GetGetMethod().ReturnType.IsPointer Then
                    propertyDetails("GetType")   = propertyInfos(x).GetGetMethod().ReturnType.GetElementType().Name
                    propertyDetails("Namespace") = propertyInfos(x).GetGetMethod().ReturnType.GetElementType().Namespace
                Else
                    propertyDetails("GetType")   = propertyInfos(x).GetGetMethod().ReturnType.Name
                    propertyDetails("Namespace") = propertyInfos(x).GetGetMethod().ReturnType.Namespace
                End If
                propertyDetails("Type")      = propertyInfos(x).GetGetMethod().ReturnType.Name
                propertyDetails("Assembly")  = propertyInfos(x).GetGetMethod().ReturnType.Assembly.ToString()
                propertyDetails("Name")      = propertyInfos(x).Name

                If propertyInfos(x).GetGetMethod().IsPublic Then
                     propertyDetails("Visibility") = "public"
                Else If propertyInfos(x).GetGetMethod().IsPrivate Then
                     propertyDetails("Visibility") = "private"
                Else If propertyInfos(x).GetGetMethod().IsFamily Then
                    propertyDetails("Visibility") = "protected"
                End If

                If propertyInfos(x).GetGetMethod().IsStatic Then
                    propertyDetails("Visibility") = CStr(propertyDetails("Visibility")) & " static"
                End If

                If propertyInfos(x).GetSetMethod() Is Nothing
                    propertyDetails("Access") =  "(Get)"
                Else
                    propertyDetails("Access") = "(Get , Set)"
                End If

                Dim paramInfos() As System.Reflection.ParameterInfo = propertyInfos(x).GetGetMethod().GetParameters()

                If Not paramInfos Is Nothing
                    Dim paramTable As New ArrayList()
                    Dim Y As Integer

                    For Y = 0 To paramInfos.Length - 1
                        Dim paramDetails As New SortTable()
                        paramDetails("Assembly") = paramInfos(y).GetType().Assembly.ToString()
                        paramDetails("ParamName") = paramInfos(y).Name
                        paramDetails("ParamType") = paramInfos(y).ParameterType.Name
                        If (paramInfos(y).ParameterType.IsArray And paramInfos(y).ParameterType.Name <> "Array") Or paramInfos(y).ParameterType.IsPointer
                            paramDetails("GetType")   = paramInfos(y).ParameterType.GetElementType().Name
                            paramDetails("Namespace") = paramInfos(y).ParameterType.GetElementType().Namespace
                        Else
                            paramDetails("GetType")   = paramInfos(y).ParameterType.Name
                            paramDetails("Namespace") = paramInfos(y).ParameterType.Namespace
                        End If
                        paramTable.Add(paramDetails)
                    Next
                    propertyDetails("Params") = paramTable
                End If
            Else If Not propertyInfos(x).GetSetMethod() Is Nothing Then

                propertyDetails("GetType")   = propertyInfos(x).GetSetMethod().ReturnType.Name
                propertyDetails("Namespace") = propertyInfos(x).GetSetMethod().ReturnType.Namespace

                propertyDetails("Type")      = propertyInfos(x).GetSetMethod().ReturnType.Name
                propertyDetails("Assembly")  = propertyInfos(x).GetSetMethod().ReturnType.Assembly.ToString()
                propertyDetails("Name")      = propertyInfos(x).Name

                If propertyInfos(x).GetSetMethod().IsPublic Then
                     propertyDetails("Visibility") = "public"
                Else If propertyInfos(x).GetSetMethod().IsPrivate Then
                     propertyDetails("Visibility") = "private"
                Else If propertyInfos(x).GetSetMethod().IsFamily Then
                    propertyDetails("Visibility") = "protected"
                End If

                If propertyInfos(x).GetSetMethod().IsStatic Then
                    propertyDetails("Visibility") = CStr(propertyDetails("Visibility")) & " static"
                End If

                propertyDetails("Access") = "( Set )"
                Dim paramInfos() As System.Reflection.ParameterInfo = propertyInfos(x).GetSetMethod().GetParameters()

                If Not paramInfos Is Nothing Then
                    Dim paramTable As New ArrayList()
                    Dim Y As Integer

                    For Y = 0 To paramInfos.Length - 1
                        Dim paramDetails As New SortTable()
                        paramDetails("Assembly") = paramInfos(y).GetType().Assembly.ToString()
                        paramDetails("ParamName") = paramInfos(y).Name
                        paramDetails("ParamType") = paramInfos(y).ParameterType.Name
                        If (paramInfos(y).ParameterType.IsArray And paramInfos(y).ParameterType.Name <> "Array") Or paramInfos(y).ParameterType.IsPointer
                            paramDetails("GetType")   = paramInfos(y).ParameterType.GetElementType().Name
                            paramDetails("Namespace") = paramInfos(y).ParameterType.GetElementType().Namespace
                        Else
                            paramDetails("GetType")   = paramInfos(y).ParameterType.Name
                            paramDetails("Namespace") = paramInfos(y).ParameterType.Namespace
                        End If
                        paramTable.Add(paramDetails)
                    Next

                    propertyDetails("Params") = paramTable
                End If
            End If
            Me.Add(propertyDetails)
        Next
        Me.Sort()
    End Sub
End Class


    public class DisplayMethods : Inherits ArrayList
         Public Sub New(classType As Type, myclassname As String)
             Dim methodInfos() As System.Reflection.MethodInfo = classType.GetMethods()

             If methodInfos Is Nothing Then Return

             Dim X As Integer
             For X = 0 To methodInfos.Length - 1
                 If String.Compare(myclassname,methodInfos(x).DeclaringType.Name, false, CultureInfo.InvariantCulture) = 0 And (methodInfos(x).IsPublic Or methodInfos(x).IsFamily) And Not methodInfos(x).IsSpecialName Then
                     Dim MethodDetails As New SortTable("Name")

                     MethodDetails("Assembly") = methodInfos(x).GetType().Assembly.ToString()
                     MethodDetails("Name") = methodInfos(x).Name
                     MethodDetails("Type") = methodInfos(x).ReturnType.Name
                     If (methodInfos(x).ReturnType.IsArray And methodInfos(x).ReturnType.Name <> "Array") Or methodInfos(x).ReturnType.IsPointer
                         Dim ReturnElementType As Type =  methodInfos(x).ReturnType.GetElementType()
                         Do While ReturnElementType.IsArray
                            ReturnElementType =  ReturnElementType.GetElementType()
                         Loop

                         MethodDetails("GetType")   = ReturnElementType.Name
                         MethodDetails("Namespace") = ReturnElementType.Namespace
                     Else
                        MethodDetails("GetType") = methodInfos(x).ReturnType.Name
                        MethodDetails("Namespace") = methodInfos(x).ReturnType.Namespace
                     End If

                     If methodInfos(x).IsPublic Then
                         MethodDetails("Access") = "public "
                     Else If methodInfos(x).IsPrivate Then
                         MethodDetails("Access") = "private "
                     Else If methodInfos(x).IsFamily Then
                         MethodDetails("Access") = "protected "
                     End If

                     If methodInfos(x).IsStatic Then
                         MethodDetails("Access") = CStr(MethodDetails("Access")) & "static "
                     End If

                     Dim paramInfos() As System.Reflection.ParameterInfo = methodInfos(x).GetParameters()

                    If Not paramInfos Is Nothing
                        Dim paramTable As New ArrayList()

                        Dim Y As Integer
                        For Y = 0 To paramInfos.Length - 1
                            Dim paramDetails As New SortTable()
                            paramDetails("Assembly")  = paramInfos(y).GetType().Assembly.ToString()
                            paramDetails("ParamName") = paramInfos(y).Name
                            paramDetails("ParamType") = paramInfos(y).ParameterType.Name

                            If (paramInfos(y).ParameterType.IsArray And paramInfos(y).ParameterType.Name <> "Array" ) Or paramInfos(y).ParameterType.IsPointer
                                paramDetails("GetType")   = paramInfos(y).ParameterType.GetElementType().Name
                                paramDetails("Namespace") = paramInfos(y).ParameterType.GetElementType().Namespace
                            Else
                                paramDetails("GetType")   = paramInfos(y).ParameterType.Name
                                paramDetails("Namespace") = paramInfos(y).ParameterType.Namespace
                            End If
                            paramTable.Add(paramDetails)
                        Next

                        MethodDetails("Params") = paramTable
                    End If

                    Me.Add(MethodDetails)
                End If
            Next
            Me.Sort()
        End Sub
    End Class

    public class DisplayInterfaces : Inherits ArrayList
        Public Sub New(classType As Type)
             Dim classInterfaces() As Type = classType.GetInterfaces()
             Dim X As Integer
             For X = 0 To classInterfaces.Length - 1

                Dim interfaceDetails As New SortTable()

                interfaceDetails("Assembly")     = classInterfaces(x).Assembly.ToString()
                interfaceDetails("FullName")     = classInterfaces(x).FullName
                interfaceDetails("GetType")      = classInterfaces(x).Name
                interfaceDetails("Namespace")    = classInterfaces(x).Namespace
                Me.Add(interfaceDetails)
             Next
         End Sub
    End Class


    Public Class DisplaySuperclasses : Inherits ArrayList
        Public Sub New(classType As Type)
           Dim SuperClass As Type
           Dim classDetails As New SortTable()

           classDetails("Assembly")     = classType.Assembly.ToString()
           classDetails("FullName")     = classType.FullName
           classDetails("GetType")      = classType.Name
           classDetails("Namespace")    = classType.Namespace

           Me.Add(classDetails)

           Do While Not classType.BaseType Is Nothing
               Dim superclassDetails As New SortTable()
               SuperClass   =  classType.BaseType
               classType    =  SuperClass

               superclassDetails("Assembly")     = SuperClass.Assembly.ToString()
               superclassDetails("FullName")     = SuperClass.FullName
               superclassDetails("GetType")      = SuperClass.Name
               superclassDetails("Namespace")    = SuperClass.Namespace

               Me.Add(superclassDetails)
           Loop
           Me.Reverse()
        End Sub
    End Class

    Public Class DisplaySubClasses : Inherits ArrayList
        Private classType As Type
        Private CorRuntime() As System.Reflection.Module
        Private CorClasses() As Type
        Private myclassname As String
        Private classInterfaces() As Type

        Public Sub New(classType As Type, ModuleName As ArrayList)
            Me.classType = classtype
            myclassname = classType.FullName
            if classType.IsInterface
                Dim Y As Integer
                For Y = 0 To ModuleName.Count - 1
                    CorRuntime = System.Reflection.Assembly.Load(ModuleName(y).ToString()).GetModules()
                    CorClasses = CorRuntime(0).GetTypes()

                    Dim X As Integer
                    For X = 0 To CorClasses.Length - 1
                        classType       =  CorClasses(x)
                        classInterfaces =  classType.GetInterfaces()

                        Dim I As Integer
                        For I = 0 To classInterfaces.Length - 1

                            If String.Compare(myclassname , classInterfaces(i).FullName, false, CultureInfo.InvariantCulture) = 0 Then
                                 Dim subclassDetails As New SortTable("FullName")
                                 subclassDetails("Assembly")     = classType.Assembly.ToString()
                                 subclassDetails("FullName")     = classType.FullName
                                 subclassDetails("GetType")      = classType.Name
                                 subclassDetails("Namespace")    = classType.Namespace
                                 Me.Add(subclassDetails)
                            End If
                        Next
                    Next
                Next
            Else
                Dim Y As Integer
                For Y = 0 To ModuleName.Count - 1
                    CorRuntime = System.Reflection.Assembly.Load(ModuleName(y).ToString()).GetModules()
                    CorClasses  = CorRuntime(0).GetTypes()

                    Dim X As Integer
                    For X = 0 To CorClasses.Length - 1
                        classType = CorClasses(x).BaseType

                        If Not classType Is Nothing Then
                            if String.Compare(classType.FullName, myclassname, false, CultureInfo.InvariantCulture) = 0 Then
                                Dim subclassDetails As New SortTable("FullName")
                                subclassDetails("Assembly")     = CorClasses(x).Assembly.ToString()
                                subclassDetails("FullName")     = CorClasses(x).FullName
                                subclassDetails("GetType")      = CorClasses(x).Name
                                subclassDetails("Namespace")    = CorClasses(x).Namespace
                                Me.Add(subclassDetails)
                            End If
                        End If
                    Next
                Next
            End If
            Me.Sort()
        End Sub
    End Class
End Namespace


 