//
//  TFSReportEnginePage.h
//  XMLBooks
//
//  Created by mark on 9/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDFService.h"

@class TFSReportEngineBand;

@interface TFSReportEnginePage : NSObject
{
	double width;
	double height;
    double topMargin;
    double bottomMargin;
    double leftMargin;
    double rightMargin;

	int offsetY;

	HPDF_Doc pdf;
	HPDF_Page page;

	TFSReportEngineBand *pageHeader;
	TFSReportEngineBand *pageFooter;

	int headerOffset;
	int footerOffset;

	NSMutableArray *elements;
	int pageHeight;
	int pageWidth;
	int last_y_position;
}

@property double topMargin;
@property double bottomMargin;
@property double leftMargin;
@property double rightMargin;
@property double width;
@property double height;
@property (nonatomic) int offsetY;
@property (nonatomic) HPDF_Doc pdf;
@property (nonatomic) HPDF_Page page;
@property (nonatomic, retain) TFSReportEngineBand *pageHeader;
@property (nonatomic, retain) TFSReportEngineBand *pageFooter;
@property (nonatomic, retain) NSMutableArray *elements;
@property (nonatomic) int pageHeight;
@property (nonatomic) int pageWidth;
@property (nonatomic, readonly) NSMutableArray *sortedElements;
@property (nonatomic) int last_y_position;

- (void) addPage;
- (int) isBandFit:(TFSReportEngineBand *)band;
- (int) freeSpaceY;
//- (void) savePage:(NSString *)outputName;
- (void) draw:(HPDF_Page)hpdf_page hpdf_doc:(HPDF_Doc)hpdf_doc;

@end
