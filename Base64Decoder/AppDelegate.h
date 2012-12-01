//
//  Base64DecoderAppDelegate.h
//  Base64Decoder
//
//  Created by Josh Barrow on 6/7/11.
//  Copyright 2011 Jukaela Enterprises. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MainWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate> 

@property (unsafe_unretained) IBOutlet NSWindow *window;
@property (strong, nonatomic) MainWindowController *mainWindowController;

-(IBAction)resetTextViews:(id)sender;
@end
