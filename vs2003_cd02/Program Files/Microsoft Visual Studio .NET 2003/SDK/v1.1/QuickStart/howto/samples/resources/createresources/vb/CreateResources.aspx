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
                            resources-aware application</b> . The purpose of this demonstration is to 
                        make you more familiar with the steps required to create and use resources. It 
                        is not intended to show you how to write the code that actually utilizes these 
                        resources: that is discussed under the other headings in this topic. The sample 
                        assumes that the code to use the resources is provided, as is the actual file 
                        of strings you want to use for the application you are creating.
                        <hr>
                    </td>
                </tr>
                <tr>
                    <td>
                        The following instructions are for creating a resource-enabled console 
                        application. They are intended to walk you through the process of creating an 
                        application with a basic (primary) set of resources, and one satellite 
                        assembly. Once this process has been completed, you should be able to run the 
                        application and see the different results based on the culture you select. In 
                        these instructions, entries enclosed in quotes indicate text you should type 
                        directly into the command prompt. Do not include the quotes themselves. A brief 
                        list of terms you may be unfamiliar with is included at the bottom of this 
                        page.
                    </td>
                </tr>
            </table>
            <pre>
<b>Steps</b>                                 <b>Instructions</b>
-----    -----------------------------------------------------------------------------------------
1.	Open a console window (in Windows, go to Start/Programs/Accessories/Command Prompt)

2.	Create a new directory  in your root directory (either with the "md myApp" command,
	or via explorer) named myApp and then move your console into that directory ("cd myApp").

3.	Create a new file inside that directory called strings.txt, and open that file for
	editing ("notepad strings.txt"). When asked, create the file (click Yes).

4.	From the <A HREF="/quickstart/util/srcview.aspx?path=/quickstart/howto/samples/resources/createresources/createresources.src">code source links</A> page, click the link to the file called "strings.txt".
	Copy the entries and paste them into the file you just made. Save and close the file.
	Once done, come back to complete the following steps.

5.	Use resgen to compile a resources file from the text file:
	"resgen strings.txt"             makes a file called strings.resources

6.	Create a new file in the same directory called myApp.vb, and open that file for
	editing ("notepad myApp.vb"). When asked, create the file (click Yes).

7.	From the <A HREF="/quickstart/util/srcview.aspx?path=/quickstart/howto/samples/resources/createresources/createresources.src">code source links</A>  page, click the link to the file called "myApp.vb". copy
	the code, and paste it into the  file you just made. Save and close the file. Once done,
	come back to complete the following steps.

8.	Compile your main assembly, linking in your resources file, with the following
	command: "vbc /t:exe /res:strings.resources myApp.vb"

9.	Try out the application ("myApp"). You will notice at this point that it does
	not matter WHICH culture you select in the application: the questions are all the
	same. We need to continue by making an extra resources file.

10.	Create a sub-directory under the myapp directory called en-NZ("md en-NZ"). Change
	directory to that directory ("cd en-NZ").

11.	Create a new file inside that directory called strings.en-NZ.txt, and open that file
	for editing ("notepad strings.en-NZ.txt"). When asked, create the file (click Yes).

12.	From the <A HREF="/quickstart/util/srcview.aspx?path=/quickstart/howto/samples/resources/createresources/createresources.src">code source links</A> page, click the link to the file called "strings.en-NZ.txt".
	copy the entries and paste them into the file you just made. Save and close the file. Once done,
	come back to complete the following steps.

13.	Use resgen to compile a resources file from the text file:
	"resgen strings.en-NZ.txt"             makes a file called strings.en-NZ.resources

14.	Compile the satellite assembly in the current directory:
	"al /t:lib /culture:en-NZ /embed:strings.en-NZ.resources /out:myApp.resources.dll"

15.	Move back into the myapp directory ("cd.."). Run the application again ("myApp")
	and run it as a US, and a New Zealand application. Notice that the prompts change now,
	based on the culture selected.

	<b>NB:</b> We did not have to recompile our main assembly, when we added this new
	resources file to our project. This can be indespensable when putting out updates to this
	kind of information. You need only redistribute your resources (the satellite assemblies),
	you do NOT need to redistribute your entire application.

16.	Repeat steps 10 - 15 for any other cultures you wish to include, changing the culture
	identifier, and making the new strings file. Remember to add in a new string for ALL entries
	you wish to see for your new culture, otherwise the system will default back to the main
	assembly. Note that for this particular demonstration, if you want to add a brand new culture,
	you will also need to modify the .vb file and recompile your main assembly (see step 8) to
	recognize the new culture. Normally, you would not request the user for a specific culture:
	they would set it via Control Panel/Regional Options.
<p><hr>
<b>Term	Description</b>
-------	-------------------------------
<b>cd</b>	change directory, to a specified directory
<b>cd..</b>	change directory up, by one directory
<b>md</b>	make directory, as a sub-directory of your current location
<b>al</b>	assembly linker, a minimal form of the compiler
<b>resgen</b>	The utility which generates resource files from text files
<b>myApp</b>	The name of the executable file being made. Typing this runs the executable
<b>notepad</b>	The notepad program, which opens a file you specify for editing, or creates
	a new file if requested.
-------	-------------------------------

</pre>
    </body>
</html>
