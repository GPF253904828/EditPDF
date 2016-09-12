//
//  SQSTFSJasperExpressionParser.h
// TFSReportEngine_IOS
//
//  Created by adrian on 1/11/12.
//  Copyright 2012 TF System Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFSReportEngineExpressionParser : NSObject
{
	NSMutableArray *tokens;
	NSString *expression;
	NSDictionary *parameters;
	NSDictionary *data;
    NSDictionary *variables;
	NSString *pattern;
    BOOL sum;
    BOOL isDecimalFormatter2;
}

@property (nonatomic, retain) NSMutableArray *tokens;
@property (nonatomic, retain) NSString *expression;
@property (nonatomic, retain) NSDictionary *parameters;
@property (nonatomic, retain) NSDictionary *data;
@property (nonatomic, retain) NSDictionary *variables;
@property (nonatomic, retain) NSString *pattern;
@property (nonatomic, assign) BOOL sum;

- (id)initWithExpression:(NSString *)expression_ parameters:(NSDictionary *)parameters_ data:(NSDictionary *)data_ variables:(NSDictionary *)variables_;
- (void) evaluate;
- (BOOL) isResultNumber;
- (NSString *) getResultInString;
- (id) getResultInStringWithQuotes;
- (BOOL) getResultInBool;
- (CGFloat) getResultInFloat;
- (double) getResultInDouble;

+ (void) testTFSJasperExpressionParser;
+ (void) debug:(BOOL)d;

@end
