//
//  TFSReportEngineBand
//  XMLBooks
//
//  Created by mark on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"
#import "hpdf.h"
#import "hpdf_types.h"

#import "TFSReportEngineElement.h"
#import "TFSReportEngineImage.h"
#import "TFSReportEngineReport.h"

@interface TFSReportEngineBand : TFSReportEngineElement
{
	NSString *splitType;
	NSMutableArray *elements;
    NSString *name;

	TFSReportEngineReport *questionnaireReport;
	TFSReportEngineReport *planReport;
	TFSReportEngineReport *paymentReport;
	TFSReportEngineReport *historyReport;

	NSMutableArray *styles;
	
	BOOL calculated;
	double calculatedBandHeight;
    NSString *printWhenExpressionString;
    
    int oriHeight;
    
    NSString *footerPosition;
}

@property (nonatomic, retain) NSString *splitType;
@property (nonatomic, retain) NSMutableArray *elements;
@property (nonatomic, readonly) NSArray *sortedElements;
@property (nonatomic, readonly) NSArray *reverseSortedElements;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) TFSReportEngineReport *questionnaireReport;
@property (nonatomic, retain) TFSReportEngineReport *planReport;
@property (nonatomic, retain) TFSReportEngineReport *paymentReport;
@property (nonatomic, retain) TFSReportEngineReport *historyReport;
@property (nonatomic, retain) NSMutableArray *styles;
@property (nonatomic) BOOL calculated;
@property (nonatomic) double calculatedBandHeight;
@property (nonatomic, retain) NSString *printWhenExpressionString;
@property (nonatomic) int oriHeight;
@property (nonatomic, retain) NSString *footerPosition;
- (TFSReportEngineReport *) parseSubReport:(TBXMLElement *)element parameter:(NSDictionary *)tempParameter datasource:(NSMutableArray *)datasource variables:(NSDictionary *)variables;
- (TFSReportEngineReport *)parseMultipleSubReport:(TBXMLElement *)element parameter:(NSDictionary *)tempParameter datasource:(NSMutableArray *)datasource variables:(NSMutableDictionary *)variables;
- (void) draw:(TFSReportEnginePage *)page size:(int)size;
- (void) parseXML:(TBXMLElement *)element parameter:(NSDictionary *)tempParameter datasource:(NSMutableArray *)datasource variables:(NSDictionary *)variables;
- (id) copyWithZone:(NSZone *)zone;

@end
