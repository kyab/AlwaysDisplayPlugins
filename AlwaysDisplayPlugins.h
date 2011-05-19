//
//  AlwaysDisplayPlugins.h
//  AlwaysDisplayPlugins
//
//  Created by koji on 11/05/18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AlwaysDisplayPlugins : NSObject {

}
-(void)ontimer:(NSTimer *)timer;
+(void)load;
+(AlwaysDisplayPlugins *)sharedInstance;
@end
