//
//  TFSReportEnginePen.h
//  XMLBooks
//
//  Created by mark on 9/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"
#import "TFSReportEngineElement.h"

@interface TFSReportEnginePen : TFSReportEngineElement
{
	double lineWidth;
    UIColor *lineColor;
	NSString *lineStyle;
}

@property double lineWidth;
@property (nonatomic, retain) UIColor *lineColor;
@property (nonatomic, retain) NSString *lineStyle;

- (void) parseXML:(TBXMLElement *)element parameters:(NSDictionary *)parameters;
- (id) copyWithZone:(NSZone *)zone;

@end
