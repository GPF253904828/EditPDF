//
//  TFSJasperBox.h
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

@interface ReportEnginePen : TFSReportEngineElement
{
    double lineWidth;
	NSString *lineStyle;
	UIColor *lineColor;
}

@property double lineWidth;
@property (nonatomic, retain) NSString *lineStyle;
@property (nonatomic, retain) UIColor *lineColor;

- (id)initWithWidth:(double)width style:(NSString *)style color:(UIColor *)color;

@end

@interface TFSReportEngineBox : TFSReportEngineElement
{
    int leftPadding;
    int rightPadding;
	int topPadding;
	int bottomPadding;

    BOOL topPaddingSet;
    BOOL leftPaddingSet;
    BOOL rightPaddingSet;
    BOOL bottomPaddingSet;

	ReportEnginePen *topPen;
    ReportEnginePen *leftPen;
	ReportEnginePen *bottomPen;
	ReportEnginePen *rightPen;
}

@property (nonatomic) int leftPadding;
@property (nonatomic) int rightPadding;
@property (nonatomic) int topPadding;
@property (nonatomic) int bottomPadding;

@property (nonatomic) BOOL topPaddingSet;
@property (nonatomic) BOOL leftPaddingSet;
@property (nonatomic) BOOL rightPaddingSet;
@property (nonatomic) BOOL bottomPaddingSet;

@property (nonatomic, retain) ReportEnginePen *topPen;
@property (nonatomic, retain) ReportEnginePen *leftPen;
@property (nonatomic, retain) ReportEnginePen *bottomPen;
@property (nonatomic, retain) ReportEnginePen *rightPen;


- (void) parseXML:(TBXMLElement *)element;

- (ReportEnginePen *) readJasperPen:(TBXMLElement *)element;
@end
