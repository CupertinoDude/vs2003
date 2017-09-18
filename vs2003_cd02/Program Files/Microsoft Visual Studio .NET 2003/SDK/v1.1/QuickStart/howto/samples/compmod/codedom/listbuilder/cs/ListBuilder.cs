//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

using System;
using System.Collections;
using System.CodeDom;
using System.CodeDom.Compiler;
using System.IO;
using System.Reflection;
using Microsoft.CSharp;
using Microsoft.VisualBasic;
using System.Globalization;

public class ListBuilder {
    private static String usage = Environment.NewLine +
        "USAGE:  ListBuilder -T:<TypeName> -L:<Lang> -N:<Namespace>" +
        Environment.NewLine;

    public static void Main (String [] args) {
        if (args.Length < 1) {
            Console.WriteLine(usage);
            return;
        }

        string typeName = String.Empty;
        string ns = String.Empty;
        string suffix = "cs";
        string compileLine = "csc /t:library {0}";
        ICodeGenerator cg = new CSharpCodeProvider().CreateGenerator();

        foreach (string arg in args) {
            switch (arg.ToUpper(CultureInfo.InvariantCulture).Substring(0,3)) {
                case "-L:":
                case "/L:":
                    string lang = arg.Remove (0, 3);
                    switch (lang.ToUpper(CultureInfo.InvariantCulture)) {
                        case "C#":
                        case "CS":
         	            suffix = "cs";
                            compileLine = "csc /t:library {0}";
                            CSharpCodeProvider cdp = new CSharpCodeProvider();
                            cg = cdp.CreateGenerator();
                            break;
                        case "VB":
                            VBCodeProvider vdp = new VBCodeProvider();
                            cg = vdp.CreateGenerator();
                            suffix = "vb";
                            compileLine = "vbc /t:library {0}";
                            break;
                        default:
                            Console.WriteLine("unknown lang |{0}|", lang);
                            Console.WriteLine("Use: CS, VB");
                            Console.WriteLine(usage);
                            return;
                    }
                    break;
                case "-N:":
                case "/N:":
                    ns = arg.Remove(0,3);
                    compileLine = compileLine.Insert(
                        compileLine.IndexOf("{"),"/r:{1}.dll ");
                    break;
                case "-T:":
                case "/T:":
                    typeName = arg.Remove(0,3);
                    break;
                case "-?":
                case "/?":
                default:
                    Console.WriteLine(usage);
                    return;
            }
        }

        // Check to make sure type was passed
        if (typeName == String.Empty) 
        {
            Console.WriteLine(usage);
            return;
        }

        string fileName = typeName + "Collection." + suffix;
        Console.WriteLine("Creating source file {0}.", fileName);

        if (compileLine != null)
        {
            Console.WriteLine("compile with: '{0}'.", 
                String.Format(compileLine, fileName, ns));
        }

        TextWriter t = new StreamWriter(new FileStream(fileName, FileMode.Create));
        SpitList(t, typeName, cg, ns);
        t.Close();
    }

    public static void SpitList(TextWriter w, String typeName, 
        ICodeGenerator baseCompiler, String ns) {

        CodeCommentStatement c = new CodeCommentStatement(
            String.Format("List of {0}", typeName));
        baseCompiler.GenerateCodeFromStatement(c, w, null);

        //Gen: namespace Microsoft.Samples {
        //         using System;
        //         using System.Collections;
        //         using <NAMESPACE>
        CodeNamespace cnamespace = new CodeNamespace("Microsoft.Samples");
        cnamespace.Imports.Add(new CodeNamespaceImport("System"));
        cnamespace.Imports.Add(new CodeNamespaceImport("System.Collections"));
        if (ns != null &&  ns != "") 
        {
            cnamespace.Imports.Add(new CodeNamespaceImport(ns));
        }

        //Gen: public class FontEnumerator : System.Collections.IEnumerator, 
        //         System.ICloneable {
        CodeTypeDeclaration clEnumerator = 
            new CodeTypeDeclaration(typeName + "Enumerator");
        clEnumerator.IsClass = true;
        //Add this so that VB does not Inherit either interface
	clEnumerator.BaseTypes.Add("Object");
        clEnumerator.BaseTypes.Add(typeof(System.Collections.IEnumerator));
        clEnumerator.BaseTypes.Add(typeof(System.ICloneable));
        clEnumerator.TypeAttributes = TypeAttributes.Public;
        cnamespace.Types.Add(clEnumerator);

        //Gen:  private <TYPE>Collection parentColl;
        //      private int index;
        //      private <TYPE> currentElement;
        CodeMemberField varParent = 
            new CodeMemberField(typeName + "Collection", "parentColl");
        clEnumerator.Members.Add(varParent);
        CodeMemberField varIndex = 
            new CodeMemberField(new CodeTypeReference(typeof(int)), "index");
        clEnumerator.Members.Add(varIndex);
        CodeMemberField varCurrent = 
            new CodeMemberField(typeName, "currentElement");
        clEnumerator.Members.Add(varCurrent);

        //Gen: public <TYPE>Enumerator(<TYPE>Collection input) {
        //         parentColl = input;
        //         index = -1;
        //     }
        CodeConstructor enumConstructor = new CodeConstructor();
        enumConstructor.Attributes = MemberAttributes.Public | MemberAttributes.Final;
        enumConstructor.Parameters.Add(new CodeParameterDeclarationExpression(
            new CodeTypeReference(typeName + "Collection"), "input"));
        enumConstructor.Statements.Add(new CodeAssignStatement(
            new CodeVariableReferenceExpression("parentColl"),
            new CodeVariableReferenceExpression("input")));
        enumConstructor.Statements.Add(new CodeAssignStatement(
            new CodeVariableReferenceExpression("index"),
            new CodePrimitiveExpression(-1)));
        clEnumerator.Members.Add(enumConstructor);

        //Gen: public virtual object Clone() {
        //         return this.MemberwiseClone();
        //     }
        CodeMemberMethod cm = new CodeMemberMethod();
        cm.Name = "Clone";
        cm.ReturnType = new CodeTypeReference(typeof(Object));
        cm.Attributes = MemberAttributes.Public;
        cm.ImplementationTypes.Add(new CodeTypeReference(typeof(System.ICloneable)));
        cm.Statements.Add(new CodeMethodReturnStatement(
            new CodeMethodReferenceExpression(
            new CodeThisReferenceExpression(), "MemberwiseClone()")));
        clEnumerator.Members.Add (cm);

        //Gen:
        //public bool MoveNext() {
        //    if ((index < parentColl.Count - 1)) {
        //        index = (index + 1);
        //        currentElement = this.parentColl[index];
        //        return true;
        //    }
        //    else {
        //        return false;
        //    }
        //}
        cm = new CodeMemberMethod();
        cm.Name = "MoveNext";
        cm.ReturnType = new CodeTypeReference(typeof(bool));
        cm.Attributes = MemberAttributes.Public | MemberAttributes.Final;
        cm.ImplementationTypes.Add(new CodeTypeReference(
            typeof(System.Collections.IEnumerator)));
        cm.Statements.Add(new CodeConditionStatement(
            new CodeBinaryOperatorExpression(
            new CodeVariableReferenceExpression("index"),
            CodeBinaryOperatorType.LessThan,
            new CodeVariableReferenceExpression("parentColl.Count - 1")),
            new CodeStatement[]{
                new CodeAssignStatement(new CodeVariableReferenceExpression("index"),
                new CodeBinaryOperatorExpression(
                new CodeVariableReferenceExpression("index"), 
                CodeBinaryOperatorType.Add, new CodePrimitiveExpression(1))),
                new CodeAssignStatement(new CodeVariableReferenceExpression(
                "currentElement"), new CodeIndexerExpression(
                new CodeFieldReferenceExpression(new CodeThisReferenceExpression(),
                "parentColl"), new CodeArgumentReferenceExpression("index"))),
                new CodeMethodReturnStatement(new CodePrimitiveExpression(true))},
            new CodeStatement[]{new CodeMethodReturnStatement(
                new CodePrimitiveExpression(false))}));
        clEnumerator.Members.Add (cm);

        //Gen: public void Reset() {
        //         index = -1;
        //         currentElement = null;
        //     }
        cm = new CodeMemberMethod();
        cm.Name = "Reset";
        cm.ReturnType = new CodeTypeReference(typeof(void));
        cm.Attributes = MemberAttributes.Public | MemberAttributes.Final;
        cm.ImplementationTypes.Add(new CodeTypeReference(
            typeof(System.Collections.IEnumerator)));
        cm.Statements.Add(new CodeAssignStatement(
            new CodeVariableReferenceExpression("index"),
            new CodePrimitiveExpression(-1)));
        cm.Statements.Add(new CodeAssignStatement(
            new CodeVariableReferenceExpression("currentElement"),
            new CodePrimitiveExpression(null)));
        clEnumerator.Members.Add (cm);

        //Gen: Object IEnumerator.Current {
        //         get {
        //             if (index < 0)
        //                 throw new InvalidOperationException();
        //             if(index >= parentColl.Count)
        //                 throw new InvalidOperationException();
        //             return currentElement;
        //         }
        //     }
        CodeMemberProperty cp = new CodeMemberProperty();
        cp.Name = "Current";
        cp.Attributes = MemberAttributes.Final | MemberAttributes.Public;
        cp.Type = new CodeTypeReference(typeof(Object));
        cp.ImplementationTypes.Add(new CodeTypeReference(
            typeof(System.Collections.IEnumerator)));
        cp.GetStatements.Add(new CodeConditionStatement(
            new CodeBinaryOperatorExpression(
            new CodeVariableReferenceExpression("index"),
            CodeBinaryOperatorType.LessThan,
            new CodePrimitiveExpression(0)),
            new CodeStatement[]{new CodeThrowExceptionStatement(
            new CodeSnippetExpression("new InvalidOperationException()"))}));
        cp.GetStatements.Add(new CodeConditionStatement(
            new CodeBinaryOperatorExpression(
            new CodeVariableReferenceExpression("index"),
            CodeBinaryOperatorType.GreaterThanOrEqual,
            new CodeVariableReferenceExpression("parentColl.Count")),
            new CodeStatement[]{new CodeThrowExceptionStatement(
            new CodeSnippetExpression("new InvalidOperationException()"))}));
        cp.GetStatements.Add(new CodeMethodReturnStatement(
            new CodeVariableReferenceExpression("currentElement")));
        clEnumerator.Members.Add(cp);

        //Gen: public class <TYPE>Collection : System.Collections.CollectionBase {
        CodeTypeDeclaration co = new CodeTypeDeclaration (typeName + "Collection");
        co.IsClass = true;
        cnamespace.Types.Add(co);
        co.BaseTypes.Add(typeof(CollectionBase));
        co.TypeAttributes  = TypeAttributes.Public;

        //Gen: public <TYPE> this[int index] {
        //      get {
        //         return ((<TYPE>)List[index]);
        //      }
        //      set {
        //          List[index] = value;
        //      }
        //  }
        cp = new CodeMemberProperty();
        cp.Name = "Item";
        cp.Attributes = MemberAttributes.Public | MemberAttributes.Final;
        cp.Type = new CodeTypeReference(typeName);
        cp.Parameters.Add (new CodeParameterDeclarationExpression(
            new CodeTypeReference(typeof(int)), "index"));
        cp.GetStatements.Add(new CodeMethodReturnStatement(
            new CodeCastExpression(typeName, 
            new CodeIndexerExpression(new CodeFieldReferenceExpression(
            new CodeThisReferenceExpression(), "List"), 
            new CodeArgumentReferenceExpression("index")))));
        cp.SetStatements.Add(new CodeAssignStatement (
            new CodeIndexerExpression(new CodeFieldReferenceExpression(
            new CodeThisReferenceExpression(),"List"),
            new CodeArgumentReferenceExpression("index")), 
            new CodeArgumentReferenceExpression("value")));
        co.Members.Add (cp);


        //Gen: public int Add(<TYPE> value) {
        //        return List.Add(value);
        //      }
        cm = new CodeMemberMethod();
        cm.Name = "Add";
        cm.ReturnType = new CodeTypeReference(typeof(int));
        cm.Parameters.Add(new CodeParameterDeclarationExpression(typeName, "value"));
        cm.Attributes = MemberAttributes.Public | MemberAttributes.Final;
        cm.Statements.Add(new CodeMethodReturnStatement(
            new CodeMethodInvokeExpression(new CodeFieldReferenceExpression(
            new CodeThisReferenceExpression(),"List"), "Add", 
            new CodeArgumentReferenceExpression("value"))));
        co.Members.Add (cm);

        //Gen: public new IEnumerator GetEnumerator() {
        //         return new <TYPE>Enumerator(this);
        //     }
        cm = new CodeMemberMethod();
        cm.Name = "GetEnumerator";
        cm.ReturnType = new CodeTypeReference(typeof(IEnumerator));
        cm.Attributes = MemberAttributes.Public | MemberAttributes.Final | 
            MemberAttributes.New;
        cm.Statements.Add(new CodeMethodReturnStatement(
            new CodeObjectCreateExpression(
            new CodeTypeReference(typeName + "Enumerator"),
            new CodeExpression[]{new CodeThisReferenceExpression()})));
        co.Members.Add(cm);

        //Gen: public void Insert(int index, <TYPE> value)
        //         List.Insert(index, info);
        //     }
        cm = new CodeMemberMethod();
        cm.Name = "Insert";
        cm.ReturnType = new CodeTypeReference(typeof(void));
        cm.Parameters.Add(new CodeParameterDeclarationExpression(
            new CodeTypeReference(typeof(int)), "index"));
        cm.Parameters.Add(new CodeParameterDeclarationExpression (typeName, "value"));
        cm.Attributes = MemberAttributes.Public | MemberAttributes.Final;
        cm.Statements.Add(new CodeMethodInvokeExpression(
            new CodeFieldReferenceExpression(
            new CodeThisReferenceExpression(),"List"), "Insert", 
            new CodeArgumentReferenceExpression("index"),
            new CodeArgumentReferenceExpression  ("value")));
        co.Members.Add (cm);

        //Gen: public int IndexOf(<TYPE> value) {
        //        return List.IndexOf(value);
        //      }
        cm = new CodeMemberMethod();
        cm.Name = "IndexOf";
        cm.ReturnType = new CodeTypeReference(typeof(int));
        cm.Parameters.Add(new CodeParameterDeclarationExpression(typeName, "value"));
        cm.Attributes = MemberAttributes.Public | MemberAttributes.Final;
        cm.Statements.Add(new CodeMethodReturnStatement(
            new CodeMethodInvokeExpression(new CodeFieldReferenceExpression(
            new CodeThisReferenceExpression(),"List"), "IndexOf", 
            new CodeExpression []
            {new CodeArgumentReferenceExpression("value")})));
        co.Members.Add (cm);

        //Gen: public bool Contains(<TYPE> value) {
        //        return List.Contains(value);
        //      }
        cm = new CodeMemberMethod();
        cm.Name = "Contains";
        cm.ReturnType = new CodeTypeReference(typeof(bool));
        cm.Parameters.Add(new CodeParameterDeclarationExpression(typeName, "value"));
        cm.Attributes = MemberAttributes.Public | MemberAttributes.Final;
        cm.Statements.Add(new CodeMethodReturnStatement(
            new CodeMethodInvokeExpression (new CodeFieldReferenceExpression(
            new CodeThisReferenceExpression(),"List"), "Contains", 
            new CodeExpression []
            {new CodeArgumentReferenceExpression  ("value")})));
        co.Members.Add (cm);

        //Gen: public void Remove(<TYPE> value) {
        //       List.Remove(value);
        //      }
        cm = new CodeMemberMethod();
        cm.Name = "Remove";
        cm.Parameters.Add(new CodeParameterDeclarationExpression(typeName, "value"));
        cm.Attributes = MemberAttributes.Public | MemberAttributes.Final;
        cm.Statements.Add(new CodeMethodInvokeExpression(
            new CodeFieldReferenceExpression(
            new CodeThisReferenceExpression(),"List"),"Remove",
            new CodeExpression []
            {new CodeArgumentReferenceExpression ("value")}));
        co.Members.Add (cm);

        //Gen: public void CopyTo(<Type>[] array, int index) {
        //         List.CopyTo(array, index);
        //     }
        cm = new CodeMemberMethod();
        cm.Name = "CopyTo";
        cm.Parameters.Add(new CodeParameterDeclarationExpression(
            new CodeTypeReference(typeName, 1), "array"));
        cm.Parameters.Add(new CodeParameterDeclarationExpression(
            new CodeTypeReference(typeof(int)), "index"));
        cm.Attributes = MemberAttributes.Public | MemberAttributes.Final;
        cm.Statements.Add(new CodeMethodInvokeExpression(
            new CodeFieldReferenceExpression(
            new CodeThisReferenceExpression(),"List"), "CopyTo", 
            new CodeExpression []
            {new CodeArgumentReferenceExpression("array"), 
            new CodeArgumentReferenceExpression("index")}));
        co.Members.Add(cm);

        baseCompiler.GenerateCodeFromNamespace(cnamespace, w, null);
    }
}