Motivation
===========================
Ableton Live is nice software, but when Live is running in background and another application(like Safari) is foreground, it hides all AU/VST plugin windows.
This behaviour is sometimes annoying.I always want to see Spectrum Analyzer or any Plugins.
This simple SIMBL plugin works with Live, and avoids hiding of any AU/VST windows .

Build from source
===========================
Use XCode3.x to build

Install
===========================
1.At first you need SIMBL installed. SIMBL:http://www.culater.net/software/SIMBL/SIMBL.php
2.copy "AlwaysDisplayPlugins.bundle" to ~/Library/Application Support/SIMBL/Plugins
 If SIMBL/Plugins folder not found, please make the folder(s), then copy "AlwaysDisplayPlugins.bundle"
3.relaunch Ableton Live

UnInstall
===========================
1.Remove ~/Library/Application Support/SIMBL/Plugins/AlwaysDisplayPlugins.bundle
2.relaunch Ableton Live

Requirements
===========================
1.MaxOSX 10.6.x (it would work 10.5.x, but not tested)
2.Ableton Live
3.SIMBL : 

How it works
===========================
AlwaysDisplayPlugins loaded with Ableton Live, and watching new AU/VST Plugin window for every 3 seconds.
If new AU/VST plugin window found, change windows attribute to "not hide when deactive".
So AU/VST plugin windows never hidden even if another application(like safari) is forground.

