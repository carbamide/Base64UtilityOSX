//
//  Base64.h
//  Base64Decoder
//
//  Created by Josh Barrow on 3/6/12.
//  Copyright (c) 2012 Jukaela Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base64 : NSObject {
    
}

+(void)initialize;

+(NSString*)encode:(const unsigned char*)input length:(NSInteger)length;
+(NSString*)encode:(NSData*) rawBytes;

+(NSData*)decode:(const char*)string length:(NSInteger)inputLength;
+(NSData*)decode:(NSString*)string;

@end
