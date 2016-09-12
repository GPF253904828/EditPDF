//
//  SQSTFSJasperFont.h
//  XMLBooks
//
//  Created by mark on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFSReportEngineElement.h"

@interface TFSReportEngineFont : TFSReportEngineElement <NSCopying>
{
    NSString * fontName;
    int fontSize;
    BOOL underLine;
    BOOL isBold;
    BOOL isItalic;
}

@property (nonatomic,retain) NSString * fontName;
@property (nonatomic) int fontSize;
@property (nonatomic) BOOL isBold;
@property (nonatomic) BOOL isItalic;
@property (nonatomic) BOOL underLine;

@end
