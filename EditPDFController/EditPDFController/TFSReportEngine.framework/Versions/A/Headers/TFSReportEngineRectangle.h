//
//  TFSReportEngineRectangle.h
//  XMLBooks
//
//  Created by mark on 9/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFSReportEngineElement.h"

@interface TFSReportEngineRectangle : TFSReportEngineElement
{
	int lineWidth;
	UIColor *lineColor;
    double rectRadius;

}

@property (nonatomic) int lineWidth;
@property (nonatomic, retain) UIColor *lineColor;
@property double rectRadius;

-(void) parseXML:(TBXMLElement *)element parameters:(NSDictionary *)parameters;
- (void) drawRoundedRectangle:(HPDF_Page)hpdf_page;
@end
