//
//  EFormDelegate.h
//  iPoS_IOS
//
//  Created by CIBWKLPMAC006 on 5/8/13.
//  Copyright (c) 2013 AIA Information Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EFormEntity.h"
#define QUESTIONNAIRE_FORM_KEY @"Supplementary Form"

@protocol EFormDelegate <NSObject>
@optional
- (void)showPDFWithFormType:(NSString *)formType andContactID:(NSString *) contactID;
//key is ContactID value is EFormType <ContactID,EFormType>
- (NSMutableDictionary *) getApplicantEFormList;
- (NSMutableDictionary *) getInsuredEFormList;
- (NSMutableDictionary *) getCPDForm;
- (void) deleteCPDForm;
- (void) cleanQuestionFormWithEformEntity:(EFormEntity *)eformEntity;
- (void)saveXML:(NSData *) xmldata andStatus:(NSString *)status;
- (void)savePDF:(NSData *) pdfdata andStatus:(NSString *)status;
//Haittao - add Citi questionnaire forms
//- (BOOL) isMandatory:(NSString *) str;
- (BOOL) isMandatoryForm:(NSString *)docType eAppQuotationInfo:(EAppQuotationInfo *)eAppQuotationInfo;
//- (NSData *)getEFormData:(NSString *)formType andContactID:(NSString *) contactID;
@end