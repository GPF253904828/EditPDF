//
//  TFSReportEngineReport.h
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

@class TFSReportEngineBand;
@class TFSReportEngineGroup;
@class TFSReportEngineDetailBand;


@interface TFSReportEngineReport : TFSReportEngineElement
{
    NSString *path;

	NSDictionary *parameters;
	NSDictionary *newParams;
	double subPageHeight;
	TFSReportEngineBand *title;
	TFSReportEngineBand *columnHeader;
	NSMutableArray *detailBands;
	TFSReportEngineBand *columnFooter;
	TFSReportEngineBand *pageHeader;
	TFSReportEngineBand *pageFooter;
	TFSReportEngineBand *summary;
	TFSReportEngineBand *lastPageFooter;
	TFSReportEngineBand *background;
	NSMutableArray *groups;
	BOOL runToBottom;
	NSMutableArray *datasource;
    NSMutableDictionary *variables;

	int pageWidth;
	int pageHeight;
	int leftMargin;
	int rightMargin;
	int topMargin;
	int bottomMargin;
	int start_y;
	int end_y;
	BOOL printTitle;
	int parent_title_height;
	int group_y;
	int no_of_pages;

	TFSReportEngineReport *questionnaireReport;
	TFSReportEngineReport *planReport;
	TFSReportEngineReport *paymentReport;
	TFSReportEngineReport *historyReport;

	NSMutableArray *parametersFromXml;
	NSMutableArray *variablesFromXml;

	NSMutableArray *styles;
	NSMutableArray *returnValues;
	NSMutableDictionary *parentVariables;
    NSString *dataSourceExpression;

    int detailHeight;
    BOOL detailHeightCalculated;
	
	NSMutableArray *reports;
}
@property (nonatomic, retain) NSString *path;

@property (nonatomic, retain) NSDictionary *parameters;
@property (nonatomic, retain) NSDictionary *newParams;

@property (nonatomic, retain) TFSReportEngineBand *title;
@property (nonatomic, retain) TFSReportEngineBand *pageHeader;
@property (nonatomic, retain) TFSReportEngineBand *columnHeader;
@property (nonatomic, retain) NSMutableArray *detailBands;
@property (nonatomic, retain) TFSReportEngineBand *columnFooter;
@property (nonatomic, retain) TFSReportEngineBand *pageFooter;
@property (nonatomic, retain) TFSReportEngineBand *summary;
@property (nonatomic, retain) TFSReportEngineBand *lastPageFooter;
@property (nonatomic, retain) TFSReportEngineBand *background;
@property (nonatomic, retain) NSMutableArray *groups;
@property double subPageHeight;
@property (nonatomic) BOOL runToBottom;
@property (nonatomic, retain) NSMutableArray *datasource;
@property (nonatomic, retain) NSMutableDictionary *variables;

@property (nonatomic) int pageWidth;
@property (nonatomic) int pageHeight;
@property (nonatomic) int leftMargin;
@property (nonatomic) int rightMargin;
@property (nonatomic) int topMargin;
@property (nonatomic) int bottomMargin;
@property (nonatomic) int start_y;
@property (nonatomic) int end_y;
@property (nonatomic) BOOL printTitle;
@property (nonatomic) int parent_title_height;
@property (nonatomic) int group_y;
@property (nonatomic) int no_of_pages;

@property (nonatomic, retain) TFSReportEngineReport *questionnaireReport;
@property (nonatomic, retain) TFSReportEngineReport *planReport;
@property (nonatomic, retain) TFSReportEngineReport *paymentReport;
@property (nonatomic, retain) TFSReportEngineReport *historyReport;

@property (nonatomic, retain) NSMutableArray *parametersFromXml;
@property (nonatomic, retain) NSMutableArray *variablesFromXml;

@property (nonatomic, readonly) NSArray *reverseSortedGroups;

@property (nonatomic, retain) NSMutableArray *styles;
@property (nonatomic, retain) NSMutableArray *returnValues;
@property (nonatomic, retain) NSMutableDictionary *parentVariables;

@property (nonatomic, retain) NSString *dataSourceExpression;

@property (nonatomic) int detailHeight;
@property (nonatomic) BOOL detailHeightCalculated;

@property (nonatomic, retain) NSMutableArray *reports;

+ (int) buildId;
+ (BOOL) initializeLicense:(NSString *)license;
+ (BOOL) isLicenseValid;

- (void) layoutReport:(TFSReportEnginePage *)page;
- (void) setLayout:(TFSReportEnginePage *)page;
- (void) matchParameters;
- (void) parseParameters;
- (void) parseVariables;
- (void)setReturnVariables;

@end
