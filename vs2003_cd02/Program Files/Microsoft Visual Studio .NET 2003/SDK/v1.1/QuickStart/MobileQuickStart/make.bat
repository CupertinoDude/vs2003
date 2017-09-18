:: -------------------------------------------------------------
:: Make.bat
::      Makes only the mobile quickstarts.  Not needed for normal
::	builds.
::
::      Copyright (c) Microsoft Corporation
:: -------------------------------------------------------------

@echo off


set MAINASSEMBLY=System.Web.Mobile.dll

call :BuildQuickStarts

goto :eof


:BuildQuickStarts
REM -------------------------------------------------------------------------
REM -- Builds binaries for QuickStarts.
REM -------------------------------------------------------------------------
    
    @echo Building English Mobile Quickstarts

    nmake -a NETSAMPLEPATH=C:\fxdev\fx\main\Samples
     
    goto :eof

:done
exit /b 0