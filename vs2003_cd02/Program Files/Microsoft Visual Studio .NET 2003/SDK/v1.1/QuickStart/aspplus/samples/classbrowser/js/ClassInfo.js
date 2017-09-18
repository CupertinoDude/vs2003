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

import System ;
import System.Web;
import System.Web.UI;
import System.Collections;
import System.Globalization;
import System.Reflection;

package ClassInfoJS {
    public class SortTable extends Hashtable implements IComparable {
        public var sortField:String;

        public function SortTable() {
            this(null);
        }
        public function SortTable(sField:String) {
            sortField = sField;
        }

        public function IComparable.CompareTo(b:Object) : Int32 {
            if ( sortField == null ) {
                return 0;
            }

            return (String.Compare(this[sortField], SortTable(b)[sortField], false, CultureInfo.InvariantCulture));
        }
    }

    public class DisplayEvents extends ArrayList {
        public function DisplayEvents(classType:Type) {
            var eventInfos:System.Reflection.EventInfo[] = classType.GetEvents();

            if (eventInfos == null)
                return;

            var eventTable:ArrayList = new ArrayList();

            for (var x:int=0; x<eventInfos.Length; x++) {
                var eventDetails:SortTable = new SortTable("Name");

                eventDetails["Assembly"]    = eventInfos[x].EventHandlerType.Assembly.ToString();
                eventDetails["Name"]        = eventInfos[x].Name;
                eventDetails["Type"]        = eventInfos[x].EventHandlerType.Name;
                eventDetails["GetType"]     = eventInfos[x].EventHandlerType.Name;
                eventDetails["Namespace"]   = eventInfos[x].EventHandlerType.Namespace;

                if (eventInfos[x].IsMulticast == true) {
                    eventDetails["Access"] = "multicast ";
                }

                this.Add(eventDetails);
            }
            this.Sort();
        }
    }

    public class DisplayFields extends ArrayList {
        public function DisplayFields(classType:Type) {
            var x:int;
            var fieldInfos:System.Reflection.FieldInfo[] = classType.GetFields();

            if (fieldInfos == null)
                return;

            var fieldTable:ArrayList = new ArrayList();

            for (x=0; x<fieldInfos.Length; x++) {
                var fieldDetails:SortTable = new SortTable("Name");

                fieldDetails["Assembly"] = fieldInfos[x].GetType().Assembly.ToString();
                fieldDetails["Name"] = fieldInfos[x].Name;
                fieldDetails["Type"] = fieldInfos[x].FieldType.Name;

                if((fieldInfos[x].FieldType.IsArray && fieldInfos[x].FieldType.Name != "Array") ||  fieldInfos[x].FieldType.IsPointer) {
                    fieldDetails["GetType"]   = fieldInfos[x].FieldType.GetElementType().Name;
                    fieldDetails["Namespace"] = fieldInfos[x].FieldType.GetElementType().Namespace;
                } else {
                    fieldDetails["GetType"]   = fieldInfos[x].FieldType.Name;
                    fieldDetails["Namespace"] = fieldInfos[x].FieldType.Namespace;
                }
                if (fieldInfos[x].IsPublic == true) {
                    fieldDetails["Access"] = "public ";
                }
                else if (fieldInfos[x].IsPrivate == true) {
                    fieldDetails["Access"] = "private ";
                }
                else if (fieldInfos[x].IsFamily == true) {
                    fieldDetails["Access"] = "protected ";
                }

                if (fieldInfos[x].IsStatic == true) {
                    fieldDetails["Access"] = String(fieldDetails["Access"]) + "static ";
                }

                if (fieldInfos[x].IsLiteral == true) {
                    fieldDetails["Access"] = String(fieldDetails["Access"]) + "const ";
                }

                this.Add(fieldDetails);
           }
           this.Sort();
        }
    }

    public class DisplayConstructors extends ArrayList {
        public function DisplayConstructors(classType:Type) {
            var x,y:int;
            var constructorInfos:System.Reflection.ConstructorInfo[] = classType.GetConstructors();

            if (constructorInfos == null)
                return;

            for (x=0; x<constructorInfos.Length; x++) {
                var constructorDetails:SortTable = new SortTable();

                constructorDetails["Assembly"] = constructorInfos[x].GetType().Assembly.ToString();
                constructorDetails["Name"] = classType.Name;

                if (constructorInfos[x].IsPublic == true) {
                    constructorDetails["Access"] = "public ";
                }
                else if (constructorInfos[x].IsPrivate == true) {
                    constructorDetails["Access"] = "private ";
                }
                else if (constructorInfos[x].IsFamily == true) {
                    constructorDetails["Access"] = "protected ";
                }

                var paramInfos:System.Reflection.ParameterInfo[] = constructorInfos[x].GetParameters();
                if (paramInfos != null) {
                    var paramTable:ArrayList = new ArrayList();
                    for (y=0; y<paramInfos.Length; y++) {
                        var paramDetails:SortTable = new SortTable();

                        paramDetails["Assembly"]  = paramInfos[y].GetType().Assembly.ToString();
                        paramDetails["ParamName"] = paramInfos[y].Name;
                        paramDetails["ParamType"] = paramInfos[y].ParameterType.Name;
                        if ( ( paramInfos[y].ParameterType.IsArray && paramInfos[y].ParameterType.Name !="Array" ) || paramInfos[y].ParameterType.IsPointer ) {
                            paramDetails["GetType"]   = paramInfos[y].ParameterType.GetElementType().Name ;
                            paramDetails["Namespace"] = paramInfos[y].ParameterType.GetElementType().Namespace ;
                        } else {
                            paramDetails["GetType"]   = paramInfos[y].ParameterType.Name;
                            paramDetails["Namespace"] = paramInfos[y].ParameterType.Namespace ;
                        }
                        paramTable.Add(paramDetails);
                    }

                    constructorDetails["Params"] = paramTable;
                }
                this.Add(constructorDetails);
            }
        }
    }

    public class DisplayProperties extends ArrayList {
        public function DisplayProperties(classType:Type) {
            var x,y:int;
            var paramInfos:System.Reflection.ParameterInfo[];
            var propertyInfos:System.Reflection.PropertyInfo[] = classType.GetProperties();
            var paramTable:ArrayList;
            var paramDetails:SortTable;

            if (propertyInfos == null)
                return;

            var propertyTable:ArrayList = new ArrayList();

            for (x=0; x<propertyInfos.Length; x++) {
                var propertyDetails:SortTable = new SortTable("Name");

                if(propertyInfos[x].GetGetMethod() != null) {
                    if(( propertyInfos[x].GetGetMethod().ReturnType.IsArray && propertyInfos[x].GetGetMethod().ReturnType.Name !="Array" ) || propertyInfos[x].GetGetMethod().ReturnType.IsPointer ) {
                        propertyDetails["GetType"]   = propertyInfos[x].GetGetMethod().ReturnType.GetElementType().Name;
                        propertyDetails["Namespace"] = propertyInfos[x].GetGetMethod().ReturnType.GetElementType().Namespace;

                    } else {
                        propertyDetails["GetType"]   = propertyInfos[x].GetGetMethod().ReturnType.Name;
                        propertyDetails["Namespace"] = propertyInfos[x].GetGetMethod().ReturnType.Namespace;
                    }
                    propertyDetails["Type"]      = propertyInfos[x].GetGetMethod().ReturnType.Name;
                    propertyDetails["Assembly"]  = propertyInfos[x].GetGetMethod().ReturnType.Assembly.ToString();
                    propertyDetails["Name"]      = propertyInfos[x].Name;

                    if (propertyInfos[x].GetGetMethod().IsPublic == true) {
                         propertyDetails["Visibility"] = "public";
                    } else if (propertyInfos[x].GetGetMethod().IsPrivate == true) {
                         propertyDetails["Visibility"] = "private";
                    } else if (propertyInfos[x].GetGetMethod().IsFamily == true) {
                        propertyDetails["Visibility"] = "protected";
                    }

                    if (propertyInfos[x].GetGetMethod().IsStatic == true) {
                        propertyDetails["Visibility"] = String(propertyDetails["Visibility"]) + " static";
                    }

                    if (propertyInfos[x].GetSetMethod() == null) {
                        propertyDetails["Access"] =  "[Get]" ;
                    } else {
                        propertyDetails["Access"] = "[Get , Set]" ;
                    }

                    paramInfos = propertyInfos[x].GetGetMethod().GetParameters();

                    if (paramInfos != null) {
                        paramTable = new ArrayList();

                        for (y=0; y<paramInfos.Length; y++) {
                            paramDetails = new SortTable();
                            paramDetails["Assembly"] = paramInfos[y].GetType().Assembly.ToString();
                            paramDetails["ParamName"] = paramInfos[y].Name;
                            paramDetails["ParamType"] = paramInfos[y].ParameterType.Name;
                            if (( paramInfos[y].ParameterType.IsArray && paramInfos[y].ParameterType.Name !="Array") ||paramInfos[y].ParameterType.IsPointer ) {
                                paramDetails["GetType"]   = paramInfos[y].ParameterType.GetElementType().Name ;
                                paramDetails["Namespace"] = paramInfos[y].ParameterType.GetElementType().Namespace ;
                            } else {
                                paramDetails["GetType"]   = paramInfos[y].ParameterType.Name;
                                paramDetails["Namespace"] = paramInfos[y].ParameterType.Namespace ;
                            }
                            paramTable.Add(paramDetails);
                        }

                        propertyDetails["Params"] = paramTable;
                   }
                } else if(propertyInfos[x].GetSetMethod() != null) {
                    propertyDetails["GetType"]   = propertyInfos[x].GetSetMethod().ReturnType.Name;
                    propertyDetails["Namespace"] = propertyInfos[x].GetSetMethod().ReturnType.Namespace;
                    propertyDetails["Type"]      = propertyInfos[x].GetSetMethod().ReturnType.Name;
                    propertyDetails["Assembly"]  = propertyInfos[x].GetSetMethod().ReturnType.Assembly.ToString();
                    propertyDetails["Name"]      = propertyInfos[x].Name;

                    if (propertyInfos[x].GetSetMethod().IsPublic == true) {
                         propertyDetails["Visibility"] = "public";
                    } else if (propertyInfos[x].GetSetMethod().IsPrivate == true) {
                         propertyDetails["Visibility"] = "private";
                    } else if (propertyInfos[x].GetSetMethod().IsFamily == true) {
                        propertyDetails["Visibility"] = "protected";
                    }

                    if (propertyInfos[x].GetSetMethod().IsStatic == true) {
                        propertyDetails["Visibility"] = String(propertyDetails["Visibility"]) + " static";
                    }
                    propertyDetails["Access"] = "[ Set ]" ;

                    paramInfos = propertyInfos[x].GetSetMethod().GetParameters();
                    if (paramInfos != null) {
                        paramTable = new ArrayList();

                        for (y=0; y<paramInfos.Length; y++) {
                            paramDetails = new SortTable();
                            paramDetails["Assembly"] = paramInfos[y].GetType().Assembly.ToString();
                            paramDetails["ParamName"] = paramInfos[y].Name;
                            paramDetails["ParamType"] = paramInfos[y].ParameterType.Name;
                            if(( paramInfos[y].ParameterType.IsArray && paramInfos[y].ParameterType.Name !="Array") || paramInfos[y].ParameterType.IsPointer) {
                                paramDetails["GetType"]   = paramInfos[y].ParameterType.GetElementType().Name ;
                                paramDetails["Namespace"] = paramInfos[y].ParameterType.GetElementType().Namespace ;
                            } else {
                                paramDetails["GetType"]   = paramInfos[y].ParameterType.Name;
                                paramDetails["Namespace"] = paramInfos[y].ParameterType.Namespace ;
                            }
                            paramTable.Add(paramDetails);
                        }
                        propertyDetails["Params"] = paramTable;
                   }
                }
               this.Add(propertyDetails);
            }
            this.Sort();
        }
    }

    public class DisplayMethods extends ArrayList {
         public function DisplayMethods(classType:Type, myclassname:String) {
             var x,y:int;
             var methodInfos:System.Reflection.MethodInfo[] = classType.GetMethods();

             if (methodInfos == null)
                 return;

             for (x=0; x<methodInfos.Length; x++) {
                 if((String.Compare(myclassname,methodInfos[x].DeclaringType.Name,false,CultureInfo.InvariantCulture)==0)&&(methodInfos[x].IsPublic || methodInfos[x].IsFamily) && (!(methodInfos[x].IsSpecialName)) ) {
                     var MethodDetails:SortTable = new SortTable("Name");

                     MethodDetails["Assembly"] = methodInfos[x].GetType().Assembly.ToString();
                     MethodDetails["Name"] = methodInfos[x].Name;
                     MethodDetails["Type"] = methodInfos[x].ReturnType.Name;
                     if(( methodInfos[x].ReturnType.IsArray && methodInfos[x].ReturnType.Name !="Array") ||  methodInfos[x].ReturnType.IsPointer) {
                         // For Supporting Multi-Dimension Arrays as Return Type
                         var ReturnElementType:Type =  methodInfos[x].ReturnType.GetElementType();
                         while(ReturnElementType.IsArray) {
                            ReturnElementType =  ReturnElementType.GetElementType();
                         }
                         MethodDetails["GetType"]   = ReturnElementType.Name ;
                         MethodDetails["Namespace"] = ReturnElementType.Namespace ;
                     } else {
                        MethodDetails["GetType"] = methodInfos[x].ReturnType.Name;
                        MethodDetails["Namespace"] = methodInfos[x].ReturnType.Namespace ;
                     }

                     if (methodInfos[x].IsPublic == true) {
                         MethodDetails["Access"] = "public ";
                     } else if (methodInfos[x].IsPrivate == true) {
                         MethodDetails["Access"] = "private ";
                     } else if (methodInfos[x].IsFamily == true) {
                         MethodDetails["Access"] = "protected ";
                     }

                     if (methodInfos[x].IsStatic == true) {
                         MethodDetails["Access"] = String(MethodDetails["Access"]) + "static ";
                     }

                     var paramInfos:System.Reflection.ParameterInfo[] = methodInfos[x].GetParameters();

                    if (paramInfos != null) {
                        var paramTable:ArrayList = new ArrayList();

                        for (y=0; y<paramInfos.Length; y++) {
                            var paramDetails:SortTable = new SortTable();
                            paramDetails["Assembly"]  = paramInfos[y].GetType().Assembly.ToString();
                            paramDetails["ParamName"] = paramInfos[y].Name;
                            paramDetails["ParamType"] = paramInfos[y].ParameterType.Name;
                            if(( paramInfos[y].ParameterType.IsArray && paramInfos[y].ParameterType.Name != "Array" )  || paramInfos[y].ParameterType.IsPointer) {
                                paramDetails["GetType"]   = paramInfos[y].ParameterType.GetElementType().Name ;
                                paramDetails["Namespace"] = paramInfos[y].ParameterType.GetElementType().Namespace ;
                            } else {
                                paramDetails["GetType"]   = paramInfos[y].ParameterType.Name;
                                paramDetails["Namespace"] = paramInfos[y].ParameterType.Namespace ;
                            }
                            paramTable.Add(paramDetails);
                        }

                        MethodDetails["Params"] = paramTable;
                    }
                    this.Add(MethodDetails);
                }
            }
            this.Sort();
        }
    }

    public class DisplayInterfaces extends ArrayList {
        public function DisplayInterfaces(classType:Type) {
             var x:int;
             var classInterfaces:Type[] = classType.GetInterfaces();
             for(x=0; x < classInterfaces.Length ; x++) {

                var interfaceDetails:SortTable = new SortTable();

                interfaceDetails["Assembly"]     = classInterfaces[x].Assembly.ToString();
                interfaceDetails["FullName"]     = classInterfaces[x].FullName;
                interfaceDetails["GetType"]      = classInterfaces[x].Name;
                interfaceDetails["Namespace"]    = classInterfaces[x].Namespace;
                this.Add(interfaceDetails);
             }
         }
    }

    public class DisplaySuperclasses extends ArrayList {
        public function DisplaySuperclasses(classType:Type) {
           var SuperClass:Type;
           var classDetails:SortTable = new SortTable();

           classDetails["Assembly"]     = classType.Assembly.ToString();
           classDetails["FullName"]     = classType.FullName;
           classDetails["GetType"]      = classType.Name;
           classDetails["Namespace"]    = classType.Namespace;

           this.Add(classDetails);

           while (classType.BaseType != null) {
               var superclassDetails:SortTable = new SortTable();
               SuperClass =  classType.BaseType ;
               classType   =  SuperClass        ;

               superclassDetails["Assembly"]     = SuperClass.Assembly.ToString();
               superclassDetails["FullName"]     = SuperClass.FullName;
               superclassDetails["GetType"]      = SuperClass.Name;
               superclassDetails["Namespace"]    = SuperClass.Namespace;

               this.Add(superclassDetails);
           }
           this.Reverse() ;
        }
    }

    public class DisplaySubClasses extends ArrayList {
        private var classType:Type;
        private var CorRuntime:Module[];
        private var CorClasses:Type[];
        private var myclassname:String;
        private var classInterfaces:Type[];

        public function DisplaySubClasses(classtype:Type, ModuleName:ArrayList) {
            var x,y,i:int;
            var subclassDetails:SortTable;

            this.classType = classtype;
            myclassname = classType.FullName ;
            if (classType.IsInterface ) {
                for(y = 0 ; y <  ModuleName.Count ;y++) {
                    CorRuntime = Assembly.Load(String(ModuleName[y])).GetModules();
                    CorClasses   = CorRuntime[0].GetTypes() ;

                    for(x=0; x < CorClasses.Length; x++) {
                        classType       =  CorClasses[x];
                        classInterfaces =  classType.GetInterfaces() ;

                        for(i = 0 ; i < classInterfaces.Length ; i++) {
                            if(String.Compare(myclassname, classInterfaces[i].FullName, false, CultureInfo.InvariantCulture )==0)
                            {
                                 subclassDetails = new SortTable("FullName");
                                 subclassDetails["Assembly"]     = classType.Assembly.ToString();
                                 subclassDetails["FullName"]     = classType.FullName;
                                 subclassDetails["GetType"]      = classType.Name;
                                 subclassDetails["Namespace"]    = classType.Namespace;
                                 this.Add(subclassDetails) ;
                            }
                        }
                    }
                }
            } else {
                for(y = 0; y < ModuleName.Count ; y++) {
                    CorRuntime = Assembly.Load(String(ModuleName[y])).GetModules();
                    CorClasses  = CorRuntime[0].GetTypes();

                    for(x= 0 ; x< CorClasses.Length ;x++) {
                        classType = CorClasses[x].BaseType ;

                        if ( null != classType  ) {
                            if( String.Compare(classType.FullName, myclassname, false, CultureInfo.InvariantCulture)==0) {
                                subclassDetails = new SortTable("FullName");
                                subclassDetails["Assembly"]     = CorClasses[x].Assembly.ToString();
                                subclassDetails["FullName"]     = CorClasses[x].FullName;
                                subclassDetails["GetType"]      = CorClasses[x].Name;
                                subclassDetails["Namespace"]    = CorClasses[x].Namespace;
                                this.Add(subclassDetails) ;
                            }
                        }
                    }
                }
            }
            this.Sort();
        }
    }
}


 