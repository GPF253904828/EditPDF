//
//  EFormXMLEntity.m
//  iPoS_IOS
//
//  Created by CIBWKLPMAC006 on 5/8/13.
//  Copyright (c) 2013 AIA Information Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "EFormXMLEntity.h"
#import <UIKit/UIKit.h>

@implementation EFormXMLEntity

@synthesize alignment;
@synthesize cid;
@synthesize type;
@synthesize name;
@synthesize groupID;
@synthesize pareantName;
@synthesize maxLen;
@synthesize inputType;
@synthesize content;
@synthesize require;
@synthesize isMultipleChoice; //Add by Frank 20130529

@synthesize  tag;
@synthesize  x;
@synthesize  y;
@synthesize  page;
@synthesize  width;
@synthesize  height;
@synthesize  fontsize;
@synthesize  component;

-(id)init
{
    self = [super init];
    if (self) {
        self.cid = @"";
        self.type = @"inputtext";
        self.alignment = NSTextAlignmentLeft;
        self.name = @"";
        self.groupID = @"";
        self.pareantName = @"";
        self.maxLen = @"0";
        self.inputType = @"text";
        self.content = @"";
        self.require = @"";
        self.isMultipleChoice=@"NO"; //Add by Frank 20130529
        
    }
    return self;
}
-(void)printInfo
{
    NSLog(@"type=%@,width=%d,height=%d,align=%d,fontsize=%d",type,width,height,alignment,fontsize);
}
-(void)copyFromEntity:(EFormXMLEntity *)entity
{
    NSString *copyType = nil;
    if ([entity.type isEqualToString:@"inputname"]) {
        copyType = [[NSString alloc]initWithFormat:@"%@",@"inputtext"];
    }
    else
        if([entity.type isEqualToString:@"policymain"])
        {
            copyType = [[NSString alloc]initWithFormat:@"%@",@"policy"];
        }
        else {
            copyType = [[NSString alloc]initWithFormat:@"%@",entity.type];
        }
    self.type = copyType;
    [copyType release];
    self.alignment = entity.alignment;
    self.width = entity.width;
    self.height = entity.height;
    self.fontsize = entity.fontsize;
    self.isMultipleChoice=entity.isMultipleChoice; //Add by Frank 20130529
}

-(void) dealloc {
    NSLog(@"field form entity release");
    [cid release];
    [type release];
    [name release];
    [groupID release];
    [pareantName release];
    [maxLen release];
    [inputType release];
    [content release];
    [require release];
    [isMultipleChoice release]; //Add by Frank 20130529
    
    [super dealloc];
}

@end
