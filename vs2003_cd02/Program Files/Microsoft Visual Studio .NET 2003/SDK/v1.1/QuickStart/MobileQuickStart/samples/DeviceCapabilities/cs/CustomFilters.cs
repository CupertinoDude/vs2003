//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

using System;
using System.Web.Mobile;

namespace Acme
{
    public class CustomFilters
    {
        //////  Publically available custom device filters

        //// Simple combination
        public static bool IsScriptableHtml32(MobileCapabilities cap, String arg)
        {
            return
                (cap.PreferredRenderingType == "html32") &&
                (cap.JavaScript == true);
        }

        //// Basic dimensions
        public static bool IsLandscape(MobileCapabilities cap, String arg)
        {
            return cap.ScreenPixelsWidth >= cap.ScreenPixelsHeight;
        }

        public static bool IsPortrait(MobileCapabilities cap, String arg)
        {
            return cap.ScreenPixelsWidth <= cap.ScreenPixelsHeight;
        }

        public static bool IsSmallScreen(MobileCapabilities cap, String arg)
        {
            return cap.ScreenCharactersWidth * cap.ScreenCharactersHeight < 60;
        }

        public static bool IsBigScreen(MobileCapabilities cap, String arg)
        {
            return cap.ScreenCharactersWidth * cap.ScreenCharactersHeight > 100;
        }

        //// Device identification
        public static bool UsingChtmlRendering(MobileCapabilities cap, String arg)
        {
            String renderType = cap.PreferredRenderingType;
            return
                (renderType == MobileCapabilities.PreferredRenderingTypeHtml32 ||
                 renderType == MobileCapabilities.PreferredRenderingTypeChtml10) &&
                !cap.JavaScript;
        }

        //// Browser/Manufacturer Combinations

        public static bool GoWebOnPalm(MobileCapabilities cap, String arg)
        {
            return BrowserManufacturerMatch(_gowebBrowser, _palmManufacturer, cap);
        }

        public static bool GoWebOnRIM(MobileCapabilities cap, String arg)
        {
            return BrowserManufacturerMatch(_gowebBrowser, _rimManufacturer, cap);
        }

        public static bool MmeOnSony(MobileCapabilities cap, String arg)
        {
            return BrowserManufacturerMatch(_mmeBrowser, _sonyManufacturer, cap);
        }
        
        public static bool MmeOnBenefon(MobileCapabilities cap, String arg)
        {
            return BrowserManufacturerMatch(_mmeBrowser, _benefonManufacturer, cap);
        }

        public static bool ImodeOnMitsubishi(MobileCapabilities cap, String arg)
        {
            return BrowserManufacturerMatch(_imodeBrowser, _mitsubishiManufacturer, cap);
        }
        
        public static bool ImodeOnFujitsu(MobileCapabilities cap, String arg)
        {
            return BrowserManufacturerMatch(_imodeBrowser, _fujitsuManufacturer, cap);
        }
        
        //// Image comparison
        
        // GIFs
        public static bool UseSmallGif(MobileCapabilities cap, String arg)
        {
            return ImageSizeMatch(ImageSize.SmallImage, _gifMime, cap);
        }

        public static bool UseMediumGif(MobileCapabilities cap, String arg)
        {
            return ImageSizeMatch(ImageSize.MediumImage, _gifMime, cap);
        }

        public static bool UseLargeGif(MobileCapabilities cap, String arg)
        {
            return ImageSizeMatch(ImageSize.LargeImage, _gifMime, cap);
        }

        // WBMPs
        public static bool UseSmallWbmp(MobileCapabilities cap, String arg)
        {
            return ImageSizeMatch(ImageSize.SmallImage, _wbmpMime, cap);
        }

        public static bool UseMediumWbmp(MobileCapabilities cap, String arg)
        {
            return ImageSizeMatch(ImageSize.MediumImage, _wbmpMime, cap);
        }

        public static bool UseLargeWbmp(MobileCapabilities cap, String arg)
        {
            return ImageSizeMatch(ImageSize.LargeImage, _wbmpMime, cap);
        }

        // BMPs
        public static bool UseSmallBmp(MobileCapabilities cap, String arg)
        {
            return ImageSizeMatch(ImageSize.SmallImage, _bmpMime, cap);
        }

        public static bool UseMediumBmp(MobileCapabilities cap, String arg)
        {
            return ImageSizeMatch(ImageSize.MediumImage, _bmpMime, cap);
        }

        public static bool UseLargeBmp(MobileCapabilities cap, String arg)
        {
            return ImageSizeMatch(ImageSize.LargeImage, _bmpMime, cap);
        }

        //////  Private implementation stuff
        
        private enum ImageSize
        {
            SmallImage,
            MediumImage,
            LargeImage
        }

        private const String _gifMime = "image/gif";
        private const String _bmpMime = "image/bmp";
        private const String _wbmpMime = "image/vnd.wap.wbmp";
            
        private static bool ImageSizeMatch(ImageSize size,
                                           String preferredImageMime,
                                           MobileCapabilities cap)
        {
            if (cap.PreferredImageMime != preferredImageMime)
            {
                return false;
            }
            
            int minDimension = Math.Min(cap.ScreenPixelsWidth,
                                        cap.ScreenPixelsHeight);
            
            ImageSize preferredImageSize;
            if (minDimension <= 100)
            {
                preferredImageSize = ImageSize.SmallImage;
            }
            else if (minDimension <= 320)
            {
                preferredImageSize = ImageSize.MediumImage;
            }
            else
            {
                preferredImageSize = ImageSize.LargeImage;
            }
            
            if (size != preferredImageSize)
            {
                return false;
            }
            
            return true;
        }


        private const String _gowebBrowser = "Go.Web";
        private const String _mmeBrowser = "Microsoft Mobile Explorer";
        private const String _imodeBrowser = "i-mode";

        private const String _palmManufacturer = "Palm";
        private const String _rimManufacturer = "RIM";
        private const String _sonyManufacturer = "Sony";
        private const String _benefonManufacturer = "Benefon";
        private const String _mitsubishiManufacturer = "Mitsubishi";
        private const String _fujitsuManufacturer = "Fujitsu";
        
        private static bool BrowserManufacturerMatch(String browser,
                                                     String manufacturer,
                                                     MobileCapabilities cap)
        {
            return
                cap.MobileDeviceManufacturer == manufacturer &&
                cap.Browser == browser;
        }

    }
}
