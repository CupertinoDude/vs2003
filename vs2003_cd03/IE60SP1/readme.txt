             ----------------------------------------------
                             README for
            Microsoft Internet Explorer 6 Service Pack 1 and 
                        Outlook(TM) Express
                            August 2002
             ----------------------------------------------

   (c) Copyright Microsoft Corporation 2001. All rights reserved.

This document provides complementary or late-breaking information 
to supplement Microsoft Windows Internet Explorer documentation. 
You may also view the Microsoft Web site at 
http://www.microsoft.com/windows/ie for the latest information.

If you are looking for information about a specific program or 
component, try searching for it in the Microsoft Knowledge Base 
at http://support.microsoft.com/.

------------------------
HOW TO USE THIS DOCUMENT
------------------------

To view the Internet Explorer Readme.txt on-screen in Notepad, 
maximize the Notepad window.

To print Readme.txt, open it in Notepad or another word 
processor, and then, on the File menu, click Print.

========
CONTENTS
========

SYSTEM REQUIREMENTS
  Disk space requirements for Internet Explorer 6 SP 1 installation

SETUP
  Installing Internet Explorer 6 SP 1
  Unattended install is not possible
  Running Internet Explorer 6 SP 1 on Microsoft Windows NT 4.0
  Do not reinstall Windows 2000 Service Packs
  Installing Windows NT 4.0 Service Packs over 
    Internet Explorer 6 SP 1 
  Uninstalling Windows NT 4.0 Service Pack 6a with 
    Internet Explorer 6 SP 1 installed
  Installing over Windows 2000 or Windows XP releases
  Uninstalling Internet Explorer 6 SP 1 before upgrading to 
    Windows 2000
  Downloading Internet Explorer 6 SP 1 using a non-Microsoft 
    download manager
  High encryption support for Internet Explorer 6 SP 1
  Installing or upgrading the Windows Desktop Update 
    (Windows NT 4.0 only)
  Previous version unavailable after uninstalling 
    Internet Explorer 6 SP 1
  Installing Internet Explorer 6 SP 1 with Norton Protected Recycle
    Bin enabled
  Installing on Windows 98 with Novell IPX/IP client
  Uninstalling Internet Explorer 6 SP 1 multilanguage menus and dialog
    boxes from Windows 2000 MUI system will delete MUI files from 
    the system
  Internet Explorer 6 SP 1 Multilanguage User Interface function is
    not available on Windows XP Home Edition

CUSTOMER NOTES
  Non-English characters in URLs and queries
  Operating system limitations for character rotation in 
    vertical text
  Security settings 
  Contacts missing in Address Book after uninstalling Windows
  Millennium Edition
  Assistive technology and accessibility
  Content Advisor settings lost after upgrading to Windows XP from 
    Windows 98, Windows 98 Second Edition, or Windows Millennium
    Edition
  Issues with cookies

DEVELOPERS' NOTES
  New language features in JScript and VBScript
  HTML buttons with unselectable attribute
  Msxml3.dll installs in override mode
  Standards compliance issues
  Window.open can no longer open in full-screen mode
  Window placement
  ActiveX must be enabled to install COM server
  Setting and retrieving cookies
  WebOC
  OBJECT HTML tag

KNOWN BEHAVIOR CHANGES
  Upgrading to Internet Explorer SP 1 will not alter home page
  Frames and IFRAMES disabled in the restricted zone
  Download file dialog box has changed
  Gopher protocol

MICROSOFT OUTLOOK EXPRESS
  OUTLOOK EXPRESS NEW FEATURES IN THIS RELEASE
    Virus protection feature
    Plain text e-mail option
    Newsgroup delete key
  OUTLOOK EXPRESS KNOWN ISSUES IN THIS RELEASE
  OUTLOOK EXPRESS TROUBLESHOOTING
  OUTLOOK EXPRESS TIPS AND TRICKS


SYSTEM REQUIREMENTS
===================

Minimum system requirements to run Internet Explorer 6 SP 1:
- 486 /66 MHz processor (Pentium processor recommended)

- Microsoft Windows 98 and Windows 98 Second Edition:
      16 MB of RAM minimum
      Windows 98 full install size:                   11.5 MB
      Windows 98 Second Edition full install size:    12.4 MB

- Microsoft Windows NT 4.0 Service Pack 6a and later:
      32 MB of RAM minimum
      Full install size:                        12.7 MB

- Microsoft Windows 2000:
      32 MB of RAM minimum
      Full install size:                        12.0 MB

- Microsoft Windows Millennium Edition: 
      32 MB of RAM minimum
      Full install size:                         8.7 MB

- Microsoft Windows XP:
      32 MB of RAM minimum
      Full install size:                        12.0 MB

- CD-ROM drive (if installation is done from a CD-ROM)
 
- Some components may require additional system resources
   not outlined above.


Disk space requirements for Internet Explorer 6 SP 1 installation
---------------------------------------------------------------
Internet Explorer 6 SP 1 Setup installs the majority 
of its files on the drive where the Windows operating system is 
installed, regardless of the installation location you choose. 
To create space on your hard disk in order to meet the disk 
space installation requirements, you must create space on the 
drive where the Windows operating system is installed.


SETUP
===== 

Installing Internet Explorer 6 SP 1
---------------------------------------------
Regardless of whether you choose to install over a network or 
download the installation files to your hard disk, some or all of 
the Setup files are copied to your hard disk. This allows you to 
reinstall more quickly if necessary. If you want to reclaim the 
disk space, you can remove the Setup directory.

>>> To remove the Setup directory:

1. In Control Panel, double-click Add/Remove Programs, and then 
   click Internet Explorer 6 SP 1.

2. Click Add/Remove.

3. Make sure the Restore the Previous Windows Configuration
   check box is selected, and then click Advanced.

4. Click Remove Folder Containing Windows Update Setup Files, 
   and then click OK.

5. When prompted whether you want to continue, click Yes.

It is not possible to install Internet Explorer 6 SP 1 to or run it
from a network drive. However, you can download it to a network 
drive. To do this, map a network drive to a drive letter on your 
computer.

NOTE: The Download Only feature of Internet Explorer 6 SP 1 is 
unavailable from a UNC path.


Unattended install is not possible
-----------------------------------
When installing Internet Explorer 6 SP 1 on Windows 98, Windows 98 
Second Edition, or Windows NT 4.0, you may receive the following
security warning:

Do you want to install and run "Flash 5.0"

As a result, unattended installation packages created with the
Internet Explorer Administration Kit (IEAK) do not install without 
user interaction. Corporate administrators who need to distribute 
an unattended installation package for Internet Explorer 6 SP 1 
may work around this issue by following these steps before using 
the IEAK to create their unattended installation package:

1. On the computer that will run the IEAK to build your package,
   type "Chktrust Swflash.cab" in the folder that contains the 
   Internet Explorer 6 .cab files for use with IEAK.

NOTE: Chktrust.exe must be in the path when typing the above 
      command. Chktrust.exe is included with the 
      Microsoft .NET Framework Software Development Kit (SDK).
      The Microsoft .NET Framework SDK can be obtained from 
      the following Microsoft Web site: 
      http://msdn.microsoft.com/downloads/default.asp?url=/
      downloads/sample.asp?url=/msdn-files/027/000/976/
      msdncompositedoc.xml

2. Click to place a check mark in the "Always trust content from
   Macromedia, Inc." check box, and then click Yes.

3. Run the Internet Explorer Customization Wizard to create your
   unattended installation package.


Running Internet Explorer 6 SP 1 on Microsoft Windows NT 4.0
------------------------------------------------------------
NOTE: You must have administrative privileges to install and 
      uninstall this program on Windows NT, including the first 
      time you start your computer after installing or uninstalling.
      You must restart your computer after installing Internet 
      Explorer 6 SP 1. This is also true for some add-on 
      components.

If you plan to run Internet Explorer 6 SP 1 on Windows NT 4.0, 
user permissions must be set to Full Control for the Temporary 
Internet Files folder (cache). The user must have write permission 
so that files can be stored in the Temporary Internet Files directory.


Do not reinstall Windows 2000 Service Packs
---------------------------------------------------------------
Reinstalling a Windows 2000 Service Pack will result in the loss of 
the ability to uninstall Internet Explorer. The Windows 2000 Service 
Pack team no longer recommends reinstalling Service Packs as was 
recommended on the Windows NT 4.0 operating system. This is because 
Windows File Protection prevents corruption of system files. 


Installing Windows NT 4.0 Service Packs over Internet Explorer 6 SP 1 
----------------------------------------------------------------
If you reinstall Windows NT 4.0 Service Pack 6a after Internet 
Explorer 6 SP 1 is installed on your computer, some components 
will need to be re-registered. 

>>> To re-register components:

1. In Control Panel, double-click Add/Remove Programs.

2. On the Install/Uninstall tab, click 
   Microsoft Internet Explorer 6 SP 1.

3. Click Add/Remove.

4. Click Repair Internet Explorer, and then click OK.

5. After the repair operation is complete, restart your computer.


Uninstalling Windows NT 4.0 Service Pack 6a with 
Internet Explorer 6 SP 1 installed 
--------------------------------------------------------------------
It is recommended that users uninstall Internet Explorer 6 SP 1 before
uninstalling Windows NT 4.0 Service Pack 6a.


Installing over Windows 2000 or Windows XP releases
-------------------------------------
Typical and full installations are not currently available for 
Windows 2000 or Windows XP. Internet Explorer 6 SP 1 will install a
minimal set of files onto your system. This includes the 
Internet Explorer 6 SP 1 Web browser and scripting support.

Uninstalling Internet Explorer 6 SP 1 before upgrading to Windows 2000
----------------------------------------------------------------
Windows 2000 contains an earlier version of Internet Explorer 
components than Internet Explorer 6 SP 1. Before upgrading from
Windows 98, Windows 98 Second Edition, or Windows NT to Windows 2000, 
it is recommended that users uninstall Internet Explorer 6 SP 1. During 
the upgrade, you may receive the following message: "This program may 
not run correctly because of new features in Internet Explorer 4.0. 
You may need to obtain an updated version of this program." Although 
this message is misleading, please click the Details button for a more
accurate description of the problem.


Downloading Internet Explorer 6 SP 1 using a non-Microsoft 
download manager
------------------------------------------------------------------
During the Internet Explorer 6 SP 1 installation, Setup must download
components from the Internet. Users who are utilizing non-Microsoft 
download managers (for example, Netzip, GetRight, or RealAudio's Download
Demon) will intercept download requests. This will cause Setup to abort. 
To prevent this from occurring, disable non-Microsoft download managers 
before running Setup.


High encryption support for Internet Explorer 6 SP 1
--------------------------------------------------------------
High encryption components are included for Windows 98, 
Windows 98 Second Edition, and Windows NT 4.0 Service Pack 6a. 
Windows Millennium Edition and Windows XP contain high encryption 
by default. To obtain high encryption support for Windows 2000, 
please visit Windows Update at 
http://www.windowsupdate.com or http://www.microsoft.com/
windows2000/downloads/recommended/encryption/default.asp.


Installing or upgrading the Windows Desktop Update 
(Windows NT 4.0 only)
-------------------------------------------------------------
If you have already installed Internet Explorer 6 SP 1 and would 
like to install the Windows Desktop Update, you must install 
Internet Explorer 4.01 SP2 before installing the upgrade.

>>> To install Windows Desktop Update:

1. Uninstall Internet Explorer 6 SP 1 by using the procedure described
   later in this document.

2. If Internet Explorer 4.01 SP2 is not already installed on your 
   computer, install it.

3. Install the Windows Desktop Update by clicking Add/Remove Programs 
   in Control Panel.

4. Reinstall Internet Explorer 6 SP 1.


Previous version unavailable after uninstalling 
Internet Explorer 6 SP 1
-------------------------------------------------------------------
After uninstalling Internet Explorer 6 SP 1, it is not possible to
remove the browser that was installed prior to 
Internet Explorer 6 SP 1.


Installing Internet Explorer 6 SP 1 with Norton Protected Recycle Bin 
enabled
----------------------------------------------------------------
It is recommended that you disable the Norton Protected Recycle Bin 
before you install Internet Explorer 6 SP 1 and that you empty the
Norton Protected Recycle Bin before you run Setup. Before you empty 
the Norton Protected Recycle Bin, be sure you review its contents in 
case it contains any items you want to recover. You can re-enable 
this feature after Setup is complete. This is recommended because 
Norton Protected Recycle Bin will intercept the removal of temporary 
files that Setup is trying to delete, and you could run out of free 
space on your hard disk if your remaining free space is limited. 
This would cause Internet Explorer Setup to appear locked. For 
instructions on disabling and re-enabling the Norton Protected 
Recycle Bin, see the Norton Utilities documentation.


Installing on Windows 98 with Novell IPX/IP client
--------------------------------------------------
If you are using the Novell IPX/IP client with Windows 98, you may 
experience problems if you install Internet Explorer 6 SP 1 and
Internet Tools from the Internet. If Setup becomes unresponsive, 
restart your computer. Setup will continue and finish normally. To 
work around this problem, try one of the following options:

In Setup, select the Download Only option, and then run and install 
Internet Explorer 6 SP 1 normally.

-Or-

Install Internet Explorer 6 SP 1 from a CD-ROM.


Uninstalling Internet Explorer 6 SP 1 multilanguage menus and 
dialog boxes from Windows 2000 MUI system will delete MUI files 
from the system
------------------------------------------------------------------
After upgrading to Internet Explorer 6 SP 1 on a Windows 2000 
system with MUI enabled, administrators need to install 
Internet Explorer 6 SP 1 Multilanguage Menus and Dialog Box Package 
(IEPLUGUI for Windows 2000) to re-enable MUI in Internet Explorer 
area. However, this installation will overwrite previous 
Internet Explorer MUI files in the system and no backup information 
is saved. As a result, if the administrator uninstalls either 
Internet Explorer 6 SP 1 or Internet Explorer 6 SP 1 PLUGUI 
package for Windows 2000, the Internet Explorer menus and dialog 
boxes will revert to English. The workaround is to re-install the 
previous MUI files to the Windows 2000 system.


Internet Explorer 6 SP 1 Multilanguage User Interface function is 
not available on Windows XP Home Edition
----------------------------------------------------------------
Windows XP Home Edition does not have the function to enable 
Multilanguage User Interface (MUI) as Windows XP Professional or 
later does. Operating systems (Windows 98, Windows 98 Second
Edition and Windows Millennium Edition) that have this feature (also
known as PLUGUI) installed for Internet Explorer prior to migration 
to Windows XP Home Edition will no longer have this feature after 
the migration. However, other Office 2000 or Office XP applications 
will still have MUI function if installed either before or after 
migration to Windows XP Home Edition or later.


==============
CUSTOMER NOTES
==============

Non-English characters in URLs and queries
------------------------------------------
Internet Explorer 6 SP 1 uses a new standard to transmit non-English 
addresses (URLs) to the server. URLs are now encoded in a character-
encoding standard named UTF-8. If the server is running Windows 2000, 
the URLs will work as expected. Many servers cannot process URLs 
encoded in UTF-8.

>>> To use non-English characters in URLs with servers unable to 
    process URLs encoded in UTF-8: 

1. On the Tools menu in the browser, click Internet Options.

2. Click the Advanced tab.

3. Under Browsing, deselect the Always Send URLs As UTF-8 check box.
 
The query part of URLs is transmitted in a form fully compatible 
with Internet Explorer 4 and later.


Operating system limitations for character rotation in vertical text 
--------------------------------------------------------------------
When working with vertical text layout, full-width (East Asian 
language) characters will be displayed with upright orientation 
only on East Asian versions of Windows 95, Windows 98, Windows 
Millennium Edition, and Windows NT 4.0 operating systems. All 
language versions of Windows 2000 provide this support. 


Security settings
-----------------
The settings for the security levels of the Web content zones 
have changed for Internet Explorer 6 SP 1 and might no longer be 
consistent with those in earlier versions of Internet Explorer. If 
you upgrade from a previous version of Internet Explorer, Setup will 
save your previous security settings and transfer them to 
Internet Explorer 6 SP 1 as a Custom Security Level.


Contacts missing in Address Book after uninstalling 
Windows Millennium Edition
--------------------------------------------------------------
When uninstalling Windows Millennium Edition, contacts that you 
added while using Windows Millennium Edition might be missing from 
the Windows Address Book. When you upgrade to Windows Millennium
Edition, the Windows Address Book data file is backed up. During 
the uninstallation process, the backup copy of the data file is 
restored, overwriting any data that had been added in 
Windows Millennium Edition. To preserve any contacts made in 
Windows Millennium Edition, back up the .wab file(s) before 
uninstalling. After Windows Millennium Edition has been removed, 
the .wab file(s) can be recopied into place and used if 
Internet Explorer 5 or later is installed.


Assistive technology and accessibility
--------------------------------------
Microsoft works to test with the latest versions of some 
accessibility aids. If you encounter problems with the interaction 
of Internet Explorer 6 SP 1 and the assistive technology that you use,
please contact the manufacturer of your assistive technology to 
ensure that they can work with Microsoft to address the issue where 
appropriate.


Content Advisor settings lost after upgrading to Windows XP from 
Windows 98, Windows 98 Second Edition, or Windows Millennium Edition
--------------------------------------------------------------
When upgrading to Windows XP from Windows 98, Windows 98 Second
Edition, or Windows Millennium Edition, the settings in Content 
Advisor might be missing. When this occurs, you will receive a
message that reads, "Please check your Content Advisor settings 
for missing information. Click the Tools menu and then click Internet 
Options. On the Content tab, check the Content Advisor settings."  
If you receive this message and would like to continue to use Content 
Advisor, you need to enable Content Advisor by clicking the Tools menu
and then clicking Internet Options. On the Content tab, click Enable.


Issues with cookies
-------------------
The Privacy functionality in Internet Explorer 6 SP 1 provides you
with the ability to automatically filter cookies based on whether 
sites collect your personal information.  When actions are taken by 
Internet Explorer 6 SP 1 to restrict cookies via the automatic 
filtering, you are notified via the privacy icon on the status bar. 
If you experience problems in using a particular web site, or receive 
errors related to cookies, it may be because the site makes use of 
third-party cookies, without disclosing P3P privacy information 
(so-called compact P3P policies).  In this case, you may want to first 
review the Web site's privacy practices and then consider adding the 
site as 'Allow' in your list of Web sites.  Lastly, you can adjust 
your Internet Explorer Privacy settings to "Accept all Cookies" to 
ensure compatibility. Below are steps to accomplish that:

1. In Internet Explorer, click on Tools and select Internet Options.

2. Click the Privacy tab.

3. Adjust the Privacy Preferences slider down to "Accept all Cookies." 
   
You should consider the privacy practices of the sites you visit
before using this mode. 


=================
DEVELOPERS' NOTES
=================

New language features in JScript and VBScript
---------------------------------------------
Internet Explorer 6 SP 1 ships with new versions of Microsoft JScript 
and Visual Basic Scripting Edition (VBScript). You can read 
about the most important new features in JScript and VBScript at 
http://msdn.microsoft.com/workshop/languages/clinic/
scripting11132000.asp. The updated Windows script engines will also 
be posted for individual download from http://msdn.microsoft.com
/scripting/ so they can be installed on machines that do not have 
Internet Explorer 6 SP 1, for example, on an ASP Web server.


HTML buttons with unselectable attribute
----------------------------------------
When the "unselectable" attribute in Internet Explorer 6 SP 1 is
applied to buttons, the default onclick action (depressing the 
button) does not take place. A simple workaround is to add a behavior 
to buttons that causes this action. Add the following to the top of 
the file containing the unselectable buttons (or to a CSS style sheet 
that is referenced from the file):

<STYLE> BUTTON { behavior:url("***.htc") } </STYLE>
   (where *** is the name of the .htc file that contains the behavior)
The .htc file should contain the following:
<component>
  <attach event="onmousedown" onevent="element.style.border=
     'thin inset'">
  <attach event="onmouseup" onevent="element.style.border=
     'thin outset'">
</component>


Msxml3.dll installs in override mode
------------------------------------
Internet Explorer 6 SP 1 is shipping with msxml3.dll installed in
override mode. This means that all calls into any msxml DLL will be 
routed to msxml3.dll. Please pay special attention to any XML, XSL, 
or data island issues that may occur.


Standards compliance issues
---------------------------
Internet Explorer 6 SP 1 offers considerable improvements in standards
compliance. In some cases, this may cause HTML content to look 
differently than in previous versions of Internet Explorer. Many of 
the changes causing the largest compatibility problems are implemented
only under a specific <!DOCTYPE> declaration in the HTML. If you see 
rendering problems, try removing any <!DOCTYPE> declaration in your 
code, and check the Developer Center for more information on these 
changes. (http://msdn.microsoft.com)

Due to security enhancements:

Window.open can no longer open in full-screen mode
---------------------------------------------------
In Internet and Restricted Sites zones, window.open can no longer open
in full-screen "kiosk" mode.  

Window placement
-------------------------------------------------
Windows can no longer be moved off the screen using the move, resize,
and open methods of the window object.

ActiveX must be enabled to install COM server
-----------------------------------------------
ActiveX must now be enabled in order to install a COM server.  As a
result, Internet Explorer 6 SP 1 now checks to see if ActiveX is 
enabled before installing a COM server. 

Setting and retrieving cookies 
--------------------------------
In order for cookies (both session and persistent) to be set and/or
retrieved, server names can only contain "A-Z", "a-z", "0-9", "-", 
and a ".".  Anything else like a "_" will result in cookies not being 
set or retrieved. 

WebOC
-------------------------------------------------
WebOC can no longer be used on the Internet.  It can only be used on
the intranet.

OBJECT HTML tag
-------------------------------------------------
The codeBase attribute of an OBJECT tag can no longer specify a 
local path.


======================
KNOWN BEHAVIOR CHANGES
======================

 
Upgrading to Internet Explorer 6 SP 1 will not alter home page
--------------------------------------------------------------
After an upgrade to Internet Explorer 6 SP 1, there will no longer be
the MSN RunOnce.ASP page on first boot of the service pack.  The home 
page set before the upgrade will remain as is. 


Frames and IFRAMES disabled in the restricted zone
---------------------------------------------------
Frames (including IFRAMES) have been completely disabled in the
restricted zone. Any sites added to the restricted zone will not render 
frames. Because mail runs in the restricted zone no frames will be 
rendered in any mail message.  Please be aware that your e-mail 
client must be running in the restricted zone (using the default
settings) to take advantage of this feature. 


Download file dialog box has changed
------------------------------------
The dialog box that prompts you to Open, Save, or Cancel the download
of a file has changed. When files that can contain viruses (or are 
executables themselves) are being downloaded the Open/Save dialog 
box will contain a warning icon as well as an extra line of text 
telling users "This type of file could harm your computer if it 
contains malicious code." 


Gopher protocol
----------------
The gopher protocol has been disabled by default. If you must use
gopher you can re-enable the functionality by setting the following 
registry key:  [HKEY_CURRENT_USER\Software\Microsoft\Windows\
CurrentVersion\Internet Settings]"EnableGopher"=dword:00000001


=========================
MICROSOFT OUTLOOK EXPRESS
=========================

Outlook Express is an Internet-standards-based e-mail and news 
reader.
 
To read e-mail with Outlook Express, you must be using a mail 
system that uses SMTP and POP3 or IMAP protocols. If you do not 
know whether your e-mail system supports Outlook Express, contact 
your administrator or your Internet service provider (ISP) and ask 
if they support POP3 or IMAP mail clients.

You can use Outlook Express to read newsgroups, or discussion groups,
such as the Usenet, by using NNTP-based news servers. Contact your
ISP or network administrator for the name of the news server you 
should use. You can also use Outlook Express to receive support for
a variety of Microsoft products on the news server, 
msnews.microsoft.com.

Outlook Express also includes the Address Book 6, which provides rich 
contact management capabilities, including the ability to create
groups of contacts and folders to help you organize your e-mail and 
personal addresses. The Address Book also provides access to Internet
directories that use LDAP (Lightweight Directory Access Protocol). 
Internet directories are an easy way to find e-mail or street 
addresses. A number of popular Internet directories are pre-
configured for easy access.


============================================
OUTLOOK EXPRESS NEW FEATURES IN THIS RELEASE
============================================

Virus protection feature
-------------------------
Virus protection is the answer to renewed interest in the threat of 
e-mail viruses. It blocks programmatic sends and lets users specify 
if they want to open  or save attachments.  This option to block the 
preset list of file types may be accessed via the checkbox under 
Tools | Options | Security | "Do not allow attachments to be opened or
saved that could potentially be a virus." This option is enabled by
default for new installations and upgrades.  

Additional changes prevent automatic execution of script in messages
designated as plain text. FRAMES and IFRAMEs are also now blocked 
for the Restricted Sites Zone by default (where Outlook Express runs 
by default). This eliminates a primary source of virus scripts embedded 
in e-mail.  FRAMEs in e-mail will no longer display using the default 
settings in Outlook Express. To view the FRAMEs, the user may use 
the Plain Text option (see below) to move the FRAMES to an attachment
that may be viewed, enable FRAMES for the Restricted Sites Zone 
(not recommended), or move Outlook Express out of the 
Restricted Sites Zone (highly NOT recommended).


Plain text e-mail option
-------------------------
Outlook Express now has the ability to read all messages as plain
text. Users may set this option in Tools/Options/Read/"Read all messages 
in plain text." When this option is selected, all received mail is 
viewed in plain text format. This option is disabled by default. When 
enabled, mail received that is in HTML format will display only the 
plain text portions; HTML sections will be moved to an HTML attachment
and will be indicated by a paperclip icon in the Preview Pane or will 
be shown in the attachment well of the open message.  Also see the 
"Virus Protection" section above regarding display of FRAMES with the 
Plain Text option enabled as well as the option to block potentially 
unsafe attachments, including HTML files.


Newsgroup delete key
---------------------
The ability to delete newsgroup postings from the local storage is now
in Outlook Express 6 SP 1.  A user may delete individual postings or 
entire threads by selecting the posting or thread and then pressing 
the keyboard <delete> key; by clicking the "Delete" button on the 
toolbar (must be added via the Toolbar | Customize menu); or by
choosing Edit | Delete from the File menu while the posting(s) are 
highlighted. This will permanently delete the news post(s) from the 
local store after user confirmation.  Items do not go into the 
"Deleted Items" folder.  In order to restore a post that has been 
mistakenly deleted from the local store but is still available on the
server, the user may choose Tools | Options | Maintenance | 
Clean Up Now | Reset.  This will reset the newsgroups and allow users 
to re-download the post(s) from the server.


============================================
OUTLOOK EXPRESS KNOWN ISSUES IN THIS RELEASE
============================================

Except in Windows XP, Outlook Express 6 SP 1 can only be installed
and run   in conjunction with Internet Explorer 6 SP 1. If 
Internet Explorer 6 SP 1 is uninstalled on a platform other than 
Windows XP, Outlook Express 6 SP 1 will be uninstalled as well.

The Identity Manager provides an easy way to group user settings
and change users across applications, but it does not provide
security for messages, application settings, and digital
certificates. If you need stronger security, you should use
Windows logon profiles to manage user settings.

Outlook Express identities are not available on 
Windows XP 64-Bit Edition. Windows logon profiles are recommended 
to manage user settings.

When uninstalling Outlook Express 6 SP 1, the messages you have
received in Outlook Express will remain in the Outlook Express 
message files.
  
If you were previously running Outlook Express 5.0, 5.5, or 
Internet Mail and News, and upgraded to Outlook Express 6 SP 1, the 
messages you received will also be there after you uninstall 
Outlook Express.

If you install Outlook 2000 after installing Outlook Express, the
shortcut to the Microsoft Outlook Newsreader may not work. To fix
this, on the Start menu, click Programs, right-click the 
Microsoft Outlook Newsreader in the list of programs, and then 
click Properties. In the Target box, type (exactly as below):

"C:\Program Files\Outlook Express\msimn.exe" /outnews

You cannot use Outlook Express to access your e-mail account with 
any of the following services: MS Mail, cc:Mail, CompuServe, 
America Online (AOL), or a version of Microsoft Exchange Server 
earlier than version 5.0.

You will not be able to see embedded objects or images sent from
people using Microsoft Outlook, Microsoft Exchange, or Windows
Messaging. 

If you used Internet News for reading newsgroups, any messages in 
your Posted Items folder will be moved into the Sent Items 
folder when you upgrade to Outlook Express 6 SP 1.

The View filter, Show Replies to my Messages, only shows message
conversations for which you were the author of the original post. 
Replies to your replies will not be displayed.

If the option to encrypt all outgoing messages is selected, any rules 
with the action of Forward in them will not be executed. 

With the default security settings, FRAMES and IFRAMES do not display 
in the Restricted Sites Zone (where Outlook Express resides).  For 
messages containing only FRAMEs or FRAMES embedded in HTML messages,
the message display may appear blank or otherwise appear to be
missing information; this is not the case.  To view the contents of 
the FRAMEs, the user may select to view messages as plain text (see 
"OUTLOOK EXPRESS NEW FEATURES IN THIS RELEASE" section above), which 
will move the FRAMES to an attachment that can be opened and viewed. 


===============================
OUTLOOK EXPRESS TROUBLESHOOTING
===============================

If you are unable to send or receive e-mail, make sure of the
following:

1. The TCP/IP protocol is installed on your computer.
2. All cables are properly connected to your computer, modem,
   or LAN (local area network).
3. You have a PPP or SLIP account with your Internet service
   provider.
4. Your Internet service provider or LAN server supports POP3
   or IMAP and SMTP.
5. Your modem communication parameters (baud rate and type of 
   protocol) are set correctly.

If a message is received without proper character set encoding 
information, it can be read by selecting the proper encoding
on the View menu.

If you are unable to read or post news, make sure that you use
an account name and password for a news server only if it requires
them. If you use an account name and password and they are not
required, you will not be able to connect to the news server.

If you run into a problem, try the Troubleshooting section in Help:

1. On the Help menu, click Contents and Index.
2. On the Contents tab, click the Troubleshooting topic you want.
3. Click the If you have trouble using Outlook Express topic.

Frequently asked questions and popular Help topics on 
Outlook Express are available on the Microsoft Web site at: 
http://support.microsoft.com/support/ie/outlookexpress/win32/

To access the Microsoft peer-to-peer product support newsgroups,
follow these steps:

1. On the Tools menu, click Accounts.
2. On the News tab, click Add, and then click News.
3. Follow the directions on your screen.
4. When you are prompted for a server name, type
   msnews.microsoft.com.

If that name isn't found by your Internet service provider, you 
can type 131.107.3.27 instead.

You do not need to log on to this news server.


===============================
OUTLOOK EXPRESS TIPS AND TRICKS
===============================

To send a message to someone in the Address Book, double-click 
the name of the contact in the Contacts area.

To edit the source of an HTML message you are writing, on the
View menu, click Source Edit. Three tabs will be displayed at
the bottom of the Window. Click the Source tab to see and change
the HTML.

To change the New Mail Notification sound, in Control Panel, 
double-click the Sounds icon, and select New Mail Notification
from the events list. Click the Sound list to view your choices.

To look up a person's e-mail address when sending e-mail, on the
Tools menu or New Message toolbar, click Check Names. The name will 
be underlined when the associated address is found.

To send an e-mail message in plain text only (no HTML formatting),
on the Format menu, click Plain Text. To make plain text the default
setting for new messages, replies, and forwarded messages, on the
Tools menu, click Options. On the Send tab, under Mail Sending
Format, click Plain Text. (News messages are sent in plain text by 
default, but similarly, this setting can be changed under News
Sending Format.)

To customize the toolbar, right-click it, and then click the menu
commands to perform the desired actions.

You can resize the preview pane or the message list by dragging the
divider between the preview pane and the message list.

You can change how the preview pane splits, or turn it off entirely,
by clicking the View menu, clicking Layout, and then changing the
options in the dialog box.

To view the e-mail address of someone who has sent you a message,
double-click the message to open it, and then double-click the
author's name in the From field. You can also add this person to
your Address Book by right-clicking the name, and then clicking
Add To Address Book.

To view responses to a particular message in a newsgroup, click
the plus sign (+) next to the message. The responses are displayed
indented below it.

In e-mail, you can leave a copy of your messages on the server.
To set this option, on the Tools menu, click Accounts. Click the
mail account you want to modify, and then click Properties. On the
Advanced tab, select the Leave A Copy Of Messages On Server 
check box.

You can search for newsgroups that contain specific words in their 
names. To do this:

1. On the Tools menu, click Newsgroups. 
2. In the Display newsgroups which contain box, type the words
   separated by a space.

You can also search newsgroup descriptions. If you cannot see the
descriptions, on the Tools menu, click Accounts. Click the news
account you want to modify, and then click Properties. On the
Advanced tab, select the Use Newsgroup Descriptions check box. On 
the Tools menu, click Newsgroups. In the Newsgroups window, click
Reset List.

To reorder columns, you can drag and drop column headings. Columns
can be resized by dragging the right edge of the column header. 

To hang up, on the File menu, click Work Offline. When prompted
whether you want to hang up, click Yes.

To set Outlook Express to connect and check e-mail at a regular
interval, on the Tools menu, click Options, and then click the
General tab. Make sure the Send and receive messages every X minutes
option is selected, and then click either Connect only when not 
Working Offline or Connect even when Working Offline.

If any of your mail or news accounts requires you to use a specific
ISP connection, select the Always connect to this account using
option and select the appropriate account. This option is available
on the Connection tab in the Properties for each account. This
option is mainly used by people who use multiple connections, such 
as a LAN and a dial-up connection or two dial-up connections.

To check for new messages at start up, on the Tools menu, click
Options. On the General tab, click Send and receive messages every 
X minutes. For each account you want to check, on the General tab 
in Properties, click Include this account in Send and Receive All.
The At Start up, ask me if I would like to connect option only 
initiates a connection. It does not check for e-mail.
  
The Dial-up Connection option, At Start up, ask me if I would like
to connect, will always prompt you to dial a modem at start up, even
if a LAN connection exists. If you primarily use a LAN, deselect
this option.

To disable the Connect automatically option for any of your dial-up
accounts, click Cancel while connecting to the account. This will
bring up the Dial-up Connection box and allow you to deselect the
Connect automatically option.

If you are running Outlook Express on Windows NT and you need to
add support for a different language, in Control Panel, double-click
the Keyboard icon, and then click Add. Follow the instructions on 
your screen. This installs the appropriate NLS (National Language
Support) files. You do not have to use the associated keyboard
layout.
