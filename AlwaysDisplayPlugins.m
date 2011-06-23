//
//  AlwaysDisplayPlugins.m
//  AlwaysDisplayPlugins
//
//  Created by koji on 11/05/18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <Cocoa/Cocoa.h>
#import "AlwaysDisplayPlugins.h"

#include <Carbon/Carbon.h>
#include <MacTypes.h>
#include <MacWindows.h>

@interface NSCarbonWindow : NSWindow
@end

//////////////
//our main SIMBLE plugin class.
////////////
@implementation AlwaysDisplayPlugins

-(void)ontimer:(NSTimer *)timer
{	
	
	NSArray *windows = [[NSApplication sharedApplication] windows];
	for (id window in windows){
		
		/*
		  Ableton live create instance of NSCarbonWindow class for some vst/au plugin window. 
		  so, we should firat find NSCarbonWindow, and remove the "Window Hide On Suspend" attribute
		  ("suspend" means another application is active)
		*/
				
		if ([window isKindOfClass:[NSCarbonWindow class]]){
			HIWindowRef winRef = [window windowRef];
			if (HIWindowTestAttribute(winRef, kHIWindowBitHideOnSuspend)){
				NSLog(@"AlwaysDisplayPlugins:find new plugin window:\"%@\"", [window title]);
				
				OSStatus err = noErr;
				
				/*experimental change to "normal" window, not "floating" window */
				
				err = HIWindowChangeClass(winRef,    kDocumentWindowClass);
				if (err != noErr){
					NSLog(@"failed to change Window class err=%d", err);
				}
				//another experimental. add zoom, resize functional to vst/au windows.
				{
					
					int setAttr[] = {kHIWindowBitCollapseBox, kHIWindowBitInWindowMenu,kHIWindowBitStandardHandler,0};
					err = HIWindowChangeAttributes(winRef, setAttr, NULL);
					if (err != noErr){
						NSLog(@"AlwaysDisplayPlugins:failed to change attribute [kWindowHideOnSuspendAttribute].err=%d", err);
					}				
				}
				{	//no mean??
					int removeAttr[] = {35,0};	//kHIWindowBitDoesNotShowBadgeInDock
					err = HIWindowChangeAttributes(winRef,NULL, removeAttr);
					if (err != noErr){
						NSLog(@"failed to remove some attributes from window, err=%d", err);
					}
				}
				
				int clearAttr[] = {kHIWindowBitHideOnSuspend, 0};
				err = HIWindowChangeAttributes(winRef, NULL, clearAttr);
				if (err != noErr){
					NSLog(@"AlwaysDisplayPlugins:failed to remove [kWindowHideOnSuspendAttribute].err=%d", err);
				}else{
					NSLog(@"AlwaysDisplayPlugins:now plugin window:\"%@\" does not hide on deactivate of Live", [window title]);
				}
				

								
			}
			
			
		}else if ([window isKindOfClass:[NSPanel class]]){
			/* for AU windows (ex, AUNetReceive provided by apple)
			 
			*/
			if (3 != [window styleMask]){
				[window setStyleMask:3];
				[window setHidesOnDeactivate:NO];
			}
		}
	}
}

+(void)load
{
	NSLog(@"AlwaysDisplayPlugins: loaded.ww");
	
	AlwaysDisplayPlugins *thisPlugin = [AlwaysDisplayPlugins sharedInstance];
	NSTimer *timer = [NSTimer timerWithTimeInterval:1.0f
											 target:thisPlugin
										   selector: @selector(ontimer:)
										   userInfo:nil
											repeats:true];
	[[NSRunLoop currentRunLoop] addTimer: timer forMode:NSDefaultRunLoopMode];
}

+(AlwaysDisplayPlugins *)sharedInstance
{
	static AlwaysDisplayPlugins *plugin = nil;
	if (plugin == nil)
		plugin = [[AlwaysDisplayPlugins alloc] init];
	
	return plugin;
}

@end
