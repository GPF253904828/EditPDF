//
//  AIASQSUtil.m
//  AIA
//
//  Created by admin on 28/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EFormUtil.h"
#define HTML_CODE_SIZE 6

@implementation EFormUtil
+ (void)printPDFWithName:(NSString *)filename andPath:(NSString *)filePath andFromButton:(UIButton *)button andInViewController:(id<UIPrintInteractionControllerDelegate>)delegate
{
    NSURL* url = [NSURL fileURLWithPath:filePath];
    NSData* data = [NSData dataWithContentsOfURL:url];
    
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    
    if (pic && [UIPrintInteractionController canPrintData:data]) {
        pic.delegate = delegate;
        
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInfo.jobName = filename;
        pic.printInfo = printInfo;
        pic.showsPageRange = YES;
        pic.printingItem = data;
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
        ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
            if (!completed && error) {
                NSLog(@"Printing could not complete because of error: %@", error);
            }
        };
        UIViewController *viewController = (UIViewController *)delegate;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            [pic presentFromRect:button.frame
                          inView:viewController.view
                        animated:YES
               completionHandler:completionHandler];
        } else {
            [pic presentAnimated:YES completionHandler:completionHandler];
        }
    }
}

+(void)emailWithSubject:(NSString *)subject andAttaches:(NSArray *)array andDelegate:(id<MFMailComposeViewControllerDelegate>)delegate
{
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = delegate;
    [controller setSubject:subject];
    
    
    NSError* error = nil;
    for (NSMutableDictionary *dict in array) {
        NSString *mimetype = [dict objectForKey:EMAIL_ATTACHED_MIME_TYPE];
        NSString *filename = [dict objectForKey:EMAIL_ATTACHED_FILENAME];
        NSString *filepath = [dict objectForKey:EMAIL_ATTACHED_FILEPATH];
        if ([[NSFileManager defaultManager] fileExistsAtPath:filepath]) {
            NSURL *fileUrl = [NSURL fileURLWithPath:filepath];
            NSData *fileData = [NSData dataWithContentsOfURL:fileUrl options:NSUncachedRead error:&error];
            [controller addAttachmentData:fileData mimeType:mimetype fileName:filename];
        }
    }
    
    if (controller) {
        //AZ - 8/28/14 - upgrade to SDK7.1 fixing - Fix iOS compilation warning
        [(UIViewController *)delegate presentViewController:controller animated:YES completion:nil];
    }
}
+(UIButton *)getImageButtonWithImage:(NSString *)imageFilename andTarget:(id)target andFrame:(CGRect)rect  andSelector:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    [button setImage:[UIImage imageNamed:imageFilename ] forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
    
}
+(NSString*) htmlCode:(NSString *) string isEncode:(bool) isEncode
{
    if (string.length == 0) {
        return string;
    }
    NSString *originCode[HTML_CODE_SIZE] = {@"&",@"<",@">",@"\"",@"'", @"|"};
    NSString *htmlCode[HTML_CODE_SIZE] = {@"&amp;",@"&lt;",@"&gt;",@"&quot;",@"&apos;",@"&iota;"};
        
    NSString *str = string;
    for (int i = 0; i < HTML_CODE_SIZE; i++){
        if (isEncode)
            str = [str stringByReplacingOccurrencesOfString:originCode[i] withString:htmlCode[i]];
        else
            str = [str stringByReplacingOccurrencesOfString:htmlCode[i] withString:originCode[i]];
    }

    return str;
}
+(NSString *)getFilePath:(NSString *)filename
{
    NSString *filePath = nil;
//    filePath = [[EFormUtil getFormsDownloadedPath] stringByAppendingPathComponent:filename];
    filePath = [EFormUtil getFilePathFromMainBundle:filename];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath]) {
        NSString *message;
        message = [NSString stringWithFormat:@"the file %@ does not exist!",filename];
//        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Warning"
//                                                        message:message
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        [alert show];
        return nil;
    }
    
    return filePath;
    
}
+(NSString *)getFilePathFromMainBundle:(NSString *)filename
{
    NSString *path = nil;
    if (filename != nil) {
        path = [[NSBundle mainBundle] pathForResource:filename ofType:@""];
    }
    return path;
}
+(NSString *)getFilePathFromDocument:(NSString *)filename
{
    NSString *path = nil;
    if (filename != nil) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
        NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents directory
        path = [documentsDirectory stringByAppendingPathComponent:filename];
    }
    return path;
}
+ (BOOL)validatePolicyNumber:(NSString *)policyNumber {
    
    if ([policyNumber length] != 10) {
        return NO;
    }
    
    int p1 = (int)([policyNumber characterAtIndex:1] - '0');
    int p2 = (int)([policyNumber characterAtIndex:2] - '0');
    int p3 = (int)([policyNumber characterAtIndex:3] - '0');
    int p4 = (int)([policyNumber characterAtIndex:4] - '0');
    int p5 = (int)([policyNumber characterAtIndex:5] - '0');
    int p6 = (int)([policyNumber characterAtIndex:6] - '0');
    int p7 = (int)([policyNumber characterAtIndex:7] - '0');
    int p8 = (int)([policyNumber characterAtIndex:8] - '0');
    
    int checkDigit = 0;
    
    int x = (p1+p4+p7) * 3 + (p2+p5+p8) * 7 + (p3+p6);
    int n = x%10;
    
    if (n != 0) {
        checkDigit = 10-n;
    }
    
    if (checkDigit == (int)([policyNumber characterAtIndex:9] - '0')) {
        return YES;
    }    
    
    return NO;
}

#pragma mark PDF query utilities
/*
+(BOOL)areBIPDFUpdated{
    
    BOOL retVal = FALSE;
    
     NSString *formPath = [[[AIACoreDataManager DataManager] applicationDocumentsDirectory] stringByAppendingPathComponent:FORMS_FOLDER];
    
    NSString *downloadedPlistPath = [formPath stringByAppendingPathComponent:BI_PDF_DOWNLOADED_FILENAME];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:downloadedPlistPath]){
        
        NSString *masterPlistPath = [formPath stringByAppendingPathComponent:BI_PDF_MASTERLIST_FILENAME];
        
        
        NSMutableDictionary *masterlistData = [[NSMutableDictionary alloc] initWithContentsOfFile: masterPlistPath];
        NSMutableDictionary *downloadedListData = [[NSMutableDictionary alloc] initWithContentsOfFile: downloadedPlistPath];
        
        // if the same no need to update
        if ([[masterlistData objectForKey:KEY_VERSION] isEqualToString:[downloadedListData objectForKey:KEY_VERSION]]){
            retVal = TRUE;
        }
        
        [masterlistData release];
        [downloadedListData release];
        
    }
    
    return retVal;
    
}
 */
/*
+(BOOL)arePOSFormsUpdated{
    BOOL retVal = FALSE;
    
     NSString *formPath = [[[AIACoreDataManager DataManager] applicationDocumentsDirectory] stringByAppendingPathComponent:FORMS_FOLDER];
    
    NSString *downloadedPlistPath = [formPath stringByAppendingPathComponent:POS_PDF_DOWNLOADED_FILENAME];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:downloadedPlistPath]){
        
        NSString *masterPlistPath = [formPath stringByAppendingPathComponent:POS_PDF_MASTERLIST_FILENAME];
        
        NSMutableDictionary *masterlistData = [[NSMutableDictionary alloc] initWithContentsOfFile: masterPlistPath];
        NSMutableDictionary *downloadedListData = [[NSMutableDictionary alloc] initWithContentsOfFile: downloadedPlistPath];
        
        // if the same no need to update
        if ([[masterlistData objectForKey:KEY_VERSION] isEqualToString:[downloadedListData objectForKey:KEY_VERSION]]){
            retVal = TRUE;
        }
        
        [masterlistData release];
        [downloadedListData release];
        
    }
    
    return retVal;
}
 */
/*
+(BOOL)isFormPresentOnApplicationsDirectory: (NSString*)filename{
    BOOL retVal = FALSE;
    
    NSString *formPath = [[[AIACoreDataManager DataManager] applicationDocumentsDirectory] stringByAppendingPathComponent:FORMS_FOLDER];
    
    NSString *downloadedPath = [formPath stringByAppendingPathComponent:filename];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:downloadedPath]){
        
        retVal = TRUE;
        
    }
    
    return retVal;
}
*/
/*
+(NSString*)getFormsDownloadedPath{
    
    NSString *formPath = [[[AIACoreDataManager DataManager] applicationDocumentsDirectory] stringByAppendingPathComponent:FORMS_FOLDER];
    
    return formPath;
    
}
*/
+(NSInteger)roundUpFloatValue: (NSString*)stringNum{
    
    if ([stringNum floatValue] > [stringNum intValue]){
        return ([stringNum intValue] + 1);
    }
    
    return [stringNum intValue];
}

+ (NSString*)getAppVersion {
    NSString *str = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]; 
    
    return str;
}

//+ (NSString*)encodeURL:(NSString *)string{
//	NSString *newString = NSMakeCollectable([(NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)) autorelease]);
//	if (newString) {
//		return newString;
//	}
//	return @"";
//}

+(void)writeToLogFile:(NSString *)textToAppend{
    
//uncomment this if you need to write some logs
    
//    NSString *myFilePath = [[[AIACoreDataManager DataManager] applicationDocumentsDirectory] stringByAppendingPathComponent:@"integration_logfile.txt"];
//    
//    NSMutableString *myFileContents = [[NSMutableString alloc] initWithContentsOfFile:myFilePath encoding:NSUTF8StringEncoding error:nil];
//    
//    [myFileContents appendString:@"\n"];
//    [myFileContents appendString:[NSString stringWithFormat:@"%@: ", [NSDate date]]];
//    [myFileContents appendString:textToAppend];
//    
//    
//    if (![[NSFileManager defaultManager] fileExistsAtPath:myFilePath]) {
//        [[NSFileManager defaultManager] createFileAtPath:myFilePath contents:nil attributes:nil];
//    }
//    
//    // The main act.
//    [[myFileContents dataUsingEncoding:NSUTF8StringEncoding] writeToFile:myFilePath atomically:NO];
//    
//    [myFileContents release];
    
}

+(void)moveView:(UIView*)thisView withOffset:(int)offset{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    CGRect rect = thisView.frame;
    rect.origin.y -= offset;
    rect.size.height += offset;
    thisView.frame = rect;
    [UIView commitAnimations];
}

+(NSString *) formatNameWithFirstName:(NSString *) firstName middleName:(NSString *) middleName lastName:(NSString *) lastName isChinesse:(BOOL) isChinesse isCompany:(BOOL) isCompany
{
    if(isCompany)
    {
        return lastName;
    }
    if(isChinesse)
    {
        return lastName;
    }
    
    if([EFormUtil isNULL:lastName]||[EFormUtil isNULL:firstName]){
        return @"";
    }

    if([EFormUtil isNULL:middleName])
    {
        return [NSString stringWithFormat:@"%@, %@",lastName,firstName];
    }
    
    return [NSString stringWithFormat:@"%@, %@ %@",lastName,firstName,middleName];
}

+(NSString *) formatNameWithInital:(NSString *) inital andSuffix:(NSString *) suffix name:(NSString *)
 name
{
    if([EFormUtil isNULL:suffix])
    {
        return name;
    }else{
        return [NSString stringWithFormat:@"%@/%@",name,suffix];
    }
    
//    if(![EFormUtil isNULL:inital] && [EFormUtil isNULL:suffix]){
//        
//        return FORMAT(@"%@ .%@",name,inital);
//   
//    }else if([EFormUtil isNULL:inital] && ![EFormUtil isNULL:suffix]){
//    
//        return FORMAT(@"%@ /%@",name,suffix);
//   
//    }else if(![EFormUtil isNULL:inital] && ![EFormUtil isNULL:suffix]){
//        return FORMAT(@"%@ .%@/%@",name,inital,suffix);
//    }else{
//        return  name;
//    }
    
}

+(BOOL) isNULL:(NSString *) value
{
    if(value == nil || [value isEqualToString:@""])
    {
        return YES;
    }
    return NO;
}

@end
