//
//  MainWindowController.h
//  Base64 Utility
//
//  Created by Josh Barrow on 3/8/12.
//  Copyright (c) 2012 Jukaela Enterprises. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindowController : NSWindowController

@property (strong, nonatomic) IBOutlet NSView *mainView;
@property (strong, nonatomic) NSViewController *currentViewController;

@end
