//
//  MainWindowController.m
//  Base64 Utility
//
//  Created by Josh Barrow on 3/8/12.
//  Copyright (c) 2012 Jukaela Enterprises. All rights reserved.
//

#import "MainWindowController.h"
#import "MainViewController.h"

@implementation MainWindowController

@synthesize mainView;
@synthesize currentViewController;

-(void)awakeFromNib
{
    MainViewController *viewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    
    if (viewController) {
        [self setCurrentViewController:viewController];
        [[self currentViewController] setTitle:@"Main"];
    }
    
    [[self mainView] addSubview:[[self currentViewController] view]];
    
    [[[self currentViewController] view] setFrame:[[self mainView] bounds]];
    
    [super awakeFromNib];
}

@end
