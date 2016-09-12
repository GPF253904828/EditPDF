//
//  TFSReportEngineStyleTextParser.h
// TFSReportEngine_IOS
//
//  Created by Kok Chin Chan on 2/12/12.
//  Copyright (c) 2012 TF System Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TFSReportEngineStyle;

@interface TFSReportEngineStyleTextParser : NSObject
{
	NSString *styleText;
	NSMutableArray *styleTexts;
}

@property (nonatomic, retain) NSString *styleText;
@property (nonatomic, retain) NSMutableArray *styleTexts;

+ (void) testTFSJasperStyleTextParser;

- (id) initWithStyleText:(NSString *)text;
- (void) parse;

@end
