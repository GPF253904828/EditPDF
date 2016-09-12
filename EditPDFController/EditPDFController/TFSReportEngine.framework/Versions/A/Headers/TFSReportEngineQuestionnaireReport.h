//
//  TFSReportEngineQuestionnaireReport.h
//  iPoS_IOS
//
//  Created by adrian on 5/1/12.
//  Copyright (c) 2012 Treasure Frontier System Sdn. Bhd. All rights reserved.
//

#import "TFSReportEngineReport.h"
#import "TFSReportEngineGroup.h"

@interface TFSReportEngineQuestionnaireReport : TFSReportEngineReport
{
	TFSReportEngineGroup *group;
}

- (id)initWithTitle:(NSString *)title_;
- (void)insertInsuredHeader:(NSString *)insuredName;
- (void)insertBand:(TFSReportEngineBand *)band;
- (void)insertBands:(NSMutableArray *)bands;
- (void)insertReport:(NSString *)fileName;

@end
