
<!-- #include virtual="/quickstart/howto/include/header.inc" -->

<h4>How Do I...Instantiate an Object?</h4>

<div class="indent" style="width:660">
This sample creates a new instance of a simple HelloWorld component with a single property and method.
</div>

<h4>Example</h4>

<p>
<div class="indent">
<a target="_new" href="/quickstart/howto/samples/helloobj/helloobj.aspx">
<img style="border-color:black" border=1 src="/quickstart/images/genicon.gif"><br>
</a>
<div class="caption">HelloObj.aspx</div><br>
[<a target="_new" href="/quickstart/howto/samples/helloobj/helloobj.aspx">View Sample</a>] | 
[<a target="_new" href="/quickstart/util/srcview.aspx?path=/quickstart/howto/samples/helloobj/helloobj.src">View Source</a>]<p>
</div>

<h4>Source Code</h4>

<div class="code">
<xmp>
HelloObj obj = new HelloObj();
obj.Name = "Microsoft .NET Framework";
obj.SayHello();
</xmp>
</div>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
