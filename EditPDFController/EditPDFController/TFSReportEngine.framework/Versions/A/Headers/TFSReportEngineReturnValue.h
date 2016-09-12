//
//  TFSReportEngineReturnValue.h
// TFSReportEngine_IOS
//
//  Created by adrian on 6/6/12.
//  Copyright (c) 2012 TF System Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFSReportEngineReturnValue : NSObject
{
	NSString *subreportVariable;
	NSString *toVariable;
	NSString *initialValueExpression;
}

@property (nonatomic, retain) NSString *subreportVariable;
@property (nonatomic, retain) NSString *toVariable;
@property (nonatomic, retain) NSString *initialValueExpression;

@end
