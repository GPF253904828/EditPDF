//
//  EFormFileEntity.m
//  iPoS_IOS
//
//  Created by CIBWKLPMAC006 on 5/8/13.
//  Copyright (c) 2013 AIA Information Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "EFormFileEntity.h"

@implementation EFormFileEntity
@synthesize isGenerate;
@synthesize eFormXML;
@synthesize pageCount;
@synthesize  originFileName;
@synthesize  eFormFileName;
@synthesize eFormFilePath;
@synthesize eFormConfigFileName;
@synthesize isConfig;
- (void)dealloc
{
    [eFormXML release];
    [eFormConfigFileName release];
    [eFormFilePath release];
    [originFileName release];
    [eFormFileName release];
    [super dealloc];
}
@end
