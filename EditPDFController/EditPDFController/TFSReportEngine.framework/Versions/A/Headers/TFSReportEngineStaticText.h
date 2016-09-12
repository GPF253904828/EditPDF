//
//  TFSReportEngineStaticText.h
//  XMLBooks
//
//  Created by mark on 9/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define TEXT_LEADING                    1.15
#define CHINESE_TEXT_LEADING            1.1
#define SUPERSCRIPT_HEIGHT              5
#define CHINESE_SUPERSCRIPT_HEIGHT		3


#import <Foundation/Foundation.h>

#import "TFSReportEngineElement.h"
#import "TFSReportEngineBox.h"
#import "TFSReportEngineFont.h"
#import "TFSReportEngineReportStyle.h"


@interface TFSReportEngineStaticText : TFSReportEngineElement <NSCopying>
{
    NSString *text;
    TFSReportEngineBox *box;
    NSString *textAlignment;
    NSString *verticalAlignment;
    TFSReportEngineFont *font;
    int noOfLines;
    double extraHeight;
    BOOL initText;
    HPDF_Font regularFont;
    HPDF_Font boldFont;
    HPDF_Font italicFont;
    HPDF_Font boldItalicFont;
    HPDF_Font watermarkFont;
    HPDF_Font regularFontUTF8;
    HPDF_Font boldFontUTF8;
    HPDF_Font hfont;
    NSString *markup;
    NSMutableArray *styledTexts;
    NSMutableArray *reportStyles;
    BOOL isBoldSet;
    BOOL isItalicSet;
    BOOL isUnderlineSet;
    NSString *lineSpacing;
    NSDictionary *parameters;
    NSDictionary *dataSource;
    BOOL isValidConditionalStyle;
}

@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) TFSReportEngineBox *box;
@property (nonatomic, retain) NSString *textAlignment;
@property (nonatomic, retain) NSString *verticalAlignment;
@property (nonatomic, retain) TFSReportEngineFont *font;
@property int noOfLines;
@property double extraHeight;
@property (nonatomic, retain) NSString *markup;
@property (nonatomic, retain) NSMutableArray *styledTexts;
@property (nonatomic, retain) NSMutableArray *reportStyles;
@property (nonatomic) BOOL isBoldSet;
@property (nonatomic) BOOL isItalicSet;
@property (nonatomic) BOOL isUnderlineSet;
@property (nonatomic, retain) NSString *lineSpacing;
@property (nonatomic, retain) NSDictionary *parameters;
@property (nonatomic, retain) NSDictionary *dataSource;
@property (nonatomic) BOOL isValidConditionalStyle;

+ (void) resetCounter;
- (void) parseXML:(TBXMLElement *)element parameters:(NSDictionary *)parameters;
- (void) draw:(HPDF_Page)hpdf_page hpdf_doc:(HPDF_Doc)hpdf_doc;
- (void) drawText:(HPDF_Page)hpdf_page hpdf_doc:(HPDF_Doc)hpdf_doc;
- (void) drawChineseText:(HPDF_Page)hpdf_page hpdf_doc:(HPDF_Doc)hpdf_doc;
- (void) drawLeftPen:(HPDF_Page)hpdf_page hpdf_doc:(HPDF_Doc)hpdf_doc;
- (void) drawRightPen:(HPDF_Page)hpdf_page hpdf_doc:(HPDF_Doc)hpdf_doc;
- (void) drawBottomPen:(HPDF_Page)hpdf_page hpdf_doc:(HPDF_Doc)hpdf_doc;
- (void) drawBackgroundColour:(HPDF_Page)hpdf_page hpdf_doc:(HPDF_Doc)hpdf_doc;
- (void) initText:(HPDF_Page)hpdf_page hpdf_doc:(HPDF_Doc)hpdf_doc;
-(void) calculateNoOfLines:(HPDF_Doc)hpdf_doc hpdf_page:(HPDF_Page)hpdf_page;
- (void)loadStyle;
- (void)loadReportStyle:(TFSReportEngineReportStyle *)reportStyle;
- (id) copyWithZone:(NSZone *)zone;
+ (void) printTime;

@end
