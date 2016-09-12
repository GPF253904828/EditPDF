//
//  EFormBaseView.h
//  iPoS_IOS
//
//  Created by CIBWKLPMAC006 on 5/9/13.
//  Copyright (c) 2013 AIA Information Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EFormDataDelegate.h"
#import <UIKit/UIKit.h>

@class EFormUIImageView;
@interface EFormBaseView : NSObject <UITextViewDelegate>

@property (nonatomic, retain) NSMutableDictionary *configs;
@property (nonatomic, retain) id<EFormDataDelegate> dataDelegate;
@property (nonatomic, retain) NSMutableDictionary *groups;
@property (nonatomic, retain) NSMutableDictionary *children;

-(id) initWithConfig:(NSMutableDictionary *)iConfigs dataDelegateName:(NSString *)datadelegatName;
-(void) layoutWithView:(EFormUIImageView *)view andPageIndex:(int) pageIndex;
@end
