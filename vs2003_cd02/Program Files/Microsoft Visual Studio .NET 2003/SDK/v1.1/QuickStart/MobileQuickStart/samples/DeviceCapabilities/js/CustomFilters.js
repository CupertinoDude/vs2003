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

import System;
import System.Web.Mobile;

package Acme
{
    public class CustomFilters
    {
        //////  Publically available custom device filters

        //// Simple combination
        public static function IsScriptableHtml32(cap : MobileCapabilities , arg : String ): boolean
        {
            return
                (cap.PreferredRenderingType == "html32") &&
                (cap.JavaScript == true);
        }

        //// Basic dimensions
        public static function IsLandscape(cap : MobileCapabilities , arg : String) : boolean
        {
            return cap.ScreenPixelsWidth >= cap.ScreenPixelsHeight;
        }

        public static function IsPortrait(cap : MobileCapabilities , arg : String) : boolean
        {
            return cap.ScreenPixelsWidth <= cap.ScreenPixelsHeight;
        }

        public static function IsSmallScreen(cap : MobileCapabilities , arg : String) : boolean
        {
            return cap.ScreenCharactersWidth * cap.ScreenCharactersHeight < 60;
        }

        public static function IsBigScreen(cap : MobileCapabilities , arg : String) : boolean
        {
            return cap.ScreenCharactersWidth * cap.ScreenCharactersHeight > 100;
        }

        //// Device identification
        public static function UsingChtmlRendering(cap : MobileCapabilities , arg : String) : boolean
        {
            var renderType : String = cap.PreferredRenderingType;
            return
                (renderType == MobileCapabilities.PreferredRenderingTypeHtml32 ||
                 renderType == MobileCapabilities.PreferredRenderingTypeChtml10) &&
                !cap.JavaScript;
        }

        //// Browser/Manufacturer Combinations

        public static function GoWebOnPalm(cap : MobileCapabilities , arg : String) : boolean
        {
            return BrowserManufacturerMatch(_gowebBrowser, _palmManufacturer, cap);
        }

        public static function GoWebOnRIM(cap : MobileCapabilities , arg : String) : boolean
        {
            return BrowserManufacturerMatch(_gowebBrowser, _rimManufacturer, cap);
        }

        public static function MmeOnSony(cap : MobileCapabilities , arg : String) : boolean
        {
            return BrowserManufacturerMatch(_mmeBrowser, _sonyManufacturer, cap);
        }
        
        public static function MmeOnBenefon(cap : MobileCapabilities , arg : String) : boolean
        {
            return BrowserManufacturerMatch(_mmeBrowser, _benefonManufacturer, cap);
        }

        public static function ImodeOnMitsubishi(cap : MobileCapabilities , arg : String) : boolean
        {
            return BrowserManufacturerMatch(_imodeBrowser, _mitsubishiManufacturer, cap);
        }
        
        public static function ImodeOnFujitsu(cap : MobileCapabilities , arg : String) : boolean
        {
            return BrowserManufacturerMatch(_imodeBrowser, _fujitsuManufacturer, cap);
        }
        
        //// Image comparison
        
        // GIFs
        public static function UseSmallGif(cap : MobileCapabilities , arg : String) : boolean
        {
            return ImageSizeMatch(ImageSize.SmallImage, _gifMime, cap);
        }

        public static function UseMediumGif(cap : MobileCapabilities , arg : String) : boolean
        {
            return ImageSizeMatch(ImageSize.MediumImage, _gifMime, cap);
        }

        public static function UseLargeGif(cap : MobileCapabilities , arg : String) : boolean
        {
            return ImageSizeMatch(ImageSize.LargeImage, _gifMime, cap);
        }

        // WBMPs
        public static function UseSmallWbmp(cap : MobileCapabilities , arg : String) : boolean
        {
            return ImageSizeMatch(ImageSize.SmallImage, _wbmpMime, cap);
        }

        public static function UseMediumWbmp(cap : MobileCapabilities , arg : String) : boolean
        {
            return ImageSizeMatch(ImageSize.MediumImage, _wbmpMime, cap);
        }

        public static function UseLargeWbmp(cap : MobileCapabilities , arg : String) : boolean
        {
            return ImageSizeMatch(ImageSize.LargeImage, _wbmpMime, cap);
        }

        // BMPs
        public static function UseSmallBmp(cap : MobileCapabilities , arg : String) : boolean
        {
            return ImageSizeMatch(ImageSize.SmallImage, _bmpMime, cap);
        }

        public static function UseMediumBmp(cap : MobileCapabilities , arg : String) : boolean
        {
            return ImageSizeMatch(ImageSize.MediumImage, _bmpMime, cap);
        }

        public static function UseLargeBmp(cap : MobileCapabilities , arg : String) : boolean
        {
            return ImageSizeMatch(ImageSize.LargeImage, _bmpMime, cap);
        }

        //////  Private implementation stuff
        
        enum ImageSize : int
        {
            SmallImage = 0,
            MediumImage = 1,
            LargeImage= 2
        }

        private static const _gifMime : String = "image/gif";
        private static const _bmpMime : String = "image/bmp";
        private static const _wbmpMime : String = "image/vnd.wap.wbmp";
            
        static function ImageSizeMatch(size:ImageSize ,preferredImageMime:String ,cap:MobileCapabilities ) : boolean 
        {
            if (cap.PreferredImageMime != preferredImageMime)
            {
                return false;
            }
            
            var minDimension : int = Math.min(cap.ScreenPixelsWidth,
                                        cap.ScreenPixelsHeight);
            
            var preferredImageSize : ImageSize;
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


        private static const _gowebBrowser : String = "Go.Web";
        private static const _mmeBrowser : String = "Microsoft Mobile Explorer";
        private static const _imodeBrowser : String = "i-mode";

        private static const _palmManufacturer : String = "Palm";
        private static const _rimManufacturer : String = "RIM";
        private static const _sonyManufacturer : String = "Sony";
        private static const _benefonManufacturer : String = "Benefon";
        private static const _mitsubishiManufacturer : String = "Mitsubishi";
        private static const _fujitsuManufacturer : String = "Fujitsu";
        
        private static function BrowserManufacturerMatch(browser : String ,
                                                     manufacturer : String ,
                                                     cap : MobileCapabilities ) : boolean
        {
            return
                cap.MobileDeviceManufacturer == manufacturer &&
                cap.Browser == browser;
        }

    }
}
