//
//  PdfTableView.h
//  AIA
//
//  Created by aiait on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdfTableCell.h"
#define DISPLAY_WIDTH       1024.0f
#define DISPLAY_HEIGHT      1454.0f
#define DISPLAY_SPACE       20.0f
#define BASETAG 100000

@interface PdfTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
{
    NSString *pdfUrl;
    NSMutableArray *_imageList;
    bool _isShowOriginSize;
}
@property (nonatomic, copy) NSString *deleageName;
@property bool isShowOriginSize;
@property(nonatomic,retain) NSString *pdfUrl;
+ (NSInteger)getPdfPageNumber:(NSString*)url;
- (id)initWithFrame:(CGRect)frame delegateName:(NSString *) iDelegateName andPDFUrl:(NSString *)pdfUrlString ownerName:(NSString *) iownerName;
@property (nonatomic, copy) NSString *ownerName;
@end
