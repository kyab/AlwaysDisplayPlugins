Motivation
===========================
Ableton Live is nice software, but when Live is running in background and another application(like Safari) is foreground, it hides all AU/VST plugin windows.
This behaviour is sometimes annoying. I always want to see spectrum analyzer or any plugin windows.
This simple SIMBL plugin works with Live, and avoids hiding of any AU/VST plugin windows.

Download binary
===========================
Download from here:

[AlwaysDisplayPlugins.bundle](https://code.google.com/p/awalys-display-plugins/downloads/detail?name=AlwaysDisplayPlugins.bundle1.1.zip&can=2&q=#makechanges)

Build from source(If you like)
===========================
Use XCode4.x to build

Install
===========================
1.At first you need SIMBL installed. SIMBL:http://www.culater.net/software/SIMBL/SIMBL.php

2.Copy "AlwaysDisplayPlugins.bundle" to ~/Library/Application Support/SIMBL/Plugins. 
 If SIMBL/Plugins folder is not found, please make the folder(s), then copy "AlwaysDisplayPlugins.bundle"

3.Relaunch Ableton Live

Uninstall
===========================
1.Remove AlwaysDisplayPlugins.bundle from  ~/Library/Application Support/SIMBL/Plugins/

2.Relaunch Ableton Live

Requirements
===========================
1.MaxOSX 10.8.x (it would work with 10.7.x or earlier, but not tested)

2.Ableton Live8 or later

3.SIMBL : http://www.culater.net/software/SIMBL/SIMBL.php

How it works
===========================
AlwaysDisplayPlugins will be loaded with Ableton Live, and watching new AU/VST Plugin window for every 1 seconds.
If new AU/VST plugin window is found, change windows attribute to "not hide when deactive".
So AU/VST plugin windows never hide even if another application becomes forground.


