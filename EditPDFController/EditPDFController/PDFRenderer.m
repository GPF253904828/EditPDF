//
//  PDFRenderer.m
//  iOSPDFRenderer
//
//  Created by Tope on 24/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
#define FONTSIZE 8

#import "PDFRenderer.h"
#import "EFormUtil.h"
#import "TBXML.h"

@implementation PDFRenderer
+ (void) drawTextInCenterWith:(NSString *)string andFont:(UIFont *)font 
                       inRect:(CGRect)rect
{
    CGRect viewRect = rect;
    CGSize size = [string sizeWithFont:font];   
    float x_pos = (viewRect.size.width - size.width) / 2; 
    float y_pos = (viewRect.size.height - size.height) /2; 
    [string drawAtPoint:CGPointMake(viewRect.origin.x + x_pos, viewRect.origin.y + y_pos) withFont:font];
    
}

+(NSString *)getMonth:(NSString *)string
{
    int value = [string intValue];
    switch (value) {
        case 1:
            return @"Jan";
        case 2:
            return @"Feb";
        case 3:
            return @"Mar";
        case 4:
            return @"Apr";
        case 5:
            return @"May";
        case 6:
            return @"Jun";
        case 7:
            return @"Jul";
        case 8:
            return @"Aug";
        case 9:
            return @"Sep";
        case 10:
            return @"Oct";
        case 11:
            return @"Nov";
        case 12:
            return @"Dec";
        default:
            return @"";
    }
}

+(void) drawCheckWithString:(NSString *)string inRect:(CGRect)rect
{
    if ([string isEqualToString:@"YES"]) {
        [PDFRenderer drawTextWithText:@"." andAlpha:255 andFont:[UIFont systemFontOfSize:40]
                              andRect:rect];
    }
}

+(void) drawCheck:(NSString*)string InRect:(CGRect)rect withImage:(UIImage *)image
{
//    if ([string isEqualToString:@"YES"]) {
        [PDFRenderer drawImage:image inRect:rect];
//    }
}

+(void)drawString:(NSString *)string inRect:(CGRect)rect
{
    UIFont *font = [UIFont systemFontOfSize:14.0];
    [PDFRenderer drawTextWithText:string   andAlpha:255 andFont:font andRect:rect];
}


//This is the function which we used to draw pdf
+(void)drawByGenerateFile:(EFormFileEntity *)eformFileEntity withPage:(int)page
{
    if (!eformFileEntity.isGenerate) {
        return;
    }

    TBXML *tbxml = [[TBXML alloc] initWithXMLString:eformFileEntity.eFormXML];
    TBXMLElement *root=[tbxml rootXMLElement];
    TBXMLElement *fieldElement = [TBXML childElementNamed:@"field" parentElement:root];
    int i = 0;
    UIImage *unimage = [UIImage imageNamed:@"checkbox_unchecked.png"];
    UIImage *image = [UIImage imageNamed:@"checkbox_checked.png"];
    
    while (fieldElement != nil) {
        NSString *txtX = [TBXML valueOfAttributeNamed:@"x" forElement:fieldElement];
        NSString *txtY = [TBXML valueOfAttributeNamed:@"y" forElement:fieldElement];
        NSString *txtWidth=[TBXML valueOfAttributeNamed:@"width" forElement:fieldElement];
        NSString *txtHeight= [TBXML valueOfAttributeNamed:@"height" forElement:fieldElement];
        NSString *type= [TBXML valueOfAttributeNamed:@"type" forElement:fieldElement];
        NSString *txtAlign = [TBXML valueOfAttributeNamed:@"align" forElement:fieldElement];
        NSString *txtPage = [TBXML valueOfAttributeNamed:@"page" forElement:fieldElement];
        NSString *txtContent = [TBXML valueOfAttributeNamed:@"content" forElement:fieldElement];
        if([txtContent isEqualToString:@"(null)"])
        {
            txtContent = @"";
        }
        txtContent = [EFormUtil htmlCode:txtContent isEncode:false];
        int fontsize = FONTSIZE;
        
        int currentPage = [txtPage intValue];
        NSTextAlignment alignment;
        if ([txtAlign isEqualToString:@"left"]) {
            alignment = NSTextAlignmentLeft;
        }
        if ([txtAlign isEqualToString:@"center"]) {
            alignment = NSTextAlignmentCenter;
        }
        if([txtAlign isEqualToString:@"right"])
        {
            alignment = NSTextAlignmentRight;
        }
        int x = [txtX intValue];
        int y = [txtY intValue];
        int width = [txtWidth intValue];
        int height = [txtHeight intValue];
        
//        UIFont *font =[UIFont fontWithName:@"Arial" size:fontsize] ;
        UIFont *font = [UIFont systemFontOfSize:fontsize];
        NSString *content = txtContent;
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"dd"];
        
        NSString *myDayString = [NSString stringWithFormat:@"%@",
                                 [df stringFromDate:[NSDate date]]];
        
        [df setDateFormat:@"MM"];
        
        NSString *myMonthString =[self getMonth: [NSString stringWithFormat:@"%@",
                                                  [df stringFromDate:[NSDate date]]]];
        
        [df setDateFormat:@"yyyy"];
        
        NSString *myYearString = [NSString stringWithFormat:@"%@",
                                  [df stringFromDate:[NSDate date]]];
        
        if ([type isEqualToString:@"text"]) {
            content = txtContent;
        }
        if ([type isEqualToString:@"day"]) {
            content = myDayString;
        }
        if ([type isEqualToString:@"month"]) {
            content = myMonthString;
        }
        if ([type isEqualToString:@"date"]) {
            content = [NSString stringWithFormat:@"%@ %@ %@",myDayString,myMonthString,myYearString];
        }
        if ([type isEqualToString:@"year"]) {
            content = myYearString;
        }
        
        CGRect rect = CGRectMake(x / RATIO, y / RATIO, width / RATIO, height / RATIO);
        if (currentPage == page) {
            if ([type isEqualToString:@"TextField"]||
                [type isEqualToString:@"HTextField"] ||   // Andy Su Oct 30 2014 Fix PIR#03095
                [type isEqualToString:@"Date"] ||
                [type isEqualToString:@"Day"] ||
                [type isEqualToString:@"Month"]||
                [type isEqualToString:@"Year"] ||
                [type isEqualToString:@"DropDown"] ||
                [type isEqualToString:@"policymain"] ||
                [type isEqualToString:@"policy"] ||
                [type isEqualToString:@"date"] ||
                [type isEqualToString:@"inputname"]||
                [type isEqualToString:@"fscname"]||
                [type isEqualToString:@"fsccode"]||
                [type isEqualToString:@"unitname"]
                ) {
                if ([type isEqualToString:@"inputmonth"]) {
                    if ([content length]> 0) {
                        content = [self getMonth:content];
                    }
                    
                    
                }
                
                if ([txtAlign isEqualToString:@"allcenter"]) {
                    [PDFRenderer drawTextInCenterWith:content andFont:font
                                               inRect:rect];
                }
                else
                {
                    [PDFRenderer drawLineText:content andFont:font andAlignment:
                     alignment inRect:rect];
                }
                
            }
            
            if ([type isEqualToString:@"TextView"]) {
                [PDFRenderer drawTextWith:content andFont:font andAlignment:NSTextAlignmentLeft inRect:rect];
            }
            if ([type isEqualToString:@"Checkbox"]) {
              
                if([content isEqualToString:@"YES"])
                {
                    [PDFRenderer drawCheck:content InRect:rect withImage:image];
                }else{
                    [PDFRenderer drawCheck:content InRect:rect withImage:unimage];
                }
            }
            
        }
        
        fieldElement = [TBXML nextSiblingNamed:@"field" searchFromElement:fieldElement];
        i++;
        
        
    }
}

+(void) drawLineText:(NSString *)string andFont:(UIFont *)font andAlignment:
(NSTextAlignment)alignment inRect:(CGRect) rect
{
    CGRect viewRect = rect;
    CGSize size = [string sizeWithFont:font];
    //int gap = (rect.size.height - size.height) / 2.0;
    float x_offset = 0;
    
    if (alignment == NSTextAlignmentCenter) {
        x_offset = (viewRect.size.width - size.width)/2;
    }
    if (alignment == NSTextAlignmentRight) {
        x_offset = viewRect.size.width - size.width;
    }
    if (alignment == NSTextAlignmentLeft) {
        x_offset = X_OFFSET;
    }
    if (rect.size.width < 30) {
        x_offset = X_SHORTOFFSET;
    }
    [string drawAtPoint:CGPointMake(viewRect.origin.x + x_offset, viewRect.origin.y +( viewRect.size.height - size.height) / 2.0) withFont:font];
}

+(NSData *)drawPDF:(EFormFileEntity *)eformFileEntity
{
    NSInteger numberOfPages = 0;
    
    
    NSString *path = [[NSBundle mainBundle]pathForResource:eformFileEntity.originFileName ofType:@""];
    CFStringRef pathSSS = CFStringCreateWithCString (NULL, [path UTF8String], kCFStringEncodingUTF8);
    CFURLRef pdfURL = CFURLCreateWithFileSystemPath (NULL, pathSSS, kCFURLPOSIXPathStyle, 0);

//    CFURLRef pdfURL = ( CFURLRef)[[NSURL alloc] initFileURLWithPath:path];
    //file ref
    CGPDFDocumentRef pdfRef = CGPDFDocumentCreateWithURL((CFURLRef) pdfURL);

    UIGraphicsBeginPDFContextToFile(eformFileEntity.eFormFilePath, CGRectZero, nil);
    numberOfPages = CGPDFDocumentGetNumberOfPages(pdfRef);
    for (int i = 1; i <= numberOfPages; i++) {
        CGPDFPageRef page = CGPDFDocumentGetPage(pdfRef, i);
        CGRect mediaBox = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
        // Mark the beginning of a new page.
        UIGraphicsBeginPDFPageWithInfo(mediaBox, nil);
        CGContextRef    currentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(currentContext);
        CGContextTranslateCTM(currentContext, 0, mediaBox.size.height);
        CGContextScaleCTM(currentContext, 1.0, -1.0);
        
        CGContextDrawPDFPage(currentContext, page);
        CGContextRestoreGState(currentContext); 
        [PDFRenderer  drawByGenerateFile:eformFileEntity  withPage:i];
    }
    UIGraphicsEndPDFContext();
    CGPDFDocumentRelease(pdfRef);
    CFRelease(pdfURL);
#if defined (CITIHK)
    NSData *temp = [[GDFileManager defaultManager] contentsAtPath:eformFileEntity.eFormFilePath];
#else
    NSData *temp = [NSData dataWithContentsOfFile:eformFileEntity.eFormFilePath];
#endif
    return temp;
}

+(void)drawLineFromPoint:(CGPoint)from toPoint:(CGPoint)to
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat components[] = {0.2, 0.2, 0.2, 0.3};
    
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, color);
    
    
    CGContextMoveToPoint(context, from.x, from.y);
    CGContextAddLineToPoint(context, to.x, to.y);
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
    
}


+(void)drawImage:(UIImage*)image inRect:(CGRect)rect
{
    
    [image drawInRect:rect];
    
}

+ (id)mutableAttributedStringWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color alignment:(CTTextAlignment)alignment

{
    CFMutableAttributedStringRef attrString = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0);
    
    if (string != nil)
        CFAttributedStringReplaceString (attrString, CFRangeMake(0, 0), (CFStringRef)string);
    
    CFAttributedStringSetAttribute(attrString, CFRangeMake(0, CFAttributedStringGetLength(attrString)), kCTForegroundColorAttributeName, color.CGColor);
    CTFontRef theFont = CTFontCreateWithName((CFStringRef)font.fontName, 
                                             font.pointSize, 
                                             NULL);
    CFAttributedStringSetAttribute(attrString, CFRangeMake(0, CFAttributedStringGetLength(attrString)), kCTFontAttributeName, theFont);
    CFRelease(theFont);
    
    CTParagraphStyleSetting settings[] = {kCTParagraphStyleSpecifierAlignment, sizeof(alignment), &alignment};
    CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(settings, sizeof(settings) / sizeof(settings[0]));
    CFAttributedStringSetAttribute(attrString, CFRangeMake(0, CFAttributedStringGetLength(attrString)), kCTParagraphStyleAttributeName, paragraphStyle);    
    CFRelease(paragraphStyle);
    
    
    NSMutableAttributedString *ret = (__bridge NSMutableAttributedString *)attrString;
    
    return ret;
}
+ (void) drawTextWith:(NSString *)string andFont:(UIFont *)font andAlignment:(NSTextAlignment) alignment inRect:(CGRect)rect
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
    
    NSString *textToDraw = string;
    
    CGRect renderingRect = rect;
    int offset = 5;
    renderingRect = CGRectMake(rect.origin.x + offset, rect.origin.y + offset, rect.size.width - 2 * offset, rect.size.height - 2 * offset);
    [textToDraw drawInRect:renderingRect 
                  withFont:font
             lineBreakMode:NSLineBreakByCharWrapping
                 alignment:alignment];
}

+ (void) drawTextWithText:(NSString *)string andAlpha:(float)alpha andFont:(UIFont*)font
andRect:(CGRect)rect{

    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, alpha/255.0);
    
    NSString *textToDraw = string;
  
    
    CGRect renderingRect = rect;
    
    [textToDraw drawInRect:renderingRect 
                  withFont:font
             lineBreakMode:NSLineBreakByCharWrapping
                 alignment:NSTextAlignmentLeft];
}

//+(void)drawText:(NSString*)textToDraw inFrame:(CGRect)frameRect withFont:(UIFont *)font  color:(UIColor *)color
//{
//        CFStringRef stringRef = (CFStringRef)textToDraw;
//    // Prepare the text using a Core Text Framesetter
//    CFAttributedStringRef currentText = (CFAttributedStringRef)[PDFRenderer mutableAttributedStringWithString:textToDraw font:font color:color alignment:kCTLeftTextAlignment];
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
//    
//    
//    CGMutablePathRef framePath = CGPathCreateMutable();
//    CGPathAddRect(framePath, NULL, frameRect);
//    
//    // Get the frame that will do the rendering.
//    CFRange currentRange = CFRangeMake(0, 0);
//    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
//    CGPathRelease(framePath);
//    
//    // Get the graphics context.
//    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
//    
//    // Put the text matrix into a known state. This ensures
//    // that no old scaling factors are left in place.
//    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
//    
//    
//    // Core Text draws from the bottom-left corner up, so flip
//    // the current transform prior to drawing.
//    CGContextTranslateCTM(currentContext, 0, frameRect.origin.y*2);
//    CGContextScaleCTM(currentContext, 1.0, -1.0);
//    
//    // Draw the frame.
//    CTFrameDraw(frameRef, currentContext);
//    
//    CGContextScaleCTM(currentContext, 1.0, -1.0);
//    CGContextTranslateCTM(currentContext, 0, (-1)*frameRect.origin.y*2);
//    
//    
//    CFRelease(frameRef);
//    CFRelease(stringRef);
//    CFRelease(framesetter);
//}

//+(void)drawText:(NSString*)textToDraw inFrame:(CGRect)frameRect
//{
//    
//    CFStringRef stringRef = (CFStringRef)textToDraw;
//    // Prepare the text using a Core Text Framesetter
//    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, stringRef, NULL);
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
//    
//    
//    CGMutablePathRef framePath = CGPathCreateMutable();
//    CGPathAddRect(framePath, NULL, frameRect);
//    
//    // Get the frame that will do the rendering.
//    CFRange currentRange = CFRangeMake(0, 0);
//    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
//    CGPathRelease(framePath);
//    
//    // Get the graphics context.
//    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
//    
//    // Put the text matrix into a known state. This ensures
//    // that no old scaling factors are left in place.
//    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
//    
//    
//    // Core Text draws from the bottom-left corner up, so flip
//    // the current transform prior to drawing.
//    CGContextTranslateCTM(currentContext, 0, frameRect.origin.y*2);
//    CGContextScaleCTM(currentContext, 1.0, -1.0);
//    
//    // Draw the frame.
//    CTFrameDraw(frameRef, currentContext);
//    
//    CGContextScaleCTM(currentContext, 1.0, -1.0);
//    CGContextTranslateCTM(currentContext, 0, (-1)*frameRect.origin.y*2);
//    
//    
//    CFRelease(frameRef);
//    CFRelease(stringRef);
//    CFRelease(framesetter);
//}


//+(void)drawLabels
//{
//    
//    NSArray* objects = [[NSBundle mainBundle] loadNibNamed:@"InvoiceView" owner:nil options:nil];
//    UIView* mainView = [objects objectAtIndex:0];
//    
//    for (UIView* view in [mainView subviews]) {
//        if([view isKindOfClass:[UILabel class]])
//        {
//            UILabel* label = (UILabel*)view;
//            
//            
//            [self drawText:label.text inFrame:label.frame];
//        }
//    }
//    
//}
@end
