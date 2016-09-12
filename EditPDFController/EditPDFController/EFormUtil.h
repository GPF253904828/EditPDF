//
//  AIASQSUtil.h
//  AIA
//
//  Created by admin on 28/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

#define EMAIL_ATTACHED_MIME_TYPE @"mimeType"
#define EMAIL_ATTACHED_FILENAME @"attachedFilename"
#define EMAIL_ATTACHED_FILEPATH @"attachedFilePath"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface EFormUtil : NSObject


+ (BOOL)validatePolicyNumber:(NSString *)policyNumber;
+(NSString *)getFilePath:(NSString *)filename;
+(NSString *)getFilePathFromMainBundle:(NSString *)filename;
+(NSString *)getFilePathFromDocument:(NSString *)filename;

//+(NSString*)getFormsDownloadedPath;
//+(BOOL)areBIPDFUpdated;
//+(BOOL)arePOSFormsUpdated;
//+(BOOL)isFormPresentOnApplicationsDirectory: (NSString*)filename;
+(NSInteger)roundUpFloatValue:(NSString*)stringNum;
+ (NSString*)getAppVersion;
//+ (NSString*)encodeURL:(NSString *)string;
+ (void)writeToLogFile:(NSString *)textToAppend;

+(UIButton *)getImageButtonWithImage:(NSString *)imageFilename andTarget:(id)target andFrame:(CGRect)rect  andSelector:(SEL)selector;
//The method is used in EForm which will encode text content to prevent special characters in xml which may cause some issue
+(NSString*) htmlCode:(NSString *) string isEncode:(bool) isEncode;
+(void)emailWithSubject:(NSString *)subject andAttaches:(NSArray *)array andDelegate:(id<MFMailComposeViewControllerDelegate>)delegate;
+ (void)printPDFWithName:(NSString *)filename andPath:(NSString *)filePath andFromButton:(UIButton *)button andInViewController:(id<UIPrintInteractionControllerDelegate>)delegate;

//Animate the entire view up or down, to prevent the keyboard from covering the text field.
+(void)moveView:(UIView*)view withOffset:(int)offset;
+(NSString *) formatNameWithFirstName:(NSString *) firstName middleName:(NSString *) middleName lastName:(NSString *) lastName isChinesse:(BOOL) isChinesse isCompany:(BOOL) isCompany;
+(NSString *) formatNameWithInital:(NSString *) inital andSuffix:(NSString *) suffix name:(NSString *) name;
+(BOOL) isNULL:(NSString *) value;
@end
