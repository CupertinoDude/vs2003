'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports System 
Imports System.Web.Mobile 

Namespace Acme

    Public Class CustomFilters

        '****** Publically available custom device filters

        '** Basic dimensions

        Public Shared Function IsLandscape(cap As MobileCapabilities, arg As String) As Boolean
            IsLandscape = cap.ScreenPixelsWidth >= cap.ScreenPixelsHeight
        End Function

        Public Shared Function IsPortrait(cap As MobileCapabilities, arg As String) As Boolean
            IsPortrait = cap.ScreenPixelsWidth <= cap.ScreenPixelsHeight
        End Function

        Public Shared Function IsSmallScreen(cap As MobileCapabilities, arg As String) As Boolean
            IsSmallScreen = cap.ScreenCharactersWidth * cap.ScreenCharactersHeight < 60
        End Function

        Public Shared Function IsBigScreen(cap As MobileCapabilities, arg As String) As Boolean
            IsBigScreen = cap.ScreenCharactersWidth * cap.ScreenCharactersHeight > 100
        End Function


        '** Device identification
        Public Shared Function UsingChtmlRendering(cap As MobileCapabilities, arg As String) As Boolean
            Dim renderType As String = cap.PreferredRenderingType
            UsingChtmlRendering = _
                (renderType = MobileCapabilities.PreferredRenderingTypeHtml32 Or  _
                 renderType = MobileCapabilities.PreferredRenderingTypeChtml10) And   _
                (Not cap.JavaScript)
        End Function

        '** Browser/Manufacturer Combinations

        Public Shared Function GoWebOnPalm(cap As MobileCapabilities, arg As String) As Boolean
            GoWebOnPalm = BrowserManufacturerMatch(GoWebBrowser, PalmManufacturer, cap)
        End Function

        Public Shared Function GoWebOnRIM(cap As MobileCapabilities, arg As String) As Boolean
            GoWebOnRIM = BrowserManufacturerMatch(GoWebBrowser, RIMManufacturer, cap)
        End Function

        Public Shared Function MmeOnSony(cap As MobileCapabilities, arg As String) As Boolean
            MmeOnSony = BrowserManufacturerMatch(MmeBrowser, SonyManufacturer, cap)
        End Function
        
        Public Shared Function MmeOnBenefon(cap As MobileCapabilities, arg As String) As Boolean
            MmeOnBenefon = BrowserManufacturerMatch(MmeBrowser, BenefonManufacturer, cap)
        End Function

        Public Shared Function ImodeOnMitsubishi(cap As MobileCapabilities, arg As String) As Boolean
            ImodeOnMitsubishi = BrowserManufacturerMatch(IModeBrowser, MitsubishiManufacturer, cap)
        End Function
        
        Public Shared Function ImodeOnFujitsu(cap As MobileCapabilities, arg As String) As Boolean
            ImodeOnFujitsu = BrowserManufacturerMatch(IModeBrowser, FujitsuManufacturer, cap)
        End Function
        
        '** Image comparison
        
        ' GIFs
        Public Shared Function UseSmallGif(cap As MobileCapabilities, arg As String) As Boolean
            UseSmallGif = ImageSizeMatch(ImageSize.SmallImage, GifMIME, cap)
        End Function

        Public Shared Function UseMediumGif(cap As MobileCapabilities, arg As String) As Boolean
            UseMediumGif = ImageSizeMatch(ImageSize.MediumImage, GifMIME, cap)
        End Function

        Public Shared Function UseLargeGif(cap As MobileCapabilities, arg As String) As Boolean
            UseLargeGif = ImageSizeMatch(ImageSize.LargeImage, GifMIME, cap)
        End Function

        ' WBMPs
        Public Shared Function UseSmallWbmp(cap As MobileCapabilities, arg As String) As Boolean
            UseSmallWbmp = ImageSizeMatch(ImageSize.SmallImage, WBmpMIME, cap)
        End Function

        Public Shared Function UseMediumWbmp(cap As MobileCapabilities, arg As String) As Boolean
            UseMediumWbmp = ImageSizeMatch(ImageSize.MediumImage, WBmpMIME, cap)
        End Function

        Public Shared Function UseLargeWbmp(cap As MobileCapabilities, arg As String) As Boolean
            UseLargeWbmp = ImageSizeMatch(ImageSize.LargeImage, WBmpMIME, cap)
        End Function

        ' BMPs
        Public Shared Function UseSmallBmp(cap As MobileCapabilities, arg As String) As Boolean
            UseSmallBmp = ImageSizeMatch(ImageSize.SmallImage, BmpMIME, cap)
        End Function

        Public Shared Function UseMediumBmp(cap As MobileCapabilities, arg As String) As Boolean
            UseMediumBmp = ImageSizeMatch(ImageSize.MediumImage, BmpMIME, cap)
        End Function

        Public Shared Function UseLargeBmp(cap As MobileCapabilities, arg As String) As Boolean
            UseLargeBmp = ImageSizeMatch(ImageSize.LargeImage, BmpMIME, cap)
        End Function

        '****  Private implementation stuff
        
        Private Enum ImageSize
            SmallImage
            MediumImage
            LargeImage
        End Enum

        Private Shared GifMIME as String = "image/gif"
        Private Shared BmpMIME as String = "image/bmp"
        Private Shared WBmpMIME as String = "image/vnd.wap.wbmp"
            
        Private Shared Function ImageSizeMatch(size as ImageSize, _
                                               preferredImageMime as String, _
                                               cap as MobileCapabilities) As Boolean

            If cap.PreferredImageMIME <> preferredImageMime
                ImageSizeMatch = False
                Exit Function
            End If
            
            Dim minDimension as Integer = Math.Min(cap.ScreenPixelsWidth, _
                                                   cap.ScreenPixelsHeight)
            
            Dim preferredImageSize as ImageSize
            If minDimension <= 100
                preferredImageSize = ImageSize.SmallImage
            ElseIf minDimension <= 320
                preferredImageSize = ImageSize.MediumImage
            Else
                preferredImageSize = ImageSize.LargeImage
            End If
            
            If Size <> preferredImageSize
                ImageSizeMatch = False
                Exit Function
            End If
            
            ImageSizeMatch = True
        End Function


        Private Shared GoWebBrowser as String = "Go.Web"
        Private Shared MmeBrowser as String = "Microsoft Mobile Explorer"
        Private Shared IModeBrowser as String = "i-mode"
        Private Shared PalmManufacturer as String = "Palm"
        Private Shared RIMManufacturer as String = "RIM"
        Private Shared SonyManufacturer as String = "Sony"
        Private Shared BenefonManufacturer as String = "Benefon"
        Private Shared MitsubishiManufacturer as String = "Mitsubishi"
        Private Shared FujitsuManufacturer as String = "Fujitsu"
        
        Private Shared Function BrowserManufacturerMatch(browser As String, _
                                                     manufacturer As String, _
                                                     cap As MobileCapabilities) As Boolean
            BrowserManufacturerMatch = _
                (cap.MobileDeviceManufacturer = manufacturer) And _
                (cap.Browser = browser)
        End Function

    End Class

End Namespace

