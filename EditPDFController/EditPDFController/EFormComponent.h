//
//  EFormComponent.h
//  iPoS_IOS
//
//  Created by CIBWKLPMAC006 on 5/10/13.
//  Copyright (c) 2013 AIA Information Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EFormComponent <NSObject>
@property (nonatomic, copy) NSString *compName;
@property (nonatomic, copy) NSString *groupID;
@property (nonatomic, retain) NSMutableArray *children;
@end
