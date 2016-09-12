//
//  EFormXMLEntity.h
//  iPoS_IOS
//
//  Created by CIBWKLPMAC006 on 5/8/13.
//  Copyright (c) 2013 AIA Information Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ALLCENTER 100
#define SIGNATUREREALWIDTH 150
#define SIGNATUREREALHEIGHT 50
#define SIGNATUREWIDTH (SIGNATUREREALWIDTH * RATIO)
#define SIGNATUREHEIGHT (SIGNATUREREALHEIGHT * RATIO)
#import "EFormComponent.h"
@interface EFormXMLEntity : NSObject
{
    
    int alignment;
    NSString *cid;
    NSString *type;
    NSString *name;
    NSString *groupID;
    NSString *pareantName;
    NSString *maxLen;
    NSString *inputType;
    NSString *content;
    NSString *require;
    NSString *isMultipleChoice;//Add by Frank 20130529
    
    int tag;
    int x;
    int y;
    int page;
    int width;
    int height;
    int fontsize;
}

@property(nonatomic,retain) NSString *cid;
@property(nonatomic,retain) NSString *type;
@property(nonatomic,retain) NSString *name;
@property(nonatomic,retain) NSString *groupID;
@property(nonatomic,retain) NSString *pareantName;
@property(nonatomic,retain) NSString *maxLen;
@property(nonatomic,retain) NSString *inputType;
@property(nonatomic,retain) NSString *content;
@property(nonatomic,retain) NSString *require;
@property(nonatomic,retain) NSString *isMultipleChoice;//Add by Frank 20130529

@property (nonatomic, retain) id<EFormComponent> component;

@property (nonatomic) int alignment;
@property (nonatomic) int tag;
@property (nonatomic) int x;
@property (nonatomic) int y;
@property (nonatomic) int page;
@property (nonatomic) int width;
@property (nonatomic) int height;
@property (nonatomic) int fontsize;
-(void)copyFromEntity:(EFormXMLEntity *)entity;
-(void)printInfo;
@end