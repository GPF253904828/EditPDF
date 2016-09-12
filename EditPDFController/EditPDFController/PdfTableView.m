//
//  PdfTableView.m
//  AIA
//
//  Created by aiait on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PdfTableView.h"
#import "EFormUIImageView.h"
//#import "EFormInputViewController.h"
//#import "test.h"

#define CELLID          @"CellID"
#define RATIO               1.75f
//#import "PDFRenderer.h"
#define DISPLAY_WIDTH       1024.0f
#define DISPLAY_HEIGHT      1454.0f
#define DISPLAY_SPACE       20.0f
@interface PdfTableView(Private)

- (void)getPDFImages;

- (void)renderPDF:(id)object;
-(UIImage *)imageFromCGPDFPDFPage:(int)pageNumber;
- (UIImage*)imageFromPDFPage:(int)pageNumber;
@end

@implementation PdfTableView
@synthesize pdfUrl;
@synthesize isShowOriginSize = _isShowOriginSize;
@synthesize deleageName;
@synthesize ownerName;

- (id)initWithFrame:(CGRect)frame delegateName:(NSString *) iDelegateName andPDFUrl:(NSString *)pdfUrlString ownerName:(NSString *) iownerName
{
    if (self = [super initWithFrame:frame style:UITableViewStylePlain])
    {
        NSString *itemPath = @"a.pdf";
        
        NSArray *aArray = [itemPath componentsSeparatedByString:@"."];
        NSString *filename = [aArray objectAtIndex:0];
        NSString *sufix = [aArray objectAtIndex:1];
        self.pdfUrl = [[NSBundle mainBundle] pathForResource:filename ofType:sufix];
        
        self.deleageName = iDelegateName;
        self.ownerName = iownerName;
        self.deleageName = @"EappSuppDataDelegate";
        self.ownerName = @"owner name";

        self.delegate = self;
        self.dataSource = self;
        self.allowsSelection = NO;
        _imageList = [[NSMutableArray alloc] initWithCapacity:0];
        //[self performSelectorInBackground:@selector(renderPDF:) withObject:nil];
        [self renderPDF:nil];
    }
    return self;
}
#pragma mark - Render pdf
- (void)renderPDF:(id)object
{
    // Get Images
    int pageIndex = 0;
    NSInteger pageCount = [PdfTableView getPdfPageNumber:pdfUrl];
    
    for (pageIndex = 0; pageIndex < pageCount; pageIndex++) {
        int pageNumber = pageIndex + 1;
        UIImage* signedImage = [self imageFromPDFPage:pageNumber];
        [_imageList addObject:signedImage];
        if (pageIndex == 0) {
            [self reloadData];
        }
        
    }
    // Reload Table
    [self reloadData];
}


+ (NSInteger)getPdfPageNumber:(NSString*)url
{
    CFStringRef path;
    CFURLRef urlaa;
    path = CFStringCreateWithCString (NULL, [url UTF8String], kCFStringEncodingUTF8);
    urlaa = CFURLCreateWithFileSystemPath (NULL, path, kCFURLPOSIXPathStyle, 0);
    //file ref
    CGPDFDocumentRef pdfRef = CGPDFDocumentCreateWithURL(urlaa);
    NSInteger pageNumber = CGPDFDocumentGetNumberOfPages(pdfRef);
    CGPDFDocumentRelease(pdfRef);
    CFRelease(urlaa);
    return pageNumber;
    
}
+ (float)getPdfWidth:(NSString *)url
{
    CFStringRef path;
    CFURLRef  urlaa;
    path = CFStringCreateWithCString (NULL, [url UTF8String], kCFStringEncodingUTF8);
    urlaa = CFURLCreateWithFileSystemPath (NULL, path, kCFURLPOSIXPathStyle, 0);
    //file ref
    CGPDFDocumentRef pdfRef = CGPDFDocumentCreateWithURL(urlaa);
    CGPDFPageRef page = CGPDFDocumentGetPage(pdfRef, 1);
    CGRect  box = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
    CGPDFDocumentRelease(pdfRef);
    CFRelease(urlaa);
    return box.size.width;
}

-(UIImage *)imageFromCGPDFPDFPage:(int)pageNumber
{
    
    CFStringRef path = CFStringCreateWithCString (NULL, [self.pdfUrl UTF8String], kCFStringEncodingUTF8);
    CFURLRef urlaa = CFURLCreateWithFileSystemPath (NULL, path, kCFURLPOSIXPathStyle, 0);
    CGPDFDocumentRef pdf = CGPDFDocumentCreateWithURL (urlaa);// 2
    CFRelease(urlaa);
    
    
    
    CGPDFPageRef pdfPage = CGPDFDocumentGetPage(pdf, pageNumber);
    
    CGRect tmpRect = CGPDFPageGetBoxRect(pdfPage, kCGPDFMediaBox);
    CGRect rect = CGRectMake(tmpRect.origin.x,tmpRect.origin.y,tmpRect.size.width * RATIO,tmpRect.size.height * RATIO);
    //file re
    CGPDFPageRef page = CGPDFDocumentGetPage(pdf, pageNumber);
    UIGraphicsBeginImageContext(rect.size);
    CGRect mediaBox = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
    // Mark the beginning of a new page.
    UIGraphicsBeginPDFPageWithInfo(mediaBox, nil);
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextTranslateCTM(currentContext, 0, mediaBox.size.height * RATIO);
    CGContextScaleCTM(currentContext, RATIO, -RATIO);
    
    CGContextDrawPDFPage(currentContext, page);
    CGContextRestoreGState(currentContext); 
    UIImage * pdfImage = UIGraphicsGetImageFromCurrentImageContext();//autoreleased
    UIGraphicsEndImageContext();
    
    CFRelease(pdf);
    return pdfImage;
    
}
- (UIImage*)imageFromPDFPage:(int)pageNumber {
    UIImage *image = [self imageFromCGPDFPDFPage:pageNumber];
    return image;
}
#pragma mark - Config cell function which need to be implement in sub class
-(void)configCell:(UITableViewCell *)cell withRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - Config cell function which need to be implement in sub class
-(void)configCell:(UITableViewCell *)cell withRowAtIndexPath:(NSIndexPath *)indexPath andDataDelegateName:(NSString *) dataDelegateName
{
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_imageList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 1490; // your dynamic height...
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PdfTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    [cell.imageView removeFromSuperview];
    UIImage *rowBackground = [_imageList objectAtIndex:indexPath.row];

    if (cell == nil)
    {
        cell = [[PdfTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    [cell layoutPdfTableCellWithImage:rowBackground withIndexPathRow:indexPath.row];

    // Configure the cell...
    [self configCell:cell withRowAtIndexPath:indexPath andDataDelegateName:self.deleageName];
    
    return cell;
}

@end
