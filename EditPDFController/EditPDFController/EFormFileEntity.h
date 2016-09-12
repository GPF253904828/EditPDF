//
//  EFormFileEntity.h
//  iPoS_IOS
//
//  Created by CIBWKLPMAC006 on 5/8/13.
//  Copyright (c) 2013 AIA Information Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EFormFileEntity : NSObject
{
    int pageCount;
    NSString *originFileName;
    NSString *eFormFileName;
    NSString *eFormFilePath;
    NSString *eFormConfigFileName;
    NSString *eFormXML;
    bool isGenerate;
    bool isConfig;
}
@property (nonatomic,retain) NSString *eFormXML;
@property bool isConfig;
@property bool isGenerate;
@property int pageCount;
@property (nonatomic,retain) NSString *eFormConfigFileName;
@property (nonatomic,retain) NSString *originFileName;
@property (nonatomic,retain) NSString *eFormFileName;
@property (nonatomic,retain) NSString *eFormFilePath;
@end
