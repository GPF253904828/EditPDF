//
//  TFSReportEngineVariable.h
// TFSReportEngine_IOS
//
//  Created by adrian on 5/15/12.
//  Copyright (c) 2012 TF System Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"
#import "TFSReportEngineElement.h"

@interface TFSReportEngineVariable : TFSReportEngineElement
{
	NSString *variableName;
	NSString *clazz;
	NSString *variableExpression;
	NSString *value;
	BOOL isParsed;
    NSString *initialValueExpression;
    NSString *calculation;
}

@property (nonatomic, retain) NSString *variableName;
@property (nonatomic, retain) NSString *clazz;
@property (nonatomic, retain) NSString *variableExpression;
@property (nonatomic, retain) NSString *value;
@property (nonatomic) BOOL isParsed;
@property (nonatomic, retain) NSString *initialValueExpression;
@property (nonatomic, retain) NSString *calculation;

@end
