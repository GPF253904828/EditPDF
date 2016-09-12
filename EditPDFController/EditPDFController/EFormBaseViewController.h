//
//  EFormBaseViewController.h
//  AIA
//
//  Created by aiait on 2/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "EFormUtil.h"
@interface EFormBaseViewController : UIViewController

//+(NSDate *)getDateWith:(NSString *)day andMonth:(NSString *)month andYear:(NSString *)year;
//- (void)formatDateWithDay:(UITextField *)day andMonth:(UITextField *)months
//                  andYear:(UITextField *)year;
+(EFormBaseViewController *)sharedInstance;
@end
