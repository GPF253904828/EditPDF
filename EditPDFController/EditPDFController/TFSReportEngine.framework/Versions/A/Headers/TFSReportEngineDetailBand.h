//
//  SQSTFSJasperDetailBand.h
//  XMLBooks
//
//  Created by mark on 10/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFSReportEngineBand.h"

@interface TFSReportEngineDetailBand : TFSReportEngineBand
{
	NSMutableArray *dataSources;
}

@property (nonatomic, retain) NSMutableArray *dataSources;

- (void) setDataSources:(NSMutableArray *)dataArray;
- (int) getTotalRow;

@end
