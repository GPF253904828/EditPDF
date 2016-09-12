//
//  ViewController.m
//  PDFtest
//
//  Created by Damon on 16/3/16.
//  Copyright © 2016年 zfd. All rights reserved.
//

#import "ViewController.h"


#import "PdfTableCell.h"
#include <CoreFoundation/CFBase.h>
#import <UIKit/UIKit.h>
#import "PdfTableView.h"
#import "TableViewForInputUI.h"
#import "EFormXMLEntity.h"
#import "EFormUtil.h"
#import "EFormEntity.h"
#import "EFormFileEntity.h"
#import "PDFRenderer.h"

#define CELLID              @"cellid"
#define RATIO               1.75f

@interface ViewController ()
{
    NSString * pdfUrl;
    NSString * xmlURL;
    NSMutableArray * _imageList;
    UITableView * mTableView;
    TableViewForInputUI *_pdfTableView;
    NSMutableDictionary *_data;
}
@property (nonatomic,strong)NSString *deleageName;
@property (nonatomic, retain) EFormEntity *bean;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _data = [[NSMutableDictionary alloc] initWithCapacity:0];
    [self getXMLEntity];
    
     _pdfTableView = [[TableViewForInputUI alloc]initWithFrame:CGRectMake(0,0,1024,768) delegateName:@"namelsadsf" andPDFUrl:nil ownerName:@"name"];
    
    _pdfTableView.data = _data;
    [self.view addSubview:_pdfTableView];
    UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 500)];
    [footerView setBackgroundColor:[UIColor whiteColor]];
    _pdfTableView.tableFooterView = footerView;
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 100);
    [btn setTitle:@"点击生成修改过的PDF" forState:UIControlStateNormal];
    btn.titleLabel.numberOfLines = 0;
    [btn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];

}
- (void)close{
    [self doGeneratePDFWithStatus:@"2"];
    
}
#define FORMAT(format, ...) [NSString stringWithFormat:(format), ##__VA_ARGS__]

//Save PDF into Document table
- (void) doGeneratePDFWithStatus:(NSString *) status
{
    NSData *tempXML = [ViewController saveWithFileName:@"a.pdf" andData:[_pdfTableView getUIData]];
    //Generate PDF data
    EFormFileEntity *entity = [[EFormFileEntity alloc]init];
    entity.originFileName = @"a.pdf";
    entity.isGenerate = true;
    entity.pageCount = 1;
    entity.eFormXML = [[NSString alloc] initWithData:tempXML encoding:NSUTF8StringEncoding];
    entity.eFormFileName = @"avvvv.pdf";
    NSString * pathTemp = NSTemporaryDirectory();
    entity.eFormFilePath = [pathTemp stringByAppendingPathComponent:FORMAT(@"temp_a.pdf")];
    NSData *tempData = [ViewController drawPDF:entity];
    NSLog(@"复制路径 进入文件夹 查看最新生成的 temp_a.pdf  path:(%@)   lenght :%ld",entity.eFormFilePath,tempData.length);
}

+(NSData *)saveWithFileName:(NSString *)fileName andData:(NSMutableDictionary *)datas
{
    /*get pdf page number*/
    //NSString *pdfUrl = [[NSBundle mainBundle] pathForResource:fileName ofType:@""];
    NSString *pdfUrl = [EFormUtil getFilePath:fileName];
    CFStringRef path = CFStringCreateWithCString (NULL, [pdfUrl UTF8String], kCFStringEncodingUTF8);
    NSLog(@"saveWithFileName :%@",path);
    CFURLRef pdfURL= CFURLCreateWithFileSystemPath (NULL, path, kCFURLPOSIXPathStyle, 0);
    //file ref
    CGPDFDocumentRef pdfRef = CGPDFDocumentCreateWithURL((CFURLRef) pdfURL);
    int pageNumber = CGPDFDocumentGetNumberOfPages(pdfRef);
    CGPDFDocumentRelease(pdfRef);
    CFRelease(pdfURL);
    
    NSLog(@"save draft");
    NSMutableString *string = [[NSMutableString alloc]init];
    [string appendString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"];
    [string appendFormat:@"<eform filename=\"%@\" pagecount=\"%d\" yoffset=\"%d\" >\n",fileName,pageNumber,0];
    for (NSString *key in datas) {
        EFormXMLEntity *fieldEntity = (EFormXMLEntity *)[datas objectForKey:key];
        int page = fieldEntity.page;
        NSString *align;
        switch (fieldEntity.alignment) {
            case NSTextAlignmentLeft:
                align = @"left";
                break;
            case NSTextAlignmentCenter:
                align = @"center";
                break;
            case NSTextAlignmentRight:
                align = @"right";
                break;
            case ALLCENTER:
                align = @"allcenter";
                break;
            default:
                align = @"left";
                break;
        }
        if (fieldEntity.groupID == nil) {
            fieldEntity.groupID = @"";
        }
        //Update by Frank 20130530
        //Append isMultipleChoice
        NSString *str = [NSString stringWithFormat:@"<field cid=\"%@\" name=\"%@\" x=\"%d\" y=\"%d\" width=\"%d\" height=\"%d\"  type=\"%@\"  content=\"%@\" fontsize=\"%d\" align=\"%@\" page=\"%d\" inputtype=\"%@\" maxlen=\"%@\" pareantname=\"%@\" groupid=\"%@\" require=\"%@\" isMultipleChoice=\"%@\"/>\n",fieldEntity.cid, key,fieldEntity.x,fieldEntity.y,fieldEntity.width,fieldEntity.height,
                         fieldEntity.type,[EFormUtil htmlCode:fieldEntity.content isEncode:true],10,align,page,fieldEntity.inputType,fieldEntity.maxLen,fieldEntity.pareantName,fieldEntity.groupID,fieldEntity.require,fieldEntity.isMultipleChoice];
        
        [string appendString:str];
    }
    [string appendString:@"</eform>\n"];
    
    return [string dataUsingEncoding: NSUTF8StringEncoding];
}

+(NSData *)drawPDF:(EFormFileEntity *)eformFileEntity
{
    NSInteger numberOfPages = 0;
    
    NSString *pathaaaaa = [[NSBundle mainBundle]pathForResource:eformFileEntity.originFileName ofType:@""];
    CFStringRef path = CFStringCreateWithCString (NULL, [pathaaaaa UTF8String], kCFStringEncodingUTF8);
    NSLog(@"pathaaaa :%@  %@",pathaaaaa,path);
    CFURLRef pdfURL= CFURLCreateWithFileSystemPath (NULL, path, kCFURLPOSIXPathStyle, 0);
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
    NSData *temp = [NSData dataWithContentsOfFile:eformFileEntity.eFormFilePath];
    return temp;
}




- (void) getXMLEntity{
    if (1){
        EFormXMLEntity *xmlEntity = [[EFormXMLEntity alloc] init];
        xmlEntity.alignment = 0;
        xmlEntity.cid = @"1.18";
        xmlEntity.type = @"HTextField";
        xmlEntity.name = @"question1.4";
        xmlEntity.groupID = @"1.17";
        xmlEntity.pareantName = @"";
        xmlEntity.maxLen = @"0";
        xmlEntity.inputType = @"All";
        xmlEntity.content = @"question1.4";
        xmlEntity.require = @"";
        xmlEntity.isMultipleChoice = @"NO";
        xmlEntity.tag = 1;
        xmlEntity.x = 737;
        xmlEntity.y = 765;
        xmlEntity.page = 1;
        xmlEntity.width = 221;
        xmlEntity.height = 21;
        xmlEntity.fontsize = 20;
        
        [_data setObject:xmlEntity forKey:@"question1.4"];
    }
    if (1){
        EFormXMLEntity *xmlEntity = [[EFormXMLEntity alloc] init];
        xmlEntity.alignment = 0;
        xmlEntity.cid = @"1,14";
        xmlEntity.type = @"TextField";
        xmlEntity.name = @"applicant";
        xmlEntity.groupID = @"1.17";
        xmlEntity.pareantName = @"";
        xmlEntity.maxLen = @"45";
        xmlEntity.inputType = @"All";
        xmlEntity.content = @"applicant";
        xmlEntity.require = @"VVVVVVVV";
        xmlEntity.isMultipleChoice = @"NO";
        xmlEntity.tag = 21;
        xmlEntity.x = 221;
        xmlEntity.y = 631;
        xmlEntity.page = 1;
        xmlEntity.width = 685;
        xmlEntity.height = 31;
        xmlEntity.fontsize = 20;
        [_data setObject:xmlEntity forKey:@"applicant"];
    }
    if (1){
        EFormXMLEntity *xmlEntity = [[EFormXMLEntity alloc] init];
        xmlEntity.alignment = 0;
        xmlEntity.cid = @"1.18";
        xmlEntity.type = @"TextView";
        xmlEntity.name = @"ownername";
        xmlEntity.groupID = @"1.17";
        xmlEntity.pareantName = @"";
        xmlEntity.maxLen = @"0";
        xmlEntity.inputType = @"All";
        xmlEntity.content = @"ownername";
        xmlEntity.require = @"";
        xmlEntity.isMultipleChoice = @"NO";
        xmlEntity.tag = 17;
        xmlEntity.x = 296;
        xmlEntity.y = 290;
        xmlEntity.page = 1;
        xmlEntity.width = 260;
        xmlEntity.height = 31;
        xmlEntity.fontsize = 20;
        [_data setObject:xmlEntity forKey:@"ownername"];

    }
    
    if (1){
        EFormXMLEntity *xmlEntity = [[EFormXMLEntity alloc] init];
        xmlEntity.alignment = 0;
        xmlEntity.cid = @"1,11";
        xmlEntity.type = @"TextField";
        xmlEntity.name = @"";
        xmlEntity.groupID = @"";
        xmlEntity.pareantName = @"";
        xmlEntity.maxLen = @"22";
        xmlEntity.inputType = @"All";
        xmlEntity.content = @"selfname";
        xmlEntity.require = @"";
        xmlEntity.isMultipleChoice = @"NO";
        xmlEntity.tag = 12;
        xmlEntity.x = 83;
        xmlEntity.y = 502;
        xmlEntity.page = 1;
        xmlEntity.width = 360;
        xmlEntity.height = 31;
        xmlEntity.fontsize = 20;
        
        [_data setObject:xmlEntity forKey:@"selfname"];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
