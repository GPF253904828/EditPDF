//
//  TFSReportEngineVariables.h
// TFSReportEngine_IOS
//
//  Created by ZY on 2/11/12.
//  Copyright (c) 2012 TF System Sdn. Bhd. All rights reserved.
//

#define DOC_CONTAINER_POOL_SIZE		3 // size of pool that stores hpdf_docs

#import <Foundation/Foundation.h>
#import "TFSReportEngineDocContainer.h"

@interface TFSReportEngineVariables : NSObject
{
    int pageNo;
	int reportCount;
    NSMutableDictionary *calculationDictionary;
    NSMutableArray *currentDataSource;
    NSMutableDictionary *expressionDictionary;
	NSString *font;
	NSMutableDictionary *docStackDictionary;
	BOOL fontLoading;
	TFSReportEngineDocContainer *currentContainer;
	int fontCount;
	BOOL compression;
}

@property (nonatomic) int pageNo;
@property (nonatomic) int reportCount;
@property (nonatomic, retain) NSMutableDictionary *calculationDictionary;
@property (nonatomic, retain) NSMutableArray *currentDataSource;
@property (nonatomic, retain) NSMutableDictionary *expressionDictionary;
@property (nonatomic, retain) NSString *font;
@property (nonatomic, retain) TFSReportEngineDocContainer *currentContainer;
@property (nonatomic, retain) NSMutableDictionary *docStackDictionary;
@property (nonatomic) BOOL compression;

+ (TFSReportEngineVariables *) getInstance;

- (void) resetVariables;
- (NSMutableDictionary *) getDictionary;
- (void) setCalculation:(NSString *)calculation variable:(NSString *)variableName;
- (NSString *)getCalculation:(NSString *)variableName;
- (void)loadDocFont:(NSString *)fontName;
- (void)loadFont:(TFSReportEngineDocContainer *)container;
- (TFSReportEngineDocContainer *)getDocFontContainer:(NSString *)fontName;
- (void)replenishPool:(NSString *)fontName;

@end
