//
//  TFSReportEngineStyle.h
// TFSReportEngine_IOS
//
//  Created by Kok Chin Chan on 2/12/12.
//  Copyright (c) 2012 TF System Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFSReportEngineStyle : NSObject
{
	NSString *name;
	NSString *text;
	NSString *forecolor;
	NSString *backcolor;
	NSString *markup;
	NSString *pattern;
	BOOL isBlankWhenNull;
	NSString *fontName;
	int fontSize;
	BOOL isBold;
	BOOL isItalic;
	BOOL isUnderline;
	BOOL isStrikeThrough;
	BOOL isSuperscript;
	BOOL isSubscript;
	double width;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *forecolor;
@property (nonatomic, retain) NSString *backcolor;
@property (nonatomic, retain) NSString *markup;
@property (nonatomic, retain) NSString *pattern;
@property (nonatomic) BOOL isBlankWhenNull;
@property (nonatomic, retain) NSString *fontName;
@property (nonatomic) int fontSize;
@property (nonatomic) BOOL isBold;
@property (nonatomic) BOOL isItalic;
@property (nonatomic) BOOL isUnderline;
@property (nonatomic) BOOL isStrikeThrough;
@property (nonatomic) BOOL isSuperscript;
@property (nonatomic) BOOL isSubscript;
@property (nonatomic) double width;

@end
