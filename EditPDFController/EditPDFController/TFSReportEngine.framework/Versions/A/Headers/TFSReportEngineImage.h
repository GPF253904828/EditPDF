//
//  TFSReportEngineImage.h
//  XMLBooks
//
//  Created by mark on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFSReportEngineElement.h"

@interface TFSReportEngineImage : TFSReportEngineElement
{
	NSString *imageName;
}

@property (nonatomic,retain) NSString *imageName;
- (void) parseXML:(TBXMLElement *)element parameters:(NSDictionary *)parameters;
- (id) copyWithZone:(NSZone *)zone;

@end
