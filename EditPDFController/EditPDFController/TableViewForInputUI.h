//
//  TableViewForInputUI.h
//  AIA
//
//  Created by aiait on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PdfTableView.h"
#import "EFormBaseView.h"
@interface TableViewForInputUI : PdfTableView
{
    NSMutableDictionary *_data;
}
@property(nonatomic,retain) NSMutableDictionary *data;
@property(nonatomic, retain) EFormBaseView *eFormBaseView;
@property(nonatomic,copy) NSString *currentForm;
-(NSMutableDictionary *) getUIData;
@end
