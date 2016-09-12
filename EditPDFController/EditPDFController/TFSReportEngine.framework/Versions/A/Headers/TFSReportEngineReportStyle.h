//
//  TFSReportEngineReportStyle.h
// TFSReportEngine_IOS
//
//  Created by adrian on 5/19/12.
//  Copyright (c) 2012 TF System Sdn. Bhd. All rights reserved.
//

#import "TFSReportEngineElement.h"
#import "TFSReportEngineBox.h"
#import "TFSReportEngineReportStyle.h"

@interface TFSReportEngineReportStyle : TFSReportEngineElement <NSCopying>
{
    NSString *name;
    NSNumber *isDefault;
    NSString *fontName;
    NSNumber *fontSize;
    NSString *vAlign;
    NSString *hAlign;
    NSNumber *isBold;
    NSNumber *isItalic;
    NSNumber *isUnderline;
    NSString *pattern;
    TFSReportEngineBox *box;
    TFSReportEngineReportStyle *parentStyle;
    NSMutableArray *styles;
    NSMutableArray *conditionalStyles;
    NSString *expression;
    BOOL isValidExpression;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *isDefault;
@property (nonatomic, retain) NSString *fontName;
@property (nonatomic, retain) NSNumber *fontSize;
@property (nonatomic, retain) NSString *vAlign;
@property (nonatomic, retain) NSString *hAlign;
@property (nonatomic, retain) NSNumber *isBold;
@property (nonatomic, retain) NSNumber *isItalic;
@property (nonatomic, retain) NSNumber *isUnderline;
@property (nonatomic, retain) NSString *pattern;
@property (nonatomic, retain) TFSReportEngineBox *box;
@property (nonatomic, retain) TFSReportEngineReportStyle *parentStyle;
//Bonggala memory fix : change property setting to 'assign' to solve circular reference/retain cycle problem - Adrian
@property (nonatomic, assign) NSMutableArray *styles;
@property (nonatomic, retain) NSMutableArray *conditionalStyles;
@property (nonatomic, retain) NSString *expression;
@property (nonatomic) BOOL isValidExpression;

- (void)parseXML:(TBXMLElement *)element;
- (void)getParentStyle_;

@end
