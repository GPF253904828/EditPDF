//
//  EFormEntity.h
//  iPoS_IOS
//
//  Created by CIBWKLPMAC006 on 5/8/13.
//  Copyright (c) 2013 AIA Information Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EFormEntity : NSObject
@property (nonatomic, copy) NSString *formClassName;
@property (nonatomic, copy) NSString *uiText;
@property (nonatomic, copy) NSString *docTypeID;
@property (nonatomic, copy) NSString *formTypeID;
@property (nonatomic, copy) NSString *formCategory;
@property (nonatomic, copy) NSString *formPDFName;
@property (nonatomic, copy) NSString *formXMLName;
@property (nonatomic, retain) NSNumber *ordering;
@property (nonatomic, copy) NSString *ownerID;
@property (nonatomic, copy) NSString *ownerName;
@property (nonatomic, copy) NSString *pageIndex;
//Add by Frank 20130515
@property (nonatomic, copy) NSString *eappID;
@property (nonatomic, copy) NSString *eappFormID;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *isOption;
@property (nonatomic, copy) NSString *contactID;
@property (nonatomic, retain) NSData *xmlBinary;
@property (nonatomic, copy) NSString *policyNo;

@property (nonatomic, copy) NSString *documentID;
@property (nonatomic, copy) NSString *module;
@property (nonatomic, copy) NSString *eRefNo;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSData *docBinary;

@end
