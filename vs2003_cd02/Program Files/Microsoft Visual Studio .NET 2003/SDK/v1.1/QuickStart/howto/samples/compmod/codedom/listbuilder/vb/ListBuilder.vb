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
Imports System.Collections
Imports System.CodeDom
Imports System.CodeDom.Compiler
Imports System.IO
Imports System.Reflection
Imports Microsoft.CSharp
Imports Microsoft.VisualBasic
Imports System.Globalization

Public Class ListBuilder
    Private Shared usage As String = Environment.NewLine & _
        "USAGE:  ListBuilder -T:<TypeName> -L:<Lang> -N:<Namespace>" & _
        Environment.NewLine
   
    'Entry point which delegates to C-style main Private Function
    Public Shared Sub Main(args() As String)
        If args.Length < 1 Then
            Console.WriteLine(usage)
            Return
        End If

        Dim ns As String = String.Empty
        Dim typeName as String = String.Empty
        Dim suffix As String = "cs"
        Dim compileLine As String = "csc /t:library {0}"
        Dim cg As ICodeGenerator = New CSharpCodeProvider().CreateGenerator()
      
        Dim arg As String
        For Each arg In args
            Select Case arg.ToUpper(CultureInfo.InvariantCulture).Substring(0,3)
                Case "-L:", "/L:"
                    Dim lang As String = arg.Remove(0, 3)
                    Select Case lang.ToUpper(CultureInfo.InvariantCulture)
                        Case "C#", "CS"
                            suffix = "cs"
                            compileLine = "csc /t:library {0}"
                            Dim cdp As New CSharpCodeProvider()
                            cg = cdp.CreateGenerator()
                        Case "VB"
                            Dim vdp As New VBCodeProvider()
                            cg = vdp.CreateGenerator()
                            suffix = "vb"
                            compileLine = "vbc /t:library {0}"
                        Case Else
                            Console.WriteLine("unknown lang |{0}|", lang)
                            Console.WriteLine("Use: CS, VB")
                            Console.WriteLine(usage)
                            Return
                    End Select 
                Case "-N:","/N:"
                    ns = arg.Remove(0, 3)
                    compileLine = compileLine.Insert( _
                        compileLine.IndexOf("{"),"/r:{1}.dll ")
                Case "-T:","/T:"
                    typeName = arg.Remove(0, 3)
                Case "-?", "/?"
                    Console.WriteLine(usage)
                    Return
                Case Else
                    Console.WriteLine(usage)
                    Return
            End Select
        Next arg

        ' Check to make sure type was passed
        If typeName = String.Empty Then
            Console.WriteLine(usage)
            Return
        End If

        Dim fileName As String = typeName + "Collection." + suffix
        Console.WriteLine("Creating source file {0}.", fileName)
        If Not (compileLine Is Nothing) Then
            Console.WriteLine("compile with: '{0}'.", _
                String.Format(compileLine, fileName, ns))
        End If 

        Dim t = New StreamWriter(New FileStream(fileName, FileMode.Create))
        SpitList(t, typeName, cg, ns)
        t.Close()
    End Sub
   
    Public Shared Sub SpitList(w As TextWriter, typeName As String, _
        baseCompiler As ICodeGenerator, ns As String)
      
        Dim c As New CodeCommentStatement(String.Format("List of {0}", typeName))
        baseCompiler.GenerateCodeFromStatement(c, w, Nothing)
      
        'Gen: namespace Microsoft.Samples {
        '         using System;
        '         using System.Collections;
        '         using <NAMESPACE>
        Dim cnamespace As New CodeNamespace("Microsoft.Samples")
        cnamespace.Imports.Add(New CodeNamespaceImport("System"))
        cnamespace.Imports.Add(New CodeNamespaceImport("System.Collections"))
        If Not (ns Is Nothing) And ns <> "" Then
            cnamespace.Imports.Add(New CodeNamespaceImport(ns))
        End If

        'Gen: public class FontEnumerator : System.Collections.IEnumerator, 
        '         System.ICloneable {
        Dim clEnumerator as New CodeTypeDeclaration(typeName & "Enumerator")
        clEnumerator.IsClass = true
	clEnumerator.BaseTypes.Add("Object")
        clEnumerator.BaseTypes.Add(GetType(System.Collections.IEnumerator))
        clEnumerator.BaseTypes.Add(GetType(System.ICloneable))
        clEnumerator.TypeAttributes = TypeAttributes.Public
        cnamespace.Types.Add(clEnumerator)

        'Gen:  private <TYPE>Collection parentColl;
        '      private int index;
        '      private <TYPE> currentElement;
        Dim varParent As New CodeMemberField(typeName & "Collection", "parentColl")
        clEnumerator.Members.Add(varParent)
        Dim varIndex As New CodeMemberField(new CodeTypeReference( _
            GetType(Integer)), "index")
        clEnumerator.Members.Add(varIndex)
        Dim varCurrent As New CodeMemberField(typeName, "currentElement")
        clEnumerator.Members.Add(varCurrent)

        'Gen: public <TYPE>Enumerator(<TYPE>Collection input) {
        '         parentColl = input;
        '         index = -1;
        '     }
        Dim enumConstructor As New CodeConstructor()
        enumConstructor.Attributes = MemberAttributes.Public Or MemberAttributes.Final
        enumConstructor.Parameters.Add(new CodeParameterDeclarationExpression( _
            new CodeTypeReference(typeName + "Collection"), "input"))
        enumConstructor.Statements.Add(new CodeAssignStatement( _
            new CodeVariableReferenceExpression("parentColl"), _
            new CodeVariableReferenceExpression("input")))
        enumConstructor.Statements.Add(new CodeAssignStatement( _
            new CodeVariableReferenceExpression("index"), _
            new CodePrimitiveExpression(-1)))
        clEnumerator.Members.Add(enumConstructor)

        'Gen: public virtual object Clone() {
        '         return this.MemberwiseClone();
        '     }
        Dim cm As New CodeMemberMethod()
        cm.Name = "Clone"
        cm.ReturnType = new CodeTypeReference(GetType(Object))
        cm.Attributes = MemberAttributes.Public
        cm.ImplementationTypes.Add(new CodeTypeReference(GetType(System.ICloneable)))
        cm.Statements.Add(new CodeMethodReturnStatement( _
            new CodeMethodReferenceExpression( _
            new CodeThisReferenceExpression(), "MemberwiseClone()")))
        clEnumerator.Members.Add (cm)

        'Gen:
        'public bool MoveNext() {
        '    if ((index < parentColl.Count - 1)) {
        '        index = (index + 1);
        '        currentElement = this.parentColl[index];
        '        return true;
        '    }
        '    else {
        '        return false;
        '    }
        '}
        cm = New CodeMemberMethod()
        cm.Name = "MoveNext"
        cm.ReturnType = new CodeTypeReference(GetType(Boolean))
        cm.Attributes = MemberAttributes.Public Or MemberAttributes.Final
        cm.ImplementationTypes.Add(new CodeTypeReference( _
            GetType(System.Collections.IEnumerator)))
        cm.Statements.Add(new CodeConditionStatement( _
            new CodeBinaryOperatorExpression( _
            new CodeVariableReferenceExpression("index"), _
            CodeBinaryOperatorType.LessThan, _
            new CodeVariableReferenceExpression("parentColl.Count - 1")), _
            new CodeStatement(){ _
                new CodeAssignStatement(new CodeVariableReferenceExpression("index"), _
                new CodeBinaryOperatorExpression( _
                new CodeVariableReferenceExpression("index"), _
                CodeBinaryOperatorType.Add, new CodePrimitiveExpression(1))), _
                new CodeAssignStatement(new CodeVariableReferenceExpression( _
                "currentElement"), new CodeIndexerExpression( _
                new CodeFieldReferenceExpression(new CodeThisReferenceExpression(), _
                "parentColl"), new CodeArgumentReferenceExpression("index"))), _
                new CodeMethodReturnStatement(new CodePrimitiveExpression(true))}, _
            new CodeStatement(){new CodeMethodReturnStatement( _
                new CodePrimitiveExpression(false))}))
        clEnumerator.Members.Add (cm)

        'Gen: public void Reset() {
        '         index = -1;
        '         currentElement = null;
        '     }
        cm = new CodeMemberMethod()
        cm.Name = "Reset"
        cm.Attributes = MemberAttributes.Public Or MemberAttributes.Final
        cm.ImplementationTypes.Add(new CodeTypeReference( _
            GetType(System.Collections.IEnumerator)))
        cm.Statements.Add(new CodeAssignStatement( _
            new CodeVariableReferenceExpression("index"), _
            new CodePrimitiveExpression(-1)))
        cm.Statements.Add(new CodeAssignStatement( _
            new CodeVariableReferenceExpression("currentElement"), _
            new CodePrimitiveExpression(Nothing)))
        clEnumerator.Members.Add (cm)

        'Gen: Object IEnumerator.Current {
        '         get {
        '             if (index < 0)
        '                 throw new InvalidOperationException();
        '             if(index >= parentColl.Count)
        '                 throw new InvalidOperationException();
        '             return currentElement;
        '         }
        '     }
        Dim cp As New CodeMemberProperty()
        cp.Name = "Current"
        cp.Attributes = MemberAttributes.Final Or MemberAttributes.Public
        cp.Type = new CodeTypeReference(GetType(Object))
        cp.ImplementationTypes.Add(new CodeTypeReference( _
            GetType(System.Collections.IEnumerator)))
        cp.GetStatements.Add(new CodeConditionStatement( _
            new CodeBinaryOperatorExpression( _
            new CodeVariableReferenceExpression("index"), _
            CodeBinaryOperatorType.LessThan, _
            new CodePrimitiveExpression(0)), _
            new CodeStatement(){new CodeThrowExceptionStatement( _
            new CodeSnippetExpression("new InvalidOperationException()"))}))
        cp.GetStatements.Add(new CodeConditionStatement( _
            new CodeBinaryOperatorExpression( _
            new CodeVariableReferenceExpression("index"), _
            CodeBinaryOperatorType.GreaterThanOrEqual, _
            new CodeVariableReferenceExpression("parentColl.Count")), _
            new CodeStatement(){new CodeThrowExceptionStatement( _
            new CodeSnippetExpression("new InvalidOperationException()"))}))
        cp.GetStatements.Add(new CodeMethodReturnStatement( _
            new CodeVariableReferenceExpression("currentElement")))
        clEnumerator.Members.Add(cp)

        'Gen: public class <TYPE>Collection : System.Collections.CollectionBase {
        Dim co As New CodeTypeDeclaration(typeName + "Collection")
        co.IsClass = True
        cnamespace.Types.Add(co)
        co.BaseTypes.Add(GetType(CollectionBase))
        co.TypeAttributes = TypeAttributes.Public

        'Gen: public <TYPE> this[int index] {
        '      get {
        '         return ((<TYPE>)List[index]);
        '      }
        '      set {
        '          List[index] = value;
        '      }
        '  }
        cp = New CodeMemberProperty()
        cp.Name = "Item"
        cp.Attributes = MemberAttributes.Public Or MemberAttributes.Final
        cp.Type = New CodeTypeReference(typeName)
        cp.Parameters.Add(New CodeParameterDeclarationExpression( _
            New CodeTypeReference(GetType(Integer)), "index"))
        cp.GetStatements.Add(New CodeMethodReturnStatement( _
            New CodeCastExpression(typeName, New CodeIndexerExpression( _
            New CodeFieldReferenceExpression( _
            New CodeThisReferenceExpression(), "List"), _
            New CodeArgumentReferenceExpression("index")))))
        cp.SetStatements.Add(New CodeAssignStatement(New CodeIndexerExpression( _
            New CodeFieldReferenceExpression(New CodeThisReferenceExpression(), _
            "List"), New CodeArgumentReferenceExpression("index")), _
            New CodeArgumentReferenceExpression("value")))
        co.Members.Add(cp)
      
      
        'Gen: public int Add(<TYPE> value) {
        '        return List.Add(value);
        '      }
        cm = New CodeMemberMethod()
        cm.Name = "Add"
        cm.ReturnType = New CodeTypeReference(GetType(Integer))
        cm.Parameters.Add(New CodeParameterDeclarationExpression(typeName, "value"))
        cm.Attributes = MemberAttributes.Public Or MemberAttributes.Final
        cm.Statements.Add(New CodeMethodReturnStatement( _
            New CodeMethodInvokeExpression(New CodeFieldReferenceExpression( _
            New CodeThisReferenceExpression(), "List"), "Add", _
            New CodeArgumentReferenceExpression("value"))))
        co.Members.Add(cm)
      
        'Gen: public new IEnumerator GetEnumerator() {
        '         return new <TYPE>Enumerator(this);
        '     }
        cm = New CodeMemberMethod()
        cm.Name = "GetEnumerator"
        cm.ReturnType = new CodeTypeReference(GetType(IEnumerator))
        cm.Attributes = MemberAttributes.Final Or MemberAttributes.Public _
            Or MemberAttributes.[New]
        cm.Statements.Add(new CodeMethodReturnStatement( _
            new CodeObjectCreateExpression( _
            new CodeTypeReference(typeName + "Enumerator"), _
            new CodeExpression(){new CodeThisReferenceExpression()})))
        co.Members.Add(cm)

      'Gen: public void Insert(int index, <TYPE> value)
      '         List.Insert(index, info);
      '     }
      cm = New CodeMemberMethod()
      cm.Name = "Insert"
      cm.Parameters.Add(New CodeParameterDeclarationExpression( _
          New CodeTypeReference(GetType(Integer)), "index"))
      cm.Parameters.Add(New CodeParameterDeclarationExpression(typeName, "value"))
      cm.Attributes = MemberAttributes.Public Or MemberAttributes.Final
      cm.Statements.Add(New CodeMethodInvokeExpression( _
          New CodeFieldReferenceExpression( _
          New CodeThisReferenceExpression(), "List"), "Insert", _
          New CodeArgumentReferenceExpression("index"), _
          New CodeArgumentReferenceExpression("value")))
      co.Members.Add(cm)
      
      'Gen: public int IndexOf(<TYPE> value) {
      '        return List.IndexOf(value);
      '      }
      cm = New CodeMemberMethod()
      cm.Name = "IndexOf"
      cm.ReturnType = New CodeTypeReference(GetType(Integer))
      cm.Parameters.Add(New CodeParameterDeclarationExpression(typeName, "value"))
      cm.Attributes = MemberAttributes.Public Or MemberAttributes.Final
      cm.Statements.Add(New CodeMethodReturnStatement( _
          New CodeMethodInvokeExpression(New CodeFieldReferenceExpression( _
          New CodeThisReferenceExpression(), "List"), "IndexOf", _
          New CodeExpression() {New CodeArgumentReferenceExpression("value")})))
      co.Members.Add(cm)
      
      'Gen: public bool Contains(<TYPE> value) {
      '        return List.Contains(value);
      '      }
      cm = New CodeMemberMethod()
      cm.Name = "Contains"
      cm.ReturnType = New CodeTypeReference(GetType(Boolean))
      cm.Parameters.Add(New CodeParameterDeclarationExpression(typeName, "value"))
      cm.Attributes = MemberAttributes.Public Or MemberAttributes.Final
      cm.Statements.Add(New CodeMethodReturnStatement( _
           New CodeMethodInvokeExpression(New CodeFieldReferenceExpression( _
           New CodeThisReferenceExpression(), "List"), "Contains", _
           New CodeExpression() {New CodeArgumentReferenceExpression("value")})))
      co.Members.Add(cm)
      
      'Gen: public void Remove(<TYPE> value) {
      '       List.Remove(value);
      '      }
      cm = New CodeMemberMethod()
      cm.Name = "Remove"
      cm.Parameters.Add(New CodeParameterDeclarationExpression(typeName, "value"))
      cm.Attributes = MemberAttributes.Public Or MemberAttributes.Final
      cm.Statements.Add(New CodeMethodInvokeExpression( _
          New CodeFieldReferenceExpression( _
          New CodeThisReferenceExpression(), "List"), "Remove", _
          New CodeExpression() {New CodeArgumentReferenceExpression("value")}))
      co.Members.Add(cm)
      
      'Gen: public void CopyTo(<Type>() array, int index) {
      '         List.CopyTo(array, index);
      '     }
      cm = New CodeMemberMethod()
      cm.Name = "CopyTo"
      cm.Parameters.Add(New CodeParameterDeclarationExpression( _
          New CodeTypeReference(typeName, 1), "array"))
      cm.Parameters.Add(New CodeParameterDeclarationExpression( _
          New CodeTypeReference(GetType(Integer)), "index"))
      cm.Attributes = MemberAttributes.Public Or MemberAttributes.Final
      cm.Statements.Add(New CodeMethodInvokeExpression( _
          New CodeFieldReferenceExpression( _
          New CodeThisReferenceExpression(), "List"), "CopyTo", _
          New CodeExpression() {New CodeArgumentReferenceExpression("array"), _
          New CodeArgumentReferenceExpression("index")}))
      co.Members.Add(cm)
      
      baseCompiler.GenerateCodeFromNamespace(cnamespace, w, Nothing)
   End Sub 'SpitList
End Class 'ListBuilder