//
//  CategorySeries.h
// TFSReportEngine_IOS
//
//  Created by adrian on 2/7/12.
//  Copyright 2012 TF System Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CorePlot-CocoaTouch.h"

@interface CategorySeries : NSObject
{
	NSString *seriesExpression;
	NSString *categoryExpression;
	NSString *valueExpression;
	CPTColor *cptColor;
	CPTPlotSymbol *cptPlotSymbol;
	NSMutableArray *values;
}

@property (nonatomic, retain) NSString *seriesExpression;
@property (nonatomic, retain) NSString *categoryExpression;
@property (nonatomic, retain) NSString *valueExpression;
@property (nonatomic, retain) CPTColor *cptColor;
@property (nonatomic, retain) CPTPlotSymbol *cptPlotSymbol;
@property (nonatomic, retain) NSMutableArray *values;

- (id)init:(NSString *)seriesExpression_ categoryExpression:(NSString *)categoryExpression_ valueExpression:(NSString *)valueExpression_;

@end
