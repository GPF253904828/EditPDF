//
//  SQSTFSJasperHtmlTextParser.h
// TFSReportEngine_IOS
//
//  Created by adrian on 4/21/12.
//  Copyright (c) 2012 TF System Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TFSReportEngineStyle;

@interface TFSReportEngineHtmlTextParser : NSObject
{
	NSString *htmlText;
	NSMutableArray *htmlTexts;
	int location;
	int location2;
	BOOL bold;
	BOOL underline;
    BOOL italic;
	BOOL superscript;
	int indexOfTag;
	BOOL subscript;
}

@property (nonatomic, retain) NSString *htmlText;
@property (nonatomic, retain) NSMutableArray *htmlTexts;

+ (void) testTFSJasperHtmlTextParser;

- (id) initWithHtmlText:(NSString *)text;
- (void) parse;
- (void) addStyle:(NSString *)tag;

@end
