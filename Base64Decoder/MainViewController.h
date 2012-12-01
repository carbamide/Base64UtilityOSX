//
//  MainViewController.h
//  Base64 Utility
//
//  Created by Josh Barrow on 3/8/12.
//  Copyright (c) 2012 Jukaela Enterprises. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainViewController : NSViewController <NSTextViewDelegate>

@property (nonatomic) IBOutlet NSTextView *decodeTextView;
@property (nonatomic) IBOutlet NSTextView *encodeTextView;

@property (nonatomic) IBOutlet NSButton *decodeButton;
@property (nonatomic) IBOutlet NSButton *encodeButton;

-(IBAction)decodeTextAction:(id)sender;
-(IBAction)chooseFileToEncode:(id)sender;

-(void)decodeText:(NSString *)textToDecode;
-(void)showSavePanel:(NSData *)decodedData;
-(void)saveOutcome:(NSData *)decodedData atLocation:(NSURL *)location;
-(void)resetTextViews:(NSNotification *)aNotification;

@end
