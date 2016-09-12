//
//  SQSTFSJasperChart.h
// TFSReportEngine_IOS
//
//  Created by adrian on 2/7/12.
//  Copyright 2012 TF System Sdn. Bhd. All rights reserved.
//

#import "TFSReportEngineElement.h"

@interface TFSReportEngineChart : TFSReportEngineElement
{
	NSString *chartTitle;
	NSString *categoryAxisLabel;
	NSString *valueAxisLabel;
	NSMutableArray *categorySeriesArray;
}

@property (nonatomic, retain) NSString *chartTitle;
@property (nonatomic, retain) NSString *categoryAxisLabel;
@property (nonatomic, retain) NSString *valueAxisLabel;
@property (nonatomic, retain) NSMutableArray *categorySeriesArray;

- (void) parseXML:(TBXMLElement *)element parameters:(NSDictionary *)parameters datasource:(NSMutableArray *)datasource variables:(NSDictionary *)variables;
- (void) convertToJpeg;
- (id) copyWithZone:(NSZone *)zone;

@end
