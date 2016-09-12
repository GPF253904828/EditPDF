//
//  TableViewForInputUI.m
//  AIA
//
//  Created by aiait on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableViewForInputUI.h"
#import <QuartzCore/QuartzCore.h>
#import "EFormXMLEntity.h"
#import "EFormUIImageView.h"

@implementation TableViewForInputUI
@synthesize data  = _data;
@synthesize eFormBaseView;
@synthesize currentForm;

-(void)configCell:(UITableViewCell *)cell withRowAtIndexPath:(NSIndexPath *)indexPath andDataDelegateName:(NSString *) dataDelegateName
{
    EFormUIImageView *imageView = (EFormUIImageView *)[cell viewWithTag:BASETAG + indexPath.row + 1];
    imageView.isInputUI = true;
    imageView.userInteractionEnabled = YES;
    if(self.eFormBaseView == nil){
        //zhenhuan add autorelease to fix memory
        self.eFormBaseView = [[[EFormBaseView alloc] initWithConfig:self.data dataDelegateName:dataDelegateName] autorelease];
    }
    [self.eFormBaseView layoutWithView:imageView andPageIndex:(int)indexPath.row];
}


-(void)configCell:(UITableViewCell *)cell withRowAtIndexPath:(NSIndexPath *)indexPath
{
//    EFormUIImageView *imageView = (EFormUIImageView *)[cell viewWithTag:BASETAG + indexPath.row + 1];
//    imageView.isInputUI = true;
//    imageView.userInteractionEnabled = YES;
////    Class class= NSClassFromString(@"PAL_LAQUIObjects");
////    self.UIObjects = [[class alloc] initWithConfig:self.data];
//    [UIObjects layoutWithView:imageView];
}

-(NSMutableDictionary *) getUIData
{
    return self.eFormBaseView.configs;
}

-(void)dealloc
{
//    [UIObjects release];
    [_data release];
    [currentForm release];
    //zhenhuan add release to fix memory
    eFormBaseView = nil;
    [eFormBaseView release];
    [super dealloc];
}
@end
