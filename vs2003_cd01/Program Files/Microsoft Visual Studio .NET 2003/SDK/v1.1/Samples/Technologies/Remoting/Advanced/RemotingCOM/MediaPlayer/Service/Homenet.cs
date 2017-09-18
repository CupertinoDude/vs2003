/*=====================================================================

  File:      Homenet.cs

---------------------------------------------------------------------
This file is part of the Microsoft .NET Framework SDK Code Samples.

  Copyright (C) Microsoft Corporation.  All rights reserved.

This source code is intended only as a supplement to Microsoft
Development Tools and/or on-line documentation.  See these other
materials for detailed information regarding Microsoft code samples.
 
THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.
=====================================================================*/

using System;
using System.Text;
using System.Runtime.InteropServices;
using MediaPlayer;

namespace Homenet
{
    public delegate bool StatusUpdateCallback(String title);

    public class VCR : MarshalByRefObject
    {
        public VCR()
        {
            Console.WriteLine("VCR Constructor");
        }

        MediaRequest _mediaRequest = null;

        public bool PlaySimple() 
        {
            Console.WriteLine("Play");

            try 
            {
                if (null != mediaPlayer)
                {
                    mediaPlayer.Play();
                    return true;
                }
            }
            catch (COMException) 
            { 
                // do nothing, the player was probably closed or not started yet
            }


            return false;
        }

        public bool Play(String title) 
        { 
            Console.WriteLine("Play: {0}", title);
            mediaPlayer = null;

            if (null == mediaPlayer)
            {
                StartMediaPlayer();
            }

            if (null != mediaPlayer)
            {
                mediaPlayer.FileName = title;
                mediaPlayer.AutoRewind = true;
                mediaPlayer.AutoStart = false;
                mediaPlayer.Play();

                Console.WriteLine("VCR Playing " + title);
            }

            Console.WriteLine("VCR Playing " + title);

            return true;
        }

        public bool PlayWithStatus(String title, BaseRemoteControl mediaStatus)
        {
            Play(title);
            mediaStatus.StatusUpdate("Playing: " + title);
            return true;
        }

        public bool PlayWithStatus(String title, IMediaStatus mediaStatus)
        {
            Play(title);
            mediaStatus.StatusUpdate("Playing: " + title);
            return true;
        }

        public bool PlayWithStatus(MediaRequest mediaRequest)
        {
            _mediaRequest = mediaRequest;
            Console.WriteLine("PlayWithStatus: MBV with embedded MBR");

            if ((null != mediaRequest) && (null != mediaRequest._mediaStatus))
                return PlayWithStatus(mediaRequest._title, mediaRequest._mediaStatus);
            else

                return true;
        }

        public bool PlayWithStatus(String title, StatusUpdateCallback callback)
        {
            Play(title);

            Console.WriteLine("PlayWithStatus: Delegate with MBR");

            if (null != callback)
                return callback(title);
            else
                return true;
        }

        public bool Pause() 
        { 
            Console.WriteLine("Pause");

            try
            {
                if (null != mediaPlayer)
                {
                    mediaPlayer.Pause();
                }
            }
            catch (COMException) 
            { 
                // do nothing, the player was probably closed or not started yet
            }
            return true;
        }

        public bool Stop() 
        { 
            Console.WriteLine("Stop");
          
            try
            {
                if (null != mediaPlayer)
                {
                    mediaPlayer.Stop();
                    mediaPlayer.CurrentPosition = 0;
                }
            }
            catch (COMException) 
            { 
                // do nothing, the player was probably closed or not started yet
            }

            return true;
        }

        // MediaPlayer
        private static Guid MediaPlayerCLSID = new Guid("22D6F312-B0F6-11D0-94AB-0080C74C7E95");
        private static Guid IID_MediaPlayer2 = new Guid("20D4F5E0-5475-11D2-9774-0000F80855E6");
        private static IMediaPlayer2 mediaPlayer = null;

        private void StartMediaPlayer()
        {
            IMediaPlayer2[] mediaPlayerArray = new IMediaPlayer2[1];

            CoCreateInstance(
                            ref MediaPlayerCLSID, 
                            null, 
                            CLSCTX_LOCAL_SERVER, 
                            ref IID_MediaPlayer2, 
                            mediaPlayerArray);

            if (mediaPlayerArray[0] != null)
            {
                mediaPlayer = mediaPlayerArray[0];
            }
        }


        private const int CLSCTX_LOCAL_SERVER     = 4;

        [DllImport("Ole32.dll"), PreserveSig]
        private static extern void CoCreateInstance(
                                                   [In]
                                                   ref Guid clsid,
                                                   [MarshalAs(UnmanagedType.Interface)]
                                                   object punkOuter,
                                                   [MarshalAs(UnmanagedType.I4)]
                                                   int context,
                                                   [In]
                                                   ref Guid iid,
                                                   [In, Out, MarshalAs(UnmanagedType.LPArray)]
                                                   IMediaPlayer2[] unknown);

        [DllImport("shell32.dll", CharSet = CharSet.Auto)]
        private static extern IntPtr ShellExecute(IntPtr hwnd, String lpVerb, String lpFile, String lpParameters, String lpDirectory, int nShowCmd);
    }

    public interface IMediaStatus
    {
        bool StatusUpdate(String status);
    }

    public class BaseRemoteControl : MarshalByRefObject
    {
        public virtual bool StatusUpdate(String title)
        {
            return true;
        }
    }

    [Serializable]
    public class MediaRequest
    {
        public MediaRequest(String title, BaseRemoteControl mediaStatus)
        {
            _title = title;
            _mediaStatus = mediaStatus;
        }

        public String _title;
        //public IMediaStatus _mediaStatus;
        public BaseRemoteControl _mediaStatus;
    }

}

