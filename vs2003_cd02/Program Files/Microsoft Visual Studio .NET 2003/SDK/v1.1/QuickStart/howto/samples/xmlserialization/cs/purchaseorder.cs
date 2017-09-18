﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a tool.
//     Runtime Version: 1.1.4322.573
//
//     Changes to this file may cause incorrect behavior and will be lost if 
//     the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by xsd, Version=1.1.4322.573.
// 
namespace XmlSerializationHowTo {
    using System.Xml.Serialization;
    
    
    /// <remarks/>
    [System.Xml.Serialization.XmlRootAttribute("purchaseOrder", Namespace="", IsNullable=false)]
    public class PurchaseOrder {
        
        /// <remarks/>
        public USAddress shipTo;
        
        /// <remarks/>
        public USAddress billTo;
        
        /// <remarks/>
        public string comment;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlArrayItemAttribute("item", IsNullable=false)]
        public ItemsItem[] items;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute(DataType="date")]
        public System.DateTime orderDate;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool orderDateSpecified;
    }
    
    /// <remarks/>
    public class USAddress {
        
        /// <remarks/>
        public string name;
        
        /// <remarks/>
        public string street;
        
        /// <remarks/>
        public string city;
        
        /// <remarks/>
        public string state;
        
        /// <remarks/>
        public System.Decimal zip;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute(DataType="NMTOKEN")]
        public string country;
    }
    
    /// <remarks/>
    public class ItemsItem {
        
        /// <remarks/>
        public string productName;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType="positiveInteger")]
        public string quantity;
        
        /// <remarks/>
        public System.Decimal USPrice;
        
        /// <remarks/>
        public string comment;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType="date")]
        public System.DateTime shipDate;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool shipDateSpecified;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string partNum;
    }
}
