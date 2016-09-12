//
//  SQSTFSJasperElement.h
//  XMLBooks
//
//  Created by mark on 9/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "hpdf.h"
#import "TBXML.h"
@class TFSMainReport;
@class TFSReportEnginePage;
@class TFSReportEngineBand;

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface TFSReportEngineElement : NSObject
{
    int x;
    int y;
	int copy_y;
	int adjusted_y;
	int original_y;
	int page_x;
	int page_y;
    int width;
    int height;
	int size;
	UIColor *backcolor;
	UIColor *forecolor;
	HPDF_Page pdfPage;
	int footer_tag;
	BOOL print;
	int columnFooterHeight;
	NSString *printWhenExpression;
	NSString *positionType;
	NSString *style;
	NSString *stretchType;
	BOOL currentBand;
    TFSReportEngineBand *band;
	BOOL isColumnFooter;
    NSString *mode;
}

@property (nonatomic) int x;
@property (nonatomic) int y;
@property (nonatomic) int copy_y;
@property (nonatomic) int adjusted_y;
@property (nonatomic) int original_y;
@property (nonatomic) int page_x;
@property (nonatomic) int page_y;
@property (nonatomic) int width;
@property (nonatomic) int height;
@property (nonatomic) int size;
@property (nonatomic, retain) UIColor *backcolor;
@property (nonatomic, retain) UIColor *forecolor;
@property (nonatomic) HPDF_Page pdfPage;
@property (nonatomic) int footer_tag;
@property (nonatomic) BOOL print;
@property (nonatomic) int columnFooterHeight;
@property (nonatomic, retain) NSString *printWhenExpression;
@property (nonatomic, retain) NSString *positionType;
@property (nonatomic, retain) NSString *style;
@property (nonatomic, retain) NSString *stretchType;
@property (nonatomic) BOOL currentBand;
@property (nonatomic, retain) TFSReportEngineBand *band;
@property (nonatomic) BOOL isColumnFooter;
@property (nonatomic, retain) NSString *mode;

- (id)initWithX:(int)x_ y:(int)y_ width:(int)width_ height:(int)height_ forecolor:(UIColor*)color_;

//util function
- (void)getRGBComponents:(CGFloat [3])components forColor:(UIColor *)color ;
- (int) valueOfAttributeNamedToInt:(NSString *)name element:(TBXMLElement *)element;
- (double) valueOfAttributeNamedToDouble:(NSString *)name element:(TBXMLElement *)element;
- (NSString *) valueOfAttributeNamedToString:(NSString *)name element:(TBXMLElement *)element;
- (UIColor *) valueOfAttributeNamedToColor:(NSString *)name element:(TBXMLElement *)element;
- (BOOL) valueOfAttributeNamedToBool:(NSString *)name element:(TBXMLElement *)element;
- (NSString *) textForElementToString:(TBXMLElement *)element;
- (const char*) stringToCharCoversion:(NSString*)str;

// evaluate
- (BOOL) evaluatePrintWhenExpression:(NSString *)expression parameters:(NSDictionary *)parameters datasource:(NSDictionary *)datasource variables:(NSDictionary *)variables;

- (void) reportElement:(TBXMLElement *)element parameters:(NSDictionary *)parameters datasource:(NSMutableArray *)datasource variables:(NSDictionary *)variables;
- (void) copyPositionTo:(TFSReportEngineElement *)other;

- (NSString *) checkPrimaryString:(NSString*)tempstring parameter:(NSDictionary*)parameter;
- (NSString*) compareToParameters:(NSString*) tempstring parameter:(NSDictionary *) parameters;

- (NSString *) checkIfStatement1:(NSString*)equalif parameter:(NSDictionary *)parameter range:(NSString*)range;
- (NSString *) checkIfStatement2:(NSString*)equalif parameter:(NSDictionary *)parameter range:(NSString*)range;
- (NSString *) checkIfStatement3:(NSString*)equalif parameter:(NSDictionary *)parameter range:(NSString*)range;
- (NSString *) checkIfStatement4:(NSString*)equalif parameter:(NSDictionary *)parameter range:(NSString*)range;

- (NSString *)ifBreakUp:(NSString *)tempstring parameter:(NSDictionary*)parameter range:(NSString*)range;

	//abstract function
- (void) parseXML:(TBXMLElement *)element;
- (void) draw:(TFSReportEnginePage *)page size:(int)size;
- (void) layoutReport:(TFSReportEnginePage *)page;
- (int) expandHeight;
- (void) draw;
- (void) draw:(HPDF_Page)hpdf_page hpdf_doc:(HPDF_Doc)hpdf_doc;
- (NSComparisonResult) compareWithAnotherElement:(TFSReportEngineElement *)element;
- (NSComparisonResult) compareWithAnotherPageElement:(TFSReportEngineElement *)element;

@end
