//
//  TfsMainReport.h
//  XMLBooks
//
//  Created by mark on 9/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDFService.h"
#import "TFSMiddleSectionVariables.h"
@class TFSReportEngineReport;
@class TFSReportEnginePage;
@class TFSReportEngineBand;

@interface TFSMainReport : NSObject <PDFServiceDelegate>
{
	//TFSReportEngineReport *report;
	NSMutableArray *reports;
	NSMutableArray *pages;
	HPDF_Doc hpdf_doc;
	HPDF_Page hpdf_page;

    NSUInteger pageNo;
    NSUInteger totalPage;
	BOOL addedElement;
	NSString *orientation;

	TFSReportEngineReport *questionnaireReport;
	TFSReportEngineReport *planReport;
	TFSReportEngineReport *paymentReport;
	TFSReportEngineReport *historyReport;

    BOOL shouldDrawPages;
    BOOL checkingReturnValues;
}

//@property(nonatomic,retain) TFSReportEngineReport * report;
@property (nonatomic) NSUInteger pageNo;
@property (nonatomic) NSUInteger totalPage;

@property (nonatomic, retain) NSMutableArray *reports;
@property (nonatomic, retain) NSMutableArray *pages;
@property (nonatomic) HPDF_Doc hpdf_doc;
@property (nonatomic, retain) NSString *orientation;

@property (nonatomic, retain) TFSReportEngineReport *questionnaireReport;
@property (nonatomic, retain) TFSReportEngineReport *planReport;
@property (nonatomic, retain) TFSReportEngineReport *paymentReport;
@property (nonatomic, retain) TFSReportEngineReport *historyReport;

@property (nonatomic) BOOL shouldDrawPages;


//+ (void) createPDFWithJrxml:(NSString *)inputName outputName:(NSString *)outputName parameters:(NSDictionary*)parameters datasource:(NSMutableArray *)datasource;

+ (int) buildId;
+ (BOOL) initializeLicense:(NSString *)license;
+ (BOOL) isLicenseValid;

- (void) loadJrxml:(NSString *)inputName outputName:(NSString *)outputName parameters:(NSDictionary*)parameters datasource:(NSMutableArray *)datasource;
- (void) appendJrxml:(NSString *)inputName outputName:(NSString *)outputName parameters:(NSDictionary*)parameters datasource:(NSMutableArray *)datasource;
//- (void) drawPages:(NSString *)outputName;
- (void) saveToFile:(NSString *)outputName;
- (NSDictionary *) getVariables;

- (void) addPage;
- (int) layoutHeader:(TFSReportEnginePage *)page leftMargin:(int)left_margin topMargin:(int)top_margin bottomMargin:(int)bottom_margin report:(TFSReportEngineReport *)report;
- (int) layoutFooterToBottom:(TFSReportEnginePage *)page leftMargin:(int)left_margin topMargin:(int)top_margin bottomMargin:(int)bottom_margin report:(TFSReportEngineReport *)report footerTag:(int)footer_tag;
- (int) layoutLastPageFooterToBottom:(TFSReportEnginePage *)page leftMargin:(int)left_margin topMargin:(int)top_margin bottomMargin:(int)bottom_margin report:(TFSReportEngineReport *)report footerTag:(int)footer_tag;
- (int) layoutBandFromTop:(TFSReportEnginePage *)page leftMargin:(int)left_margin topMargin:(int)top_margin bottomMargin:(int)bottom_margin report:(TFSReportEngineReport *) report band:(TFSReportEngineBand *)band bandStartY:(int)band_start_y;
- (int) calculateBandHeight:(TFSReportEngineBand *)band;
- (int) calculateBandHeight:(TFSReportEngineBand *)band para:(NSDictionary *)para data:(NSDictionary *)data variables:(NSDictionary *)vars;
- (int) calculateFirstBandHeight:(TFSReportEngineBand *)band;
- (int) calculateReportHeight:(TFSReportEngineReport *)report;
- (int) layoutBandFromBottom:(TFSReportEnginePage *)page leftMargin:(int)left_margin topMargin:(int)top_margin bottomMargin:(int)bottom_margin report:(TFSReportEngineReport *) report band:(TFSReportEngineBand *)band bandEndY:(int)band_end_y footerTag:(int)footer_tag columnFooterHeight:(int)columnFooterHeight;
//- (int) layoutGroupHeaders:(NSMutableArray *)groups startY:(int)start_y endY:(int)end_y groupY:(int)group_y report:(TFSReportEngineReport *)report leftMargin:(int)left_margin topMargin:(int)top_margin bottomMargin:(int)bottom_margin;
- (void) layoutMiddleBand:(TFSMiddleSectionVariables *)middleSectionVariables band:(TFSReportEngineBand *)band parameters:(NSDictionary *)parameters data:(NSDictionary *)data variables:(NSDictionary *)variables;
- (int) layoutMiddleSection:(NSMutableArray *)groups startY:(int)start_y endY:(int)end_y groupY:(int)group_y report:(TFSReportEngineReport *)report leftMargin:(int)left_margin topMargin:(int)top_margin bottomMargin:(int)bottom_margin;
- (void)layoutBackground:(TFSReportEnginePage *)page leftMargin:(int)left_margin topMargin:(int)top_margin bottomMargin:(int)bottom_margin report:(TFSReportEngineReport *)report band:(TFSReportEngineBand *)band bandStartY:(int)band_start_y;
- (int) middleSectionNoOfPages:(NSMutableArray *)groups startY:(int)start_y endY:(int)end_y groupY:(int)group_y report:(TFSReportEngineReport *)report leftMargin:(int)left_margin topMargin:(int)top_margin bottomMargin:(int)bottom_margin lastPageFooterPage:(int)last_page_footer_page parentReportTotalPages:(int)parent_report_total_pages;
- (void) middleBandNoOfPages:(TFSMiddleSectionVariables *)middleSectionVariables band:(TFSReportEngineBand *)band parameters:(NSDictionary *)parameters data:(NSDictionary *)data;
- (void) parseTextFieldsAtReport:(TFSReportEngineReport *)report;
- (void) drawPages;
- (void) removePageFooter:(int)footer_tag;
- (void)checkForReturnValues:(TFSReportEngineReport *)report;
- (int) layoutMiddleSection:(NSMutableArray *)groups startY:(int)start_y endY:(int)end_y groupY:(int)group_y report:(TFSReportEngineReport *)report leftMargin:(int)left_margin topMargin:(int)top_margin bottomMargin:(int)bottom_margin addElement:(BOOL)addElement;
- (void) layoutMiddleBand:(TFSMiddleSectionVariables *)middleSectionVariables band:(TFSReportEngineBand *)band parameters:(NSDictionary *)parameters data:(NSDictionary *)data variables:(NSDictionary *)variables addElement:(BOOL)addElement;

- (void)setFontName:(NSString *)font_;

void PDFService_defaultErrorHandler3(HPDF_STATUS   error_no,
                                     HPDF_STATUS   detail_no,
                                     void         *user_data);

@end
