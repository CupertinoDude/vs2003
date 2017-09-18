<html>
    <head>
        <link rel="stylesheet" href="intro.css">
    </head>
    <body style="BACKGROUND-COLOR:#f6e4c6">
        <p>
            <table>
                <tr>
                    <td>
                        <b>The following example walks you through the process of creating a 
                            resources-aware application, for an ASP.NET application</b>. The purpose of 
                        this demonstration is to make you more familiar with the steps required to make 
                        resources, and use them. It is not intended to show you how to write the code 
                        that actually utilizes these resources: that is discussed under the other 
                        headings in this topic. The sample assumes that the code to use the resources 
                        is provided, as is the actual file of strings you want to use for the 
                        application you are creating.
                        <hr>
                    </td>
                </tr>
                <tr>
                    <td>
                        The following instructions are for creating your own ASP.NET, resources 
                        application. They are intended to walk you through the process of creating an 
                        application with a basic (primary) set of resources, and two satellite 
                        assemblies. Once this process has been completed, you should be able to run the 
                        application and see the different results based on the culture you select. It 
                        is essential to remember that you need to create your base directory inside 
                        your localhost somewhere, so that the asp code can run as intended. In these 
                        instructions, entries enclosed in quotes indicate text you should type directly 
                        into the command prompt. Do not include the quotes themselves. A brief list of 
                        terms you may be unfamiliar with is included at the bottom of this page.
                    </td>
                </tr>
            </table>
            <pre>
<b>Steps</b>                                 <b>Instructions</b>
-----    -----------------------------------------------------------------------------------------
1.	Open a console window (in Windows, go to Start/Programs/Accessories/Command Prompt)

2.	Create a new directory inside your localhost (either with the "md myApp" command, 
	or via explorer) named myApp and then move your console into that directory ("cd myApp"). If 
	you are uncertain as to what your localhost is, run inetmgr from the run command 
	(goto Start/Run... and type in inetmgr), and expand down to your default website. Right-click
	on the quickstart entry (this entry should exist: it is the location of these examples)  and select
	properties. Note the local path: you need to create your directory somewhere below this path.
	To invoke your application once built, type 'localhost/quickstart/myApp/CreateAspxRes.aspx' 
	inside Internet Explorer.	

3.	Create a sub-directory in your myApp folder called resources ("md resources"). Change directory
	to that directory ("cd resources").

4.	Create a new file inside the resources directory called strings.txt, and open that file for
	editing ("notepad strings.txt"). When asked, create the file (click Yes).

5.	From the <A HREF="/quickstart/util/srcview.aspx?path=/quickstart/howto/samples/resources/createresources/CreateAspxRes.src">code source links</A> page, click the link to the file called "strings.txt". 
	Copy the entries and paste them into the file you just made. Save and close the file. 
	Once done, come back to complete the following steps.

6.	Use resgen to create a resources file from the text file:
	"resgen strings.txt"             makes a file called strings.resources

7.	Create a new file inside the resources directory called strings.en-NZ.txt, and open that file 
	for editing ("notepad strings.en-NZ.txt"). When asked, create the file (click Yes).

8.	From the <A HREF="/quickstart/util/srcview.aspx?path=/quickstart/howto/samples/resources/createresources/CreateAspxRes.src">code source links</A> page, click the link to the file called "strings.en-NZ.txt". 
	copy the entries and paste them into the file you just made. Save and close the file. Once done, 
	come back to complete the following steps.

9.	Use resgen to create a resources file from the text file:
	"resgen strings.en-NZ.txt"             makes a file called strings.en-NZ.resources

	<b>NB:</b> You do not need to compile the resources into assemblies in this example.

10.	Change directory back to your main directory (cd..)

11.	Create a new file inside your myApp directory called createaspxres.aspx, and open that file 
	for editing ("notepad createaspxres.aspx"). When asked, create the file (click Yes).

12.	From the <A HREF="/quickstart/util/srcview.aspx?path=/quickstart/howto/samples/resources/createresources/CreateAspxRes.src">code source links</A> page, click the link to the file called "createAspxRes.aspx" (make sure it is the VB version). 
	copy the entries and paste them into the file you just made. Save and close the file. Once done, 
	come back to complete the following steps.

13.	Open an instance of internet explorer, and type in the following url to run your application:

	localhost/quickstart/myApp/createaspxres.aspx

	This will run the demonstration just created.

14.	Repeat steps 7 - 10 for any other cultures you wish to include, changing the culture
	identifier, and making the new strings file. The German (de) string files are ready for
	you to repeat this process on. Remember to add in a new string for ALL entries you wish to 
	see for your new culture, otherwise the system will default back to the main assembly. Note 
	that for this particular demonstration, if you want to add a brand new culture, you will 
	also need to modify the CreateResources.aspx file to recognize the new culture. Normally, 
	you would not request the user for a specific culture: they would set it via Control 
	Panel/Regional Options.
<p><hr>
<b>Term	Description</b>
-------	-------------------------------
<b>cd</b>	change directory, to a specified directory
<b>cd..</b>	change directory up, by one directory
<b>md</b>	make directory, as a sub-directory of your current location
<b>al</b>	assembly linker, a minimal form of the compiler
<b>resgen</b>	The utility which generates resource files from text files
<b>notepad</b>	The notepad program, which opens a file you specify for editing, or creates 
	a new file if requested.
-------	-------------------------------

</pre>
    </body>
</html>
