//
//  TFSJasperUtil.h
// TFSReportEngine_IOS
//
//  Created by adrian on 6/4/12.
//  Copyright (c) 2012 TF System Sdn. Bhd. All rights reserved.
//

#define JASPER_SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)getInstance \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
} \
\
- (id)retain \
{ \
return self; \
} \
\
- (NSUInteger)retainCount \
{ \
return NSUIntegerMax; \
} \
\
- (oneway void)release \
{ \
} \
\
- (id)autorelease \
{ \
return self; \
}


#import <Foundation/Foundation.h>

@interface TFSJasperUtil : NSObject

+ (NSString *)applicationDocumentsDirectory;
+ (id<UIApplicationDelegate>) getAppDelegate;

@end
