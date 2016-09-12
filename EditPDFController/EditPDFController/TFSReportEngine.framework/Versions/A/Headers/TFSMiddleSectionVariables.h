//
//  SQSTFSMiddleSectionVariables.h
// TFSReportEngine_IOS
//
//  Created by adrian on 1/4/12.
//  Copyright 2012 TF System Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFSReportEngineReport.h"

@interface TFSMiddleSectionVariables : NSObject
{
	int top_margin;
	int bottom_margin;
	int left_margin;
	int y_position;
	int band_start_y;
	int page_count;
	BOOL subtractedTitle;
	int available_space;
	int start_y;
	int end_y;
	int group_y;
	TFSReportEngineReport *report;
	NSMutableArray *groups;
	int last_page_footer_page;
	int parent_report_total_pages;
	BOOL use_last_page_footer;
}

@property (nonatomic) int top_margin;
@property (nonatomic) int bottom_margin;
@property (nonatomic) int left_margin;
@property (nonatomic) int y_position;
@property (nonatomic) int band_start_y;
@property (nonatomic) int page_count;
@property (nonatomic) BOOL subtractedTitle;
@property (nonatomic) int available_space;
@property (nonatomic) int start_y;
@property (nonatomic) int end_y;
@property (nonatomic) int group_y;
@property (nonatomic, retain) TFSReportEngineReport *report;
@property (nonatomic, retain) NSMutableArray *groups;
@property (nonatomic) int last_page_footer_page;
@property (nonatomic) int parent_report_total_pages;
@property (nonatomic) BOOL use_last_page_footer;

@end
