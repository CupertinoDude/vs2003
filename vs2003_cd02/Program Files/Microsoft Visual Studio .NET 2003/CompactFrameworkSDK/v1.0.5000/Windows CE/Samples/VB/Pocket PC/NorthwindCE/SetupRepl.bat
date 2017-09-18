@echo off

:: Replication Demo Command Script for SQL Server CE
::
:: SetupRepl.bat - Creates the demo Nwind_SQLCE database and tables and sets up the publisher and distributor.
:: 
:: Warnings: 
::      - Assumes distributor and publisher are the same server
::	- Assumes user at publisher has db create rights
::	- Assumes user at distributor has replication rights
::
:: Parameters:
::	sqlrepl_demo_snapshot_share (required) Share name to use as snapshot folder.
::	sqlrepl_demo_publisher_user (required) Publiaher user ID.
::	sqlrepl_demo_publisher_pwd  (required) Publisher password.
::	sqlrepl_demo_publisher      (optional) Publisher name. Defaults to local machine.
::	sqlrepl_demo_machine_name   (optional) Defaults to Publisher name

if "%1"=="" goto usage
if "%1"=="?" goto usage
if "%1"=="/?" goto usage
if "%2"=="" goto usage
if "%3"=="" goto usage


REM -- Input parameters
set sqlrepl_demo_snapshot_share=%1
set sqlrepl_demo_publisher_user=%2
set sqlrepl_demo_publisher_pwd=%3
set sqlrepl_demo_publisher=%4
set sqlrepl_demo_machine_name=%5

if "%sqlrepl_demo_publisher%"=="" set sqlrepl_demo_publisher=%COMPUTERNAME%
if "%sqlrepl_demo_machine_name%"=="" set sqlrepl_demo_machine_name=%sqlrepl_demo_publisher%
if "%sqlrepl_demo_publisher_pwd%"=="""" set sqlrepl_demo_publisher_pwd=

REM -- Set Database equal to Nwind_SQLCE
set sqlrepl_demo_publisher_db=Nwind_SQLCE

REM -- Assume distributor and publisher are the same server.
set sqlrepl_demo_distributor=%sqlrepl_demo_publisher%
set sqlrepl_demo_distributor_user=%sqlrepl_demo_publisher_user%
set sqlrepl_demo_distributor_psswd=%sqlrepl_demo_publisher_pwd%

REM -- Set the working_directory for the snapshot share.

set sqlrepl_demo_workfolder=\\%sqlrepl_demo_machine_name%\%sqlrepl_demo_snapshot_share%

set snapshot_job_name=Nwind_SQLCEReplDemoNet-SQLCEReplDemoNet-1
set sqlrepl_demo_osqlexe="C:\Program Files\Microsoft SQL Server\80\Tools\Binn\osql.exe"
set sqlrepl_demo_snapshotexe="C:\Program Files\Microsoft SQL Server\80\COM\SNAPSHOT.EXE"

REM -- *************************************Distributor*************************************************************************

@echo Configuring the Distributor...
REM -- Add distributor
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_distributor% /U%sqlrepl_demo_distributor_user% /P%sqlrepl_demo_distributor_psswd% /n /dmaster /Q"exec dbo.sp_adddistributor @distributor = N'%sqlrepl_demo_distributor%', @password = N'%sqlrepl_demo_distributor_psswd%'"

REM -- Updating the agent profile defaults
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_distributor% /U%sqlrepl_demo_distributor_user% /P%sqlrepl_demo_distributor_psswd% /n /dmaster /Q"sp_MSupdate_agenttype_default @profile_id = 1"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_distributor% /U%sqlrepl_demo_distributor_user% /P%sqlrepl_demo_distributor_psswd% /n /dmaster /Q"sp_MSupdate_agenttype_default @profile_id = 2"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_distributor% /U%sqlrepl_demo_distributor_user% /P%sqlrepl_demo_distributor_psswd% /n /dmaster /Q"sp_MSupdate_agenttype_default @profile_id = 4"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_distributor% /U%sqlrepl_demo_distributor_user% /P%sqlrepl_demo_distributor_psswd% /n /dmaster /Q"sp_MSupdate_agenttype_default @profile_id = 6"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_distributor% /U%sqlrepl_demo_distributor_user% /P%sqlrepl_demo_distributor_psswd% /n /dmaster /Q"sp_MSupdate_agenttype_default @profile_id = 11"

REM -- Adding the distribution database
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_distributor% /U%sqlrepl_demo_distributor_user% /P%sqlrepl_demo_distributor_psswd% /n /dmaster /Q"exec dbo.sp_adddistributiondb @database = N'distribution', @min_distretention = 0, @max_distretention = 72, @history_retention = 48, @security_mode = 1"

REM -- Adding the distribution publisher 
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_distributor% /U%sqlrepl_demo_distributor_user% /P%sqlrepl_demo_distributor_psswd% /n /dmaster /Q"exec dbo.sp_adddistpublisher  @publisher = N'%sqlrepl_demo_publisher%', @distribution_db = N'distribution', @security_mode = 0, @login = N'%sqlrepl_demo_distributor_user%', @password = N'%sqlrepl_demo_distributor_psswd%', @working_directory = N'%sqlrepl_demo_workfolder%', @trusted = N'false', @thirdparty_flag = 0

REM -- *************************************Create Database*******************************************************************

@echo Creating database %sqlrepl_demo_publisher_db% on %sqlrepl_demo_publisher%...
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /dmaster /Q"CREATE DATABASE %sqlrepl_demo_publisher_db%"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /inwndsqlce.sql

REM -- *************************************Publisher*************************************************************************

@echo Configuring the Publisher and Publication...
REM -- Enabling the replication database
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /dmaster /Q"exec sp_replicationdboption @dbname = N'%sqlrepl_demo_publisher_db%', @optname = N'merge publish', @value = N'true'"

REM -- Adding the merge publication
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_addmergepublication @publication = N'SQLCEReplDemoNet', @description = N'Merge publication of %sqlrepl_demo_publisher_db% database.', @retention = 60, @sync_mode = N'character', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'true', @enabled_for_internet = N'false', @centralized_conflicts = N'true', @dynamic_filters = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @conflict_retention = 14, @keep_partition_changes = N'false', @allow_subscription_copy = N'false', @allow_synctoalternate = N'false', @add_to_active_directory = N'false', @max_concurrent_merge = 0, @max_concurrent_dynamic_snapshots = 0"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_addpublication_snapshot @publication = N'SQLCEReplDemoNet',@frequency_type = 8, @frequency_interval = 64, @frequency_relative_interval = 0, @frequency_recurrence_factor = 1, @frequency_subday = 1, @frequency_subday_interval = 0, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 12500, @active_end_time_of_day = 0, @snapshot_job_name = N'%snapshot_job_name%'"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_grant_publication_access @publication = N'SQLCEReplDemoNet', @login = N'BUILTIN\Administrators'"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_grant_publication_access @publication = N'SQLCEReplDemoNet', @login = N'distributor_admin'"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_grant_publication_access @publication = N'SQLCEReplDemoNet', @login = N'sa'"


REM -- Adding the merge articles

REM -- Add the "Order Details" Table
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_addmergearticle @publication = N'SQLCEReplDemoNet', @article = N'Order Details', @source_owner = N'dbo', @source_object = N'Order Details', @type = N'table', @description = null, @column_tracking = N'true', @pre_creation_cmd = N'drop', @creation_script = null, @schema_option = 0x000000000000CFF1, @article_resolver = null, @subset_filterclause = null, @vertical_partition = N'false', @destination_owner = N'dbo', @auto_identity_range = N'false', @verify_resolver_signature = 0, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0"


REM -- Add the "Orders" Table
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_addmergearticle @publication = N'SQLCEReplDemoNet', @article = N'Orders', @source_owner = N'dbo', @source_object = N'Orders', @type = N'table', @description = null, @column_tracking = N'true', @pre_creation_cmd = N'drop', @creation_script = null, @schema_option = 0x000000000000CFF1, @article_resolver = null, @subset_filterclause = null, @vertical_partition = N'false', @destination_owner = N'dbo', @auto_identity_range = N'true', @pub_identity_range = 100, @identity_range = 100, @threshold = 80, @verify_resolver_signature = 0, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0"


REM -- Add the "Products" Table
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_addmergearticle @publication = N'SQLCEReplDemoNet', @article = N'Products', @source_owner = N'dbo', @source_object = N'Products', @type = N'table', @description = null, @column_tracking = N'true', @pre_creation_cmd = N'drop', @creation_script = null, @schema_option = 0x000000000000CFF1, @article_resolver = null, @subset_filterclause = null, @vertical_partition = N'false', @destination_owner = N'dbo', @auto_identity_range = N'true', @pub_identity_range = 100, @identity_range = 100, @threshold = 80, @verify_resolver_signature = 0, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0"

REM -- Adding the article's partition column(s) for "Products" Table
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_mergearticlecolumn @publication = N'SQLCEReplDemoNet', @article = N'Products', @column = N'SupplierID', @operation = N'drop'"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_mergearticlecolumn @publication = N'SQLCEReplDemoNet', @article = N'Products', @column = N'CategoryID', @operation = N'drop'"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_mergearticlecolumn @publication = N'SQLCEReplDemoNet', @article = N'Products', @column = N'QuantityPerUnit', @operation = N'drop'"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_mergearticlecolumn @publication = N'SQLCEReplDemoNet', @article = N'Products', @column = N'UnitsOnOrder', @operation = N'drop'"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_mergearticlecolumn @publication = N'SQLCEReplDemoNet', @article = N'Products', @column = N'ReorderLevel', @operation = N'drop'"


REM -- Add the "Employees" Table
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_addmergearticle @publication = N'SQLCEReplDemoNet', @article = N'Employees', @source_owner = N'dbo', @source_object = N'Employees', @type = N'table', @description = null, @column_tracking = N'true', @pre_creation_cmd = N'drop', @creation_script = null, @schema_option = 0x000000000000CFF1, @article_resolver = null, @subset_filterclause = null, @vertical_partition = N'false', @destination_owner = N'dbo', @auto_identity_range = N'true', @pub_identity_range = 100, @identity_range = 100, @threshold = 80, @verify_resolver_signature = 0, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0"

%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_mergearticlecolumn @publication = N'SQLCEReplDemoNet', @article = N'Employees', @column = N'Photo', @operation = N'drop'"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_mergearticlecolumn @publication = N'SQLCEReplDemoNet', @article = N'Employees', @column = N'Notes', @operation = N'drop'"
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_mergearticlecolumn @publication = N'SQLCEReplDemoNet', @article = N'Employees', @column = N'PhotoPath', @operation = N'drop'"


REM -- Add the "Customers" Table
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_addmergearticle @publication = N'SQLCEReplDemoNet', @article = N'Customers', @source_owner = N'dbo', @source_object = N'Customers', @type = N'table', @description = null, @column_tracking = N'true', @pre_creation_cmd = N'drop', @creation_script = null, @schema_option = 0x000000000000CFF1, @article_resolver = null, @subset_filterclause = null, @vertical_partition = N'false', @destination_owner = N'dbo', @auto_identity_range = N'false', @verify_resolver_signature = 0, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0"


REM -- Add the "Shippers" Table
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_addmergearticle @publication = N'SQLCEReplDemoNet', @article = N'Shippers', @source_owner = N'dbo', @source_object = N'Shippers', @type = N'table', @description = null, @column_tracking = N'true', @pre_creation_cmd = N'drop', @creation_script = null, @schema_option = 0x000000000000CFF1, @article_resolver = null, @subset_filterclause = null, @vertical_partition = N'false', @destination_owner = N'dbo', @auto_identity_range = N'true', @pub_identity_range = 100, @identity_range = 100, @threshold = 80, @verify_resolver_signature = 0, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0"

REM -- Adding the article's partition column(s) for "Shippers" Table
%sqlrepl_demo_osqlexe% /S%sqlrepl_demo_publisher% /U%sqlrepl_demo_publisher_user% /P%sqlrepl_demo_publisher_pwd% /n /d%sqlrepl_demo_publisher_db% /Q"exec sp_mergearticlecolumn @publication = N'SQLCEReplDemoNet', @article = N'Shippers', @column = N'Phone', @operation = N'drop'"


REM -- *********************Starting Snapshot Agent***********************************************************************

@echo Generating initial snapshots...
@echo Wait for each job to finish before using application.
%sqlrepl_demo_snapshotexe% -Publication [SQLCEReplDemoNet] -Publisher %sqlrepl_demo_publisher% -PublisherDB [%sqlrepl_demo_publisher_db%] -Distributor [%sqlrepl_demo_distributor%] -ReplicationType 2 -DistributorSecurityMode 0 -DistributorLogin %sqlrepl_demo_distributor_user% -DistributorPassword %sqlrepl_demo_distributor_psswd% -PublisherSecurityMode 0 -PublisherLogin %sqlrepl_demo_publisher_user% -PublisherPassword %sqlrepl_demo_publisher_pwd%



REM -- *************************************Usage*************************************************************************

:usage
@echo Usage: SetupRepl {required parms} {optional parms}
@echo .
@echo . Required Arguments:
@echo . {snapshot share}          - a share available for the storage of snapshot 
@echo .                             files. All subscribers (IIS user) must be able 
@echo .                             to read from this share
@echo . {publisher login}         - Publisher user ID.
@echo . {publisher password}      - Publisher password.
@echo .
@echo . Optional Arguments:
@echo . {publisher}               - Publisher name. Defaults to local machine.
@echo . {snapshot server name}    - Defaults to Publisher name. (Must be set to
@echo .                             support named instance)
@echo .
@echo . Examples:
@echo .          SetupRepl ReplSnapshot sa password
@echo .      or
@echo .          SetupRepl ReplSnapshot sa password Publisher 
@echo .      or
@echo .          SetupRepl ReplSnapshot sa password Publisher\instance ServerName
@echo .
@echo . Will create a publication SQLCEReplDemoNet on your local machine, configure
@echo . it and prepare the snapshot files so you can begin using the %sqlrepl_demo_publisher_db% 
@echo . SQLCE application.

REM -- *************************************Reset*************************************************************************

set sqlrepl_demo_publisher=
set sqlrepl_demo_publisher_user=
set sqlrepl_demo_publisher_pwd=
set sqlrepl_demo_distributor=
set sqlrepl_demo_distributor_user=
set sqlrepl_demo_distributor_psswd=
set snapshot_job_name= 
set sqlrepl_demo_workfolder= 
set sqlrepl_demo_machine_name=

:end