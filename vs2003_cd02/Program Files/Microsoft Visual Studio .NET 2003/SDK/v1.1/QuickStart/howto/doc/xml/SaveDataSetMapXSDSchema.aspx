<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Save DataSet mappings to an XSD schema file?</h4>

<p>
This sample illustrates how to save the internal DataSet mappings to an XML Schema Definition language (XSD) schema file. This sample builds the mappings by using the relational methods on the DataSet to create tables and columns. The sample then writes an XSD schema representation of these mappings out to a file.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/SaveDataSetMapXSDSchema/CS/SaveDataSetMapXSDSchema.aspx"
ViewSource="/quickstart/howto/samples/Xml/SaveDataSetMapXSDSchema/SaveDataSetMapXSDSchema.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# SaveDataSetMapXSDSchema.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/SaveDataSetMapXSDSchema/SaveDataSetMapXSDSchema.src"
RunSample="/quickstart/howto/samples/Xml/SaveDataSetMapXSDSchema/VB/SaveDataSetMapXSDSchema.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB SaveDataSetMapXSDSchema.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/SaveDataSetMapXSDSchema/SaveDataSetMapXSDSchema.src"
RunSample="/quickstart/howto/samples/Xml/SaveDataSetMapXSDSchema/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ SaveDataSetMapXSDSchema.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
The DataSet and XmlDataDocument classes both represent an in-memory data cache. The DataSet provides relationally orientated navigational and editing methods, while the XmlDataDocument provides XML navigational and editing methods.
<p>
This sample gets the DataSet property from the XmlDataDocument, uses it to build a set of tables and columns, and then populate those tables and columns. The sample then writes out the internally generated schema.
<p>
The following sample code builds two tables, one of people and the other of pets. The sample uses an ID as a primary key into each of the tables, and builds a relationship table between the people and their pets. To do this, the sample first creates an instance of an XmlDataDocument and then passes the DataSet associated with the XmlDataDocument to the LoadDataSet method.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
XmlDataDocument datadoc = new XmlDataDocument();
LoadDataSet(datadoc.DataSet);
</Tab>
<Tab Name="VB">
Dim datadoc As XmlDataDocument = New XmlDataDocument()
LoadDataSet(datadoc.DataSet)
</Tab>
<Tab Name="C++">
XmlDataDocument* datadoc = new XmlDataDocument();
LoadDataSet(datadoc->DataSet);
</Tab>
</Acme:TabControl>

<p>
The LoadDataSet method loads the dataset with relational data.
<p>


<Acme:TabControl runat="server">
<Tab Name="C#">
// Load a DataSet with relational data
private void LoadDataSet(DataSet dataset)
{
    try
    {
        Console.WriteLine("Loading the DataSet ...");

        // Set DataSet name
        dataset.DataSetName = "PersonPet";

        // Create tables for people and pets
        DataTable people = new DataTable("Person");
        DataTable pets = new DataTable("Pet");

        // Set up the columns in the Tables
        DataColumn personname = new DataColumn ("Name", typeof(String));
        DataColumn personAge = new DataColumn ("Age", typeof(Int32));

        DataColumn petname = new DataColumn ("Name", typeof(String));
        DataColumn pettype = new DataColumn ("Type", typeof(String));

        // Add columns to person table
        DataColumn id = people.Columns.Add("ID", typeof(Int32));
        id.AutoIncrement = true;
        people.PrimaryKey = new DataColumn[] {id};
        people.Columns.Add (personname);
        people.Columns.Add (personAge);

        // Add columns to pet table
        id = pets.Columns.Add("ID", typeof(Int32));
        id.AutoIncrement = true;
        pets.PrimaryKey = new DataColumn[] {id};
        id.AutoIncrement = true;
        DataColumn ownerid = pets.Columns.Add("OwnerID", typeof(Int32));
        DataColumn[] foreignkey = new DataColumn[] {ownerid};
        pets.Columns.Add (petname);
        pets.Columns.Add (pettype);

        // Add tables to the DataSet
        dataset.Tables.Add (people);
        dataset.Tables.Add (pets);

        // Add people
        DataRow mark = people.NewRow();
        mark[personname] = "Mark";
        mark[personAge] = 18;
        people.Rows.Add(mark);

        DataRow william = people.NewRow();
        william[personname] = "William";
        william[personAge] = 12;
        people.Rows.Add(william);

        DataRow james = people.NewRow();
        james[personname] = "James";
        james[personAge] = 7;
        people.Rows.Add(james);

        DataRow levi = people.NewRow();
        levi[personname] = "Levi";
        levi[personAge] = 4;
        people.Rows.Add(levi);

        // Add relationships
        Console.WriteLine("Creating relationships between people and pets ...");
        DataRelation personpetrel = new DataRelation ("PersonPet",people.PrimaryKey, foreignkey);
        dataset.Relations.Add (personpetrel);

        // Add pets
        DataRow row = pets.NewRow();
        row["OwnerID"] = mark["ID"];
        row[petname] = "Frank";
        row[pettype] = "cat";
        pets.Rows.Add(row);

        row = pets.NewRow();
        row["OwnerID"] = william["ID"];
        row[petname] = "Rex";
        row[pettype] = "dog";
        pets.Rows.Add(row);

        row = pets.NewRow();
        row["OwnerID"] = james["ID"];
        row[petname] = "Cottontail";
        row[pettype] = "rabbit";
        pets.Rows.Add(row);

        row = pets.NewRow();
        row["OwnerID"] = levi["ID"];
        row[petname] = "Sid";
        row[pettype] = "snake";
        pets.Rows.Add(row);

        row = pets.NewRow();
        row["OwnerID"] = levi["ID"];
        row[petname] = "Tickles";
        row[pettype] = "spider";
        pets.Rows.Add(row);

        row = pets.NewRow();
        row["OwnerID"] = william["ID"];
        row[petname] = "Tweetie";
        row[pettype] = "canary";
        pets.Rows.Add(row);

        // commit changes
        dataset.AcceptChanges();
    }

    catch (Exception e)
    {
        Console.WriteLine("Exception: {0}", e.ToString());
    }
}
</Tab>
<Tab Name="VB">
' Load a DataSet with relational data
private sub LoadDataSet(dataset as DataSet)

    try
        Console.WriteLine("Loading the DataSet ...")

        ' Set DataSet name
        dataset.DataSetName = "PersonPet"

        ' Create tables for people and pets
        Dim people as DataTable = new DataTable("Person")
        Dim pets as DataTable = new DataTable("Pet")

        ' Set up the columns in the Tables
        Dim personname as DataColumn = new DataColumn ("Name", GetType (System.String))
        Dim personAge as DataColumn = new DataColumn ("Age", GetType (System.Int32))

        Dim petname as DataColumn = new DataColumn ("Name", GetType (System.String))
        Dim pettype as DataColumn = new DataColumn ("Type", GetType (System.String))

        ' Add columns to person table
        Dim id as DataColumn = people.Columns.Add("ID", GetType (System.Int32))
        id.AutoIncrement = true
        Dim primarykey as DataColumn() = new DataColumn() {id}
        people.PrimaryKey = primarykey
        people.Columns.Add (personname)
        people.Columns.Add (personAge)

        ' Add columns to pet table
        id = pets.Columns.Add("ID", GetType (System.Int32))
        id.AutoIncrement = true
        pets.PrimaryKey = new DataColumn() {id}
        id.AutoIncrement = true
        Dim ownerid as DataColumn = pets.Columns.Add("OwnerID", GetType (System.Int32))
        Dim foreignkey as DataColumn() = new DataColumn() {ownerid}
        pets.Columns.Add (petname)
        pets.Columns.Add (pettype)

        ' Add tables to the DataSet
        dataset.Tables.Add (people)
        dataset.Tables.Add (pets)

        ' Add people
        Dim mark as DataRow = people.NewRow()
        mark(personname) = "Mark"
        mark(personAge) = 18
        people.Rows.Add(mark)

        Dim william as DataRow = people.NewRow()
        william(personname) = "William"
        william(personAge) = 12
        people.Rows.Add(william)

        Dim james as DataRow = people.NewRow()
        james(personname) = "James"
        james(personAge) = 19
        people.Rows.Add(james)

        Dim levi as DataRow = people.NewRow()
        levi(personname) = "Levi"
        levi(personAge) = 4
        people.Rows.Add(levi)

        ' Add relationships
        Console.WriteLine("Creating relationships between people and pets ...")
        Dim personpetrel as DataRelation = new DataRelation ("PersonPet", primarykey, foreignkey, false)
        dataset.Relations.Add (personpetrel)

        ' Add pets
        Dim row as DataRow = pets.NewRow()
        row("OwnerID") = mark("ID")
        row(petname) = "Frank"
        row(pettype) = "cat"
        pets.Rows.Add(row)

        row = pets.NewRow()
        row("OwnerID") = william("ID")
        row(petname) = "Rex"
        row(pettype) = "dog"
        pets.Rows.Add(row)

        row = pets.NewRow()
        row("OwnerID") = james("ID")
        row(petname) = "Cottontail"
        row(pettype) = "rabbit"
        pets.Rows.Add(row)

        row = pets.NewRow()
        row("OwnerID") = levi("ID")
        row(petname) = "Sid"
        row(pettype) = "snake"
        pets.Rows.Add(row)

        row = pets.NewRow()
        row("OwnerID") = levi("ID")
        row(petname) = "Tickles"
        row(pettype) = "spider"
        pets.Rows.Add(row)

        row = pets.NewRow()
        row("OwnerID") = william("ID")
        row(petname) = "Tweetie"
        row(pettype) = "canary"
        pets.Rows.Add(row)

        ' commit changes
        dataset.AcceptChanges()

    catch e as Exception
        Console.WriteLine ("Exception: {0}", e.ToString())
    end try
end sub
</Tab>
<Tab Name="C++">
// Load a DataSet with relational data
private:
  void LoadDataSet(DataSet* myDataSet)
    {
        try
        {
            Console::WriteLine(S"Loading the DataSet ...");

            // Set DataSet name
            myDataSet->DataSetName = S"PersonPet";

            // Create tables for people and pets
            DataTable* people = new DataTable(S"Person");
            DataTable* pets = new DataTable(S"Pet");

            // Set up the columns in the Tables
            DataColumn* personname = new DataColumn(S"Name", __typeof(String));
            DataColumn* personAge = new DataColumn(S"Age", __typeof(Int32));

            DataColumn* petname = new DataColumn(S"Name", __typeof(String));
            DataColumn* pettype = new DataColumn(S"Type",__typeof(String));

            // Add columns to person table
            DataColumn* id = people->Columns->Add(S"ID", __typeof(Int32));
            id->AutoIncrement = true;
            DataColumn* primarykey[] = new DataColumn*[1];
            primarykey[0] = id;
            people->PrimaryKey = primarykey; //new DataColumn*[];// {id};
            people->Columns->Add (personname);
            people->Columns->Add (personAge);

            // Add columns to pet table
            id = pets->Columns->Add(S"ID", __typeof(Int32));
            id->AutoIncrement = true;
            primarykey[0] = id;
            pets->PrimaryKey = primarykey;//new DataColumn[] {id};
            id->AutoIncrement = true;
            DataColumn* ownerid = pets->Columns->Add(S"OwnerID", __typeof(Int32));
            DataColumn* foreignkey[] = new DataColumn*[1];
            foreignkey[0] = ownerid;
            pets->Columns->Add (petname);
            pets->Columns->Add (pettype);

            // Add tables to the DataSet
            myDataSet->Tables->Add (people);
            myDataSet->Tables->Add (pets);

            // Add people
            DataRow* mark = people->NewRow();
            mark->set_Item(personname, S"Mark");
            mark->set_Item(personAge, __box(18));
            people->Rows->Add(mark);

            DataRow* william = people->NewRow();
            william->set_Item(personname, S"William");
            william->set_Item(personAge, __box(12));
            people->Rows->Add(william);

            DataRow* james = people->NewRow();
            james->set_Item(personname, S"James");
            james->set_Item(personAge, __box(7));
            people->Rows->Add(james);

            DataRow* levi = people->NewRow();
            levi->set_Item(personname, S"Levi");
            levi->set_Item(personAge, __box(4));
            people->Rows->Add(levi);

            // Add relationships
            Console::WriteLine(S"Creating relationships between people and pets ...");
            DataRelation* personpetrel = new DataRelation (S"PersonPet",people->PrimaryKey, foreignkey);
            myDataSet->Relations->Add (personpetrel);

            // Add pets
            DataRow* row = pets->NewRow();
            row->set_Item(S"OwnerID", mark->get_Item(S"ID"));
            row->set_Item(petname, S"Frank");
            row->set_Item(pettype, S"cat");
            pets->Rows->Add(row);

            row = pets->NewRow();
            row->set_Item(S"OwnerID", william->get_Item(S"ID"));
            row->set_Item(petname, S"Rex");
            row->set_Item(pettype, S"dog");
            pets->Rows->Add(row);

            row = pets->NewRow();
            row->set_Item(S"OwnerID", james->get_Item(S"ID"));
            row->set_Item(petname, S"Cottontail");
            row->set_Item(pettype, S"rabbit");
            pets->Rows->Add(row);

            row = pets->NewRow();
            row->set_Item(S"OwnerID", levi->get_Item(S"ID"));
            row->set_Item(petname, S"Sid");
            row->set_Item(pettype, S"snake");
            pets->Rows->Add(row);

            row = pets->NewRow();
            row->set_Item(S"OwnerID", levi->get_Item(S"ID"));
            row->set_Item(petname, S"Tickles");
            row->set_Item(pettype, S"spider");
            pets->Rows->Add(row);

            row = pets->NewRow();
            row->set_Item(S"OwnerID", william->get_Item(S"ID"));
            row->set_Item(petname, S"Tweetie");
            row->set_Item(pettype, S"canary");
            pets->Rows->Add(row);

            // commit changes
            myDataSet->AcceptChanges();
        }

        catch (Exception* e)
        {
            Console::WriteLine (S"Exception: {0}", e->ToString());
        }
    }
</Tab>
</Acme:TabControl>

<p>
The AcceptChanges method of the DataSet commits all the changes that have been made to this DataSet since it was loaded or the last time AcceptChanges was called. All new and modified rows become unchanged, and deleted rows get removed. For more detail on the other DataSet relational methods, see <A target=content href="/quickstart/howto/doc/adoplus/adoplusoverview.aspx">How do I...Get an Overview of ADO.NET?</A>
<p>
To save the schema to a file, the sample calls the WriteXmlSchema method of the DataSet, passing a StreamWriter class that represents the destination file.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
StreamWriter writer = null;
String mySaveSchema = Environment.GetEnvironmentVariable("TEMP") +         
    "\\PersonPetCS.xsd";

try
{
    Console.WriteLine("Writing the schema to {0} ...", mySaveSchema);
    writer = new StreamWriter(mySaveSchema);
    datadoc.DataSet.WriteXmlSchema(writer);
}
catch (Exception e)
{
    Console.WriteLine("Exception: {0}", e.ToString());
}
finally
{
    if (writer != null)
        writer.Close();
}
</Tab>
<Tab Name="VB">
Dim writer as StreamWriter
Dim mySaveSchema as String = Environment.GetEnvironmentVariable("TEMP") & _
    "\\PersonPetVB.xsd";

try
    Console.WriteLine("Writing the schema to {0} ...", mySaveSchema)
    writer = new StreamWriter(mySaveSchema)
    datadoc.DataSet.WriteXmlSchema(writer)
catch e as Exception
    Console.WriteLine ("Exception: {0}", e.ToString())
finally
    If Not writer Is Nothing
        writer.Close()
    end if
end try
</Tab>
<Tab Name="C++">
StreamWriter* writer = 0;

try
{
    Console::WriteLine(S"Writing the schema to {0} ...", mySaveSchema);
    writer = new StreamWriter(mySaveSchema);
    datadoc->DataSet->WriteXmlSchema(writer);
}

catch (Exception* e)
{
    Console::WriteLine (S"Exception: {0}", e->ToString());
}

__finally
{
    if (writer != 0)
        writer->Close();
}
</Tab>
</Acme:TabControl>

<p>
The following output shows the tables built in the DataSet by the DisplayTables method. For more information about the DisplayTables method, see <a href="http://localhost/quickstart/howto/doc/Xml/DataSetMapXMLData.aspx">How do I...Infer DataSet Mappings from XML?</a>. The sample writes the inferred schema to the <a target="_blank" href="/quickstart/util/srcctrlwin.aspx?path=/quickstart/howto/samples/Xml/SaveDataSetMapXSDSchema/cs/&file=PersonPet.xsd">PersonPet.xsd</a> file.

<div class="code"><pre>
Loading the DataSet ...
Creating relationships between people and pets ...

DataSet:
PersonPet contains ...
No of Tables: 2  Table content ...

TableName = Person
---------
Columns ...

ID                    Name                  Age

Number of rows = 4
Rows ...
0                     Mark                  18
1                     William               12
2                     James                 19
3                     Levi                  4

TableName = Pet
---------
Columns ...

ID                    OwnerID               Name                  Type

Number of rows = 6
Rows ...
0                     0                     Frank                 cat
1                     1                     Rex                   dog
2                     2                     Cottontail            rabbit
3                     3                     Sid                   snake
4                     3                     Tickles               spider
5                     1                     Tweetie               canary

PersonPet

Name = Mark owns
	Pet = Frank the cat

Name = William owns
	Pet = Rex the dog
	Pet = Tweetie the canary

Name = James owns
	Pet = Cottontail the rabbit

Name = Levi owns
	Pet = Sid the snake
	Pet = Tickles the spider

Writing the schema to ...\LOCALS~1\Temp\PersonPet.xsd ...
</pre></div>

<H4>Summary</H4>
<OL>
<LI>The WriteXmlSchema method saves the mappings for the internal structure of the relation data in the DataSet as an XSD Schema.
<LI>The XmlDataDocument has a DataSet property that enables you to view and manage structured data relationally within an XML document.
</OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
