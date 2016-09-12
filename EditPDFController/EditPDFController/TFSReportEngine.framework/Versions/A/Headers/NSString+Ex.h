//
//  TFString.h
//  TfsCore
//
//  Created by CKC on 7/23/10.
//  Copyright 2010 TF System Sdn. Bhd.. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JavaMethod)

- (NSInteger) indexOf:(NSString *) format;
- (NSInteger) indexOf:(NSString *) format fromIndex: (NSUInteger)fromIndex;
- (NSInteger) lastIndexOf:(NSString *) format;
- (NSInteger) lastIndexOf:(NSString *) format fromIndex: (NSUInteger)fromIndex;

- (NSString *) subString:(NSUInteger) fromIndex toIndex:(NSUInteger) toIndex;

- (BOOL) contains:(NSString *)str;

- (BOOL) equalsIgnoreCase:(NSString *) str;

- (NSString *) trim;
- (NSString *) replace:(NSString *) find replaceWith: (NSString *)replace;

- (BOOL) startsWith:(NSString *) format;
- (BOOL) endsWith:(NSString *) format;

- (NSString *)toUpperCase;
- (NSString *)toLowerCase;

-(NSString *) reverseString;

@end
