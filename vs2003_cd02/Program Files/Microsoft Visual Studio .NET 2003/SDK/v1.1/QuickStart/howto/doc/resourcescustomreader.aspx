<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/resourcesheader.inc" -->

<h4>How Do I...Make a ResourceReader?</h4>

There are two steps to creating a custom resource reader.  The first step is
to create a class that implements <b>IResourceReader</b>, which requires a
<b>Close</b> method and an implementation for <b>GetEnumerator</b>.  The following
code example demonstrates creating a basic class that implements <b>IResourceReader</b>.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
class CustomReader : IResourceReader {

    public void Close() {
        // Close any items allocated for the resources
    }

    IEnumerator IEnumerable.GetEnumerator() {
        return GetEnumerator();
    }

    public IDictionaryEnumerator GetEnumerator() {
        // Return an enumerator for the resource collection
    }

}
</Tab>
<Tab Name="VB">
Class CustomReader : Implements IResourceReader

    Public Sub Close()
        // Close any items allocated for the resources
    End Sub

    Public Function IEnumerable_GetEnumerator() As IEnumerator Implements IEnumerable.GetEnumerator
        return GetEnumerator();
    End Function

    Public Function GetEnumerator() As IDictionaryEnumerator Implements IResourceReader.GetEnumerator
        // Return an enumerator for the resource collection
    End Function

End Class
</Tab>
<Tab Name="C++">

public __gc class CustomReader : public IResourceReader
{
public:

     	void IResourceReader::Close()
    	{
	    // Close any open files, DB connections, etc here.
    	}

	IEnumerator* IEnumerable::GetEnumerator() {
		return __try_cast<IEnumerator*>( __try_cast<IResourceReader*>( this )->GetEnumerator() );
	}

	IDictionaryEnumerator* IResourceReader::GetEnumerator()
    	{
		// Return an enumerator for the resource collection
    	}

};
</Tab>
</Acme:TabControl>

<p>
The next step is to generate a custom
resource manager that uses the custom reader.  To do this, create a derived class of <b>ResourceManager</b>,
 and override <b>InternalGetResourceSet</b> to allow for the creation of the
resource reader defined earlier.  The following code example demonstrates a simple <b>ResourceManager</b>.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
public class CustomManager : ResourceManager {
    override protected ResourceSet InternalGetResourceSet( CultureInfo culture,
                                                           bool createIfNotExists,
                                                           bool tryParents ) {
        return new ResourceSet( new CustomReader() );
    }
}
</Tab>
<Tab Name="VB">
Public Class CustomManager : Inherits ResourceManager
    Protected Overrides Function InternalGetResourceSet( culture As CultureInfo, _
                                                         createIfNotExists As Boolean, _
                                                         tryParents As Boolean ) As ResourceSet
        Return new ResourceSet( new CustomReader() )
    End Function
End Class</Tab>
<Tab Name="C++">

public __gc class CustomManager : public ResourceManager
{
protected:

	ResourceSet* InternalGetResourceSet( CultureInfo* culture,
					__value bool createIfNotExists,
					__value bool tryParents )
    {
		return new ResourceSet( new CustomReader );
    }
};
</Tab>
</Acme:TabControl>

<p>
<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/resources/custom/CS"
        ViewSource="/quickstart/howto/samples/resources/custom/CustomReader.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# List.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/resources/custom/VB"
        ViewSource="/quickstart/howto/samples/resources/custom/CustomReader.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB List.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/resources/custom/CP"
        ViewSource="/quickstart/howto/samples/resources/custom/CustomReader.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ List.exe"
        MapRunSamplePath=true
        runat="server" />
  </CPTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
