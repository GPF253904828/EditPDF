//
//  TFSReportEngineSubreport.h
//  XMLBooks
//
//  Created by mark on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFSReportEngineReport.h"

@interface TFSReportEngineSubreport : TFSReportEngineReport
{
	//NSDictionary *parameters;
	NSString *subreportExpression;
	NSString *inputClass;
}

//@property (nonatomic,retain) NSDictionary *parameters;
@property (nonatomic,retain) NSString *subreportExpression;
@property (nonatomic,retain) NSString *inputClass;

//-(void) parseElementGroup:(TBXMLElement*)element;
//-(void) ParseElement:(TBXMLElement *) element;
//-(void) parseXML:(TBXMLElement *)element;
@end

