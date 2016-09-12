//
//  SQSTFSJasperGroup.h
//  XMLBooks
//
//  Created by mark on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFSReportEngineBand.h"
#import "TFSReportEngineElement.h"
#import "TFSReportEngineSubreport.h"

@interface TFSReportEngineGroup : TFSReportEngineElement
{
	NSMutableArray *groupHeaderBands;
	NSMutableArray *groupFooterBands;
	int minHeight;
	NSString *name;
	TFSReportEngineReport *questionnaireReport;
	TFSReportEngineReport *planReport;
	TFSReportEngineReport *paymentReport;
	TFSReportEngineReport *historyReport;
	NSMutableArray *styles;
    NSString *footerPosition;
}

@property (nonatomic) int minHeight;
@property (nonatomic, retain) NSMutableArray *groupHeaderBands;
@property (nonatomic, retain) NSMutableArray *groupFooterBands;
@property (nonatomic, readonly) TFSReportEngineBand *firstBand;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) TFSReportEngineReport *questionnaireReport;
@property (nonatomic, retain) TFSReportEngineReport *planReport;
@property (nonatomic, retain) TFSReportEngineReport *paymentReport;
@property (nonatomic, retain) TFSReportEngineReport *historyReport;
@property (nonatomic, retain) NSMutableArray *styles;
@property (nonatomic, retain) NSString *footerPosition;

-(void) parseElement:(TBXMLElement*) element parameter:(NSDictionary *)parameter datasource:(NSMutableArray *)datasource variables:(NSDictionary *)variables;
-(void)draw:(TFSReportEnginePage *)page size:(int)size;
@end
