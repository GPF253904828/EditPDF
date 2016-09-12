//
//  TFSReportEngineDocContainer.h
//  AIA_HK_iPoS_iOS
//
//  Created by adrian on 5/21/13.
//  Copyright (c) 2013 Treasure Frontier System Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDFService.h"

@interface TFSReportEngineDocContainer : NSObject
{
	HPDF_Doc hpdf_doc;
	const char *regularFont;
	const char *boldFont;
	const char *italicFont;
	const char *boldItalicFont;
	BOOL hasRegular;
	BOOL hasBold;
	BOOL hasItalic;
	BOOL hasBoldItalic;
}

@property(nonatomic) HPDF_Doc hpdf_doc;
@property(nonatomic) const char *regularFont;
@property(nonatomic) const char *boldFont;
@property(nonatomic) const char *italicFont;
@property(nonatomic) const char *boldItalicFont;
@property(nonatomic) BOOL hasRegular;
@property(nonatomic) BOOL hasBold;
@property(nonatomic) BOOL hasItalic;
@property(nonatomic) BOOL hasBoldItalic;

@end
