//
//  EFormEntity.m
//  iPoS_IOS
//
//  Created by CIBWKLPMAC006 on 5/8/13.
//  Copyright (c) 2013 AIA Information Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "EFormEntity.h"

@implementation EFormEntity

@synthesize formClassName;
@synthesize uiText;
@synthesize docTypeID;
@synthesize formTypeID;
@synthesize formCategory;
@synthesize formPDFName;
@synthesize formXMLName;
@synthesize ordering;
@synthesize ownerName;
@synthesize pageIndex;
@synthesize eappID;
@synthesize eappFormID;
@synthesize isOption;
@synthesize status;
@synthesize contactID;
@synthesize xmlBinary;
@synthesize policyNo;
@synthesize documentID;
@synthesize module;
@synthesize eRefNo;
@synthesize fileName;
@synthesize docBinary;

-(void) dealloc
{
    [formClassName release];
    [uiText release];
    [docTypeID release];
    [formTypeID release];
    [formCategory release];
    [formPDFName release];
    [formXMLName release];
    [ordering release];
    [ownerName release];
    [pageIndex release];
    [eappID release];
    [eappFormID release];
    [isOption release];
    [status release];
    [contactID release];
    [xmlBinary release];
    [policyNo release];
    [documentID release];
    [module  release];
    [eRefNo release];         
    [fileName release];       
    [docBinary release];      
    
    [super dealloc];
}

- (id) init
{
    self = [super init];
    
    if (self)
    {
        
    }
    
    return self;
}

- (NSString *) description
{
    return NSLocalizedString(self.uiText, self.formName);
}

@end
