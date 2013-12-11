//
//  MainViewController.m
//  Base64 Utility
//
//  Created by Josh Barrow on 3/8/12.
//  Copyright (c) 2012 Jukaela Enterprises. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

@synthesize decodeTextView;
@synthesize encodeTextView;
@synthesize decodeButton;
@synthesize encodeButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    
    return self;
}

-(void)awakeFromNib
{
    [(NSNotificationCenter *)[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetTextViews:) name:@"reset_text_views" object:nil];
}

-(void)resetTextViews:(NSNotification *)aNotification
{
    [[self decodeTextView] setString:[NSString string]];
    [[self encodeTextView] setString:[NSString string]];
}

-(IBAction)decodeTextAction:(id)sender
{
    [self decodeText:[[[self decodeTextView] textStorage] string]];
}

-(void)decodeText:(NSString *)textToDecode
{
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:textToDecode options:0];
    
    [self showSavePanel:decodedData];
}

-(void)showSavePanel:(NSData *)decodedData
{
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    
    [savePanel setDirectoryURL:nil];
    [savePanel setNameFieldStringValue:@"Untitled"];
    
    [savePanel beginSheetModalForWindow:[[self view] window]
                      completionHandler:^(NSInteger returnCode) {
                          NSURL *directoryToSaveAt = [savePanel directoryURL];
                          NSURL *userEnteredStringToSave = [NSURL URLWithString:[savePanel nameFieldStringValue]];
                          
                          NSURL *combinedURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", directoryToSaveAt, userEnteredStringToSave]];
                          
                          [self saveOutcome:decodedData atLocation:combinedURL];
                          
                          [savePanel orderOut:self];
                      }];
}

-(void)saveOutcome:(NSData *)decodedData atLocation:(NSURL *)location
{
    NSError *error = nil;
    
    [decodedData writeToURL:location options:NSDataWritingAtomic error:&error];
    
    if (error) {
        NSLog(@"Write returned error: %@", [error localizedDescription]);
        
        NSAlert *failureAlert = [[NSAlert alloc] init];
        
        [failureAlert addButtonWithTitle:@"Ok"];
        [failureAlert setMessageText:@"Failure"];
        [failureAlert setInformativeText:@"There was an error writing the data to the disk."];
        [failureAlert setAlertStyle:NSCriticalAlertStyle];
        
        [failureAlert beginSheetModalForWindow:[[self view] window] modalDelegate:self didEndSelector:nil contextInfo:nil];
    }
}

-(IBAction)chooseFileToEncode:(id)sender
{
    NSOpenPanel *openFileDialog = [NSOpenPanel openPanel];
    
    [openFileDialog setCanChooseFiles:YES];
    [openFileDialog setCanChooseDirectories:NO];
    [openFileDialog setAllowsMultipleSelection:NO];
    
    [openFileDialog beginSheetModalForWindow:[[self view] window] completionHandler:^(NSInteger returnCode) {
        if (returnCode == NSFileHandlingPanelOKButton) {
            NSString *tempString = [[NSData dataWithContentsOfURL:[openFileDialog URL]] base64EncodedStringWithOptions:0];
            
            [[self encodeTextView] setString:tempString];
            
            NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
            
            [pasteboard declareTypes:@[NSStringPboardType] owner:nil];
            [pasteboard setString:tempString forType:NSStringPboardType];
        }
    }];
}

-(void)textDidChange:(NSNotification *)notification
{
    if ([notification object] == [self decodeTextView]) {
        if ([[[self decodeTextView] string] length] > 0) {
            [[self decodeButton] setEnabled:YES];
        }
        else {
            [[self decodeButton] setEnabled:NO];
        }
    }
}
@end
