The Weyv Streaming Server Setup document explains the Streaming Setup and the Prerequisites to Wowza Server Setup on EC2.

Wowza Media Server 3.5 is a high-performance streaming media server for delivering content to the following player technologies and devices:

Adobe® HTTP Dynamic Streaming (HDS). Adobe Flash® Player
Microsoft® Smooth Streaming. Microsoft Silverlight®
Apple® HTTP Live Streaming (HLS). iPhone®, iPad®, iPod touch®, Safari® browser, QuickTime® Player
Real Time Streaming Protocol (RTSP/RTP). QuickTime Player, VLC media player, and many mobile devices
MPEG-2 Transport Streams (MPEG-TS). Set-top boxes and IPTV solutions

Wowza Media Server 3.5 includes the following AddOn features:

Wowza Transcoder AddOn
Wowza nDVR AddOn
Wowza DRM AddOn

For more information about these features and to get the Wowza Media Server 3.5 User's Guide, see the
Wowza Media Server 3.5 Documentation.

For more up-to-date information, see the Wowza Media Systems Articles and Forums.

Wowza Media Server also provides some great examples to help you get started. After the server is installed, the examples are located at [install-dir]/examples. For more information about how to install and use the examples, see the [install-dir]/examples/README.html file.

This guide refers to third party software that is not licensed, sold, distributed, or otherwise endorsed by Wowza®. You must ensure that any and all use of Wowza software and third party software is properly licensed.

This article and other Wowza Media Server documentation refers to [install-dir] as the folder to which Wowza Media Server is installed. The installation folder differs based on platform:

Windows: %PROGRAMFILES%\Wowza Media Systems\Wowza Media Server [version]
Mac OSX: /Library/WowzaMediaServer
Linux/Unix: /usr/local/WowzaMediaServer

To get free support, either visit the Wowza Media Server Forums or send email to support@wowza.com. When emailing support@wowza.com, be sure to provide the following information:

Wowza Media Server version and build number
Platform, operating system, and Java version on which Wowza Media Server is running
Detailed problem description that includes:
URL of tutorial or instructions being used
Player technology being used (Adobe Flash, Microsoft Silverlight, iOS device, set-top box, etc.)
Live encoder/IP camera manufacturer/version and exact encoding settings (live streaming only) streaming only)
We also recommend that you send [install-dir]/logs, [install-dir]/conf, and [install-dir]/transcoder folders in a compressed (zipped) folder. See How to create a compressed zip file in Windows, Mac OS and Linux.

Instructions for installing Wowza Media Server, Starting/Stopping the server, Verification are given.

How to Mount S3 to EC2, the prerequisites and intructions regarding installation of s3fs are also given.

Application Configuration using Wowza Media Server is explained.

To begin using Wowza Media Server 3.5, first create an application. An application is defined simply by creating a folder in the [install-dir]/applications folder. 