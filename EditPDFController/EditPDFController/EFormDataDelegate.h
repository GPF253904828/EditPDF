//
//  EFormDataDelegate.h
//  iPoS_IOS
//
//  Created by CIBWKLPMAC006 on 5/10/13.
//  Copyright (c) 2013 AIA Information Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "EFormEntity.h"
@protocol EFormDataDelegate <NSObject>
@optional
- (NSMutableDictionary *)autoPopulateValue;
- (NSMutableDictionary *)defaultValue;
@end
