//
//  TFSReportEngineParameter.h
// TFSReportEngine_IOS
//
//  Created by adrian on 5/15/12.
//  Copyright (c) 2012 TF System Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"
#import "TFSReportEngineElement.h"

@interface TFSReportEngineParameter : TFSReportEngineElement
{
	NSString *parameterName;
	NSString *clazz;
	NSString *defaultValueExpression;
	NSString *value;
	BOOL isParsed;
}

@property (nonatomic, retain) NSString *parameterName;
@property (nonatomic, retain) NSString *clazz;
@property (nonatomic, retain) NSString *defaultValueExpression;
@property (nonatomic, retain) NSString *value;
@property (nonatomic) BOOL isParsed;

- (void) parseXML:(TBXMLElement *)element;

@end
