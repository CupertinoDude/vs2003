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
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acme
{
    public class InputValidator
    {
        // ***
        // Regular Expression useful in Validation
        //
    
        // Accepts only digits.  No spaces before or after are
        // allowed.  No monetary symbol is allowed.  No decimal
        // separator is allowed.
        public static string AnsiNumericExpressionString = "^\\d*$";
        public static string AnsiNumericErrorString = "Limit characters to ANSI digits";
        public static Regex AnsiNumericExpression = new Regex(AnsiNumericExpressionString, RegexOptions.Compiled);
        
        // Accepts only basic ANSI letters, digits, the period
        // character, and space characters.  Requires that at
        // least one character exist to be validated.
        public static string AnsiNameExpressionString = "^[\\w\\d\\.\\s\\,\\']*$";
        public static string AnsiNameErrorString = "Limit characters to alphanumeric, spaces, and these symbols .,'";
        public static Regex AnsiNameExpression = new Regex(AnsiNameExpressionString, RegexOptions.Compiled);
        
        // Looks for characters that can be considered unsafe text.
        // Items to watch out for include quotes, apostrophes,
        // semi-colons, and the less than and greater than signs.
        // Unknown malicious characters can easily bypass the
        // IsSafeText expression.
        public static string SafeTextExpressionString = "[\\\"\\'\\;<>]";
        public static string SafeTextErrorString = "String cannot contain these symbols <>;'\"";
        public static Regex SafeTextExpression = new Regex(SafeTextExpressionString, RegexOptions.Compiled);
        
        // Accepts only valid email characters.
        // Valid email characters are limited to
        // Alphanumeric, periods, underscores, and the
        // at symbol.
        public static string AnsiEmailExpressionString = "^[\\w\\d\\.\\@_]*$";
        public static string AnsiEmailErrorString = "Limit characters to alphanumeric and these symbols _.@";
        public static Regex AnsiEmailExpression = new Regex(AnsiEmailExpressionString, RegexOptions.Compiled);
        
        // Accepts only valid telephone number characters.
        // This restricts the input to digits, hyphens, parentheses,
        // periods, commas, space characters, the plus symbol,
        // and ansi letters.
        // This expression can be customized to add better parsing
        // and to limit input types.
        //
        // Examples of valid input
        // 111 111 1111
        // (111) 111-1111
        // (111) 111-1111 ext. 555
        public static string AnsiPhoneExpressionString = "^[\\w\\d\\.\\s\\(\\)\\+\\,\\-]*$";
        public static string AnsiPhoneErrorString = "Limit characters to ANSI alphanumerics, spaces, and these symbols .,+-()";
        public static Regex AnsiPhoneExpression = new Regex(AnsiPhoneExpressionString, RegexOptions.Compiled);
        
        // Accepts only valid address input characters.
        // This restricts the input to ansi letters, digits,
        // commas, hyphens, periods, semi-colons, and space
        // characters.
        public static string AnsiAddressExpressionString = "^[\\w\\d\\.\\s\\;\\,\\-]*$";
        public static string AnsiAddressErrorString = "Limit characters to ANSI alphanumerics, spaces, and these symbols .,-;";
        public static Regex AnsiAddressExpression = new Regex(AnsiAddressExpressionString, RegexOptions.Compiled);
        
        // Accepts only two character states
        // This can be extended to actually check against a valid
        // listing of states.  This is a first tier approach that
        // can be much easier to implement.
        public static string AnsiTwoCharacterStateExpressionString = "^[\\w]{2}$";
        public static string AnsiTwoCharacterStateErrorString = "Limit to 2 ANSI alpha characters";
        public static Regex AnsiTwoCharacterStateExpression = new Regex(AnsiTwoCharacterStateExpressionString, RegexOptions.Compiled);
        
        // Accepts only alpha state or city names with periods.
        // This can be extended to check against actual
        // state names.  This is a first tier approach that
        // can be much easier to implement.
        public static string AnsiCityStateExpressionString = "^[\\w\\s\\.\\'\\,]*$";
        public static string AnsiCityStateErrorString = "Limit characters to ANSI alpha characters, spaces, and these symbols .,'";
        public static Regex AnsiCityStateExpression = new Regex(AnsiCityStateExpressionString, RegexOptions.Compiled);
        
        // Accepts only 5 character zip codes
        public static string AnsiBasicZipCodeExpressionString = "^\\d{5}$";
        public static string AnsiBasicZipCodeErrorString = "Limit to 5 ANSI digits";
        public static Regex AnsiBasicZipCodeExpression = new Regex(AnsiBasicZipCodeExpressionString, RegexOptions.Compiled);

        // Accepts only 9 character zip codes
        // with a hyphen separator between digits
        // 5 and 6
        public static string AnsiExtendedZipCodeExpressionString = "^\\d{5}\\-\\d{4}$";
        public static string AnsiExtendedZipCodeErrorString = "Limit to 5 ANSI digits, a hyphen, and 4 more ANSI digits";
        public static Regex AnsiExtendedZipCodeExpression = new Regex(AnsiExtendedZipCodeExpressionString, RegexOptions.Compiled);
        
        // ***
        // Regular Expression useful in string stripping and conversion
        //
        public static string StripHtmlTagsExpressionString = "\\<\\.\\*\\>";
        public static Regex StripHtmlTagsExpression = new Regex(StripHtmlTagsExpressionString, RegexOptions.Compiled);
        
        public static string StripHtmlTagCharactersExpressionString = "[\\<\\>]";
        public static Regex StripHtmlTagCharactersExpression = new Regex(StripHtmlTagCharactersExpressionString, RegexOptions.Compiled);
        
        public static string EscapeApostrophesExpressionString = "[\\']";
        public static Regex EscapeApostrophesExpression = new Regex(EscapeApostrophesExpressionString, RegexOptions.Compiled);
        
        public static string EscapeNewLinesToHtmlExpressionString = "(?:\\r\\n|\\n\\r|\\r|\\n)";
        public static Regex EscapeNewLinesToHtmlExpression = new Regex(EscapeNewLinesToHtmlExpressionString, RegexOptions.Compiled);
        
        // ***
        // String Normalization Methods
        //
        
        public static string StripHtmlTags(string text)
        {
            return StripHtmlTagsExpression.Replace(text, "");
        }
        
        // This method is multi input hack safe.  This means
        // that tags spread over multiple inputs won't miss
        // being stripped.  For instance:
        //
        // input 1: <script
        // input 2: language=javascript>alert('me');
        //
        // This would get parsed out because the tag
        // begin and end symbols get ripped.  Another
        // stripping approach could be to strip the tag
        // characters plus whatever is inside, but this
        // doesn't work when input is spread over multiple
        // controls.
        public static string StripHtmlTagsSafe(string text)
        {
            return StripHtmlTagCharactersExpression.Replace(text, "");
        }
        
        public static string EscapeApostrophes(string text)
        {
            return EscapeApostrophesExpression.Replace(text, "''");
        }
        
        // If you are going to use this method then call
        // StripHtmlTags first, then call this method.  Else
        // you'll strip out the BR's.
        public static string EscapeNewLinesToHtml(string text)
        {
            return EscapeNewLinesToHtmlExpression.Replace(text, "<BR>");
        }
        
        // ***
        // Numeric Validator Methods
        //
        
        // Parses valid ansi numbers
        public static bool IsValidAnsiNumber(string number)
        {
            return AnsiNumericExpression.IsMatch(number);
        }
        
        // Parses 5 digit zip codes
        public static bool IsValidFiveDigitZipCode(string zip)
        {
            return AnsiBasicZipCodeExpression.IsMatch(zip);
        }

        // Parses 9 digit zip codes
        public static bool IsValidNineDigitZipCode(string zip)
        {
            return AnsiExtendedZipCodeExpression.IsMatch(zip);
        }
        
        // Attempts to parse the number based on the current
        // locale.  This can be used for international support.
        public static bool IsParseableNumber(string number)
        {
            try
            {
                Int32.Parse(number);
                return true;
            }
            catch
            {
            }
            
            return false;
        }

        // ***
        // String Data Validators
        //
        
        // Processes a name value
        public static bool IsValidAnsiName(string name)
        {
            return AnsiNameExpression.IsMatch(name);
        }
        
        // Processes phone number values
        public static bool IsValidAnsiPhoneNumber(string name)
        {
            return AnsiPhoneExpression.IsMatch(name);
        }
        
        // Processes address values
        public static bool IsValidAnsiAddress(string address)
        {
            return AnsiAddressExpression.IsMatch(address);
        }
        
        // Processes two character state strings
        public static bool IsValidAnsiTwoCharacterState(string state)
        {
            return AnsiTwoCharacterStateExpression.IsMatch(state);
        }
        
        // Processes city or state strings
        public static bool IsValidAnsiCityOrState(string citystate)
        {
            return AnsiCityStateExpression.IsMatch(citystate);
        }
        
        // Processes safe text
        public static bool IsSafeText(string text)
        {
            return SafeTextExpression.Matches(text).Count == 0;
        }
    }
}