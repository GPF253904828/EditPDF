//
//  TFSReportEngineTextField.h
//  XMLBooks
//
//  Created by mark on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFSReportEngineStaticText.h"
#import "TFSReportEngineBox.h"

@interface SQSTextObject : TFSReportEngineElement
{
	NSString * text;
	int textHeight;
}

@property (nonatomic,retain)NSString * text;
@property (nonatomic)	int textHeight;
@end

@interface TFSReportEngineTextField : TFSReportEngineStaticText
{
	NSMutableArray *textFieldExpression;
	NSString *evaluationTime;
	BOOL blankWhenNull;
	NSString *parsedText;
	BOOL stretchWithOverflow;
	BOOL parsed;
	NSString *pattern;
	NSString *variableText;
}

@property (nonatomic, retain) NSMutableArray *textFieldExpression;
@property (nonatomic, retain) NSString *evaluationTime;
@property (nonatomic) BOOL blankWhenNull;
@property (nonatomic, retain) NSString *parsedText;
@property (nonatomic) BOOL stretchWithOverflow;
@property (nonatomic) BOOL parsed;
@property (nonatomic, retain) NSString *pattern;
@property (nonatomic, retain) NSString *variableText;

- (void) parseXML:(TBXMLElement *)element parameters:(NSDictionary*)tempParameter;
- (id) copyWithZone:(NSZone *)zone;
- (void) parseText:(NSDictionary *)parameters data:(NSDictionary *)data variables:(NSDictionary *)variables;
-(void) calculateExtraHeight;

@end

