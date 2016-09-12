//
//  PDFRenderer.h
//  iOSPDFRenderer
//
//  Created by Tope on 24/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EFormFileEntity.h"
#import "CoreText/CoreText.h"
#import <UIKit/UIKit.h>
//#import "TBXML.h"
//#import <TFSReportEngine/TBXML.h>
//#import "EappEFormBean.h"
#define X_OFFSET 5
#define X_SHORTOFFSET 5
#define RATIO               1.75f
@interface PDFRenderer : NSObject
{
}
+ (void) drawTextInCenterWith:(NSString *)string andFont:(UIFont *)font
                       inRect:(CGRect)rect;
+(NSString *)getMonth:(NSString *)string;
+(void)drawCheckWithString:(NSString *)string inRect:(CGRect)rect;
+(void) drawCheck:(NSString*)string InRect:(CGRect)rect withImage:(UIImage *)image;
+(void)drawString:(NSString *)string inRect:(CGRect)rect;
+(void)drawByGenerateFile:(EFormFileEntity *)eformFileEntity withPage:(int)page;
+(void) drawLineText:(NSString *)string andFont:(UIFont *)font andAlignment:
(NSTextAlignment)alignment inRect:(CGRect) rect;
+(NSData *)drawPDF:(EFormFileEntity *)eformFileEntity;

+(void)drawLineFromPoint:(CGPoint)from toPoint:(CGPoint)to;
+(void)drawImage:(UIImage*)image inRect:(CGRect)rect;
+ (id)mutableAttributedStringWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color alignment:(CTTextAlignment)alignment;
+ (void) drawTextWithText:(NSString *)string andAlpha:(float)alpha andFont:(UIFont*)font
                  andRect:(CGRect)rect;
+(void)drawTextWith:(NSString *)string andFont:(UIFont *)font andAlignment:(NSTextAlignment) alignment inRect:(CGRect)rect;
//+(void)drawText:(NSString*)textToDraw inFrame:(CGRect)frameRect;
//+(void)drawText:(NSString*)textToDraw inFrame:(CGRect)frameRect withFont:(UIFont *)font  color:(UIColor *)color;
//+(void)drawLabels;
@end
