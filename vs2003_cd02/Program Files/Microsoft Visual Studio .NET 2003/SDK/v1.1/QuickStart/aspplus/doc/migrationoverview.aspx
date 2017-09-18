<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Migration Overview</span>
<p>
Installing ASP.NET will not break your existing ASP applications. It uses a separate file name extension
(.aspx instead of .asp), separate configuration settings, and an entirely separate common language runtime
(Asp.dll has not been modified).  ASP pages and applications can continue to use the
existing ASP engine, with no interference from ASP.NET.  That said, the benefits of
migrating your existing applications to ASP.NET are enormous.  ASP.NET easily provides many times
the features of traditional ASP, and moving your ASP applications to the new platform provides
a huge opportunity for improvement.  Among the new features you can take advantage of are:
</p>
<p>
<ul>
  <li>Improved performance and scalability
  <li>Web farm support and XCopy deployment
  <li>Output caching and custom security
  <li>Web Forms page controls
  <li>XML Web services infrastructure
</ul>
<p>
ASP.NET is designed to help preserve your investment in traditional ASP and COM technologies.  It
balances support for existing ASP syntax and semantics with the need for a
forward-looking platform that can last well into the next age of Internet application development.
While ASP.NET preserves the majority of ASP's feature set, 100% compatibility between the two 
was not possible if the platform was to move forward, so there are a few
changes to the old way of doing things.
<p>
The good news is that your ASP skills will translate easily to ASP.NET. There are only a few
differences, which are usually easy to fix.  However, migrating ASP
applications to ASP.NET does require some work.  Relatively simple pages might migrate without any changes, but more complex applications
probably will require some modifications. The following sections describe the changes and the ways in which they might affect your existing application code.  They also demonstrate some of the ways in which you can reuse ASP and COM code in ASP.NET.
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
