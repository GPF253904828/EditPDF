//
//  PdfTableCell.h
//  iPoS_IOS
//
//  Created by zhenhuan on 14-4-23.
//  Copyright (c) 2014年 AIA Information Technology (Beijing) Co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFormUIImageView.h"

@interface PdfTableCell : UITableViewCell
@property (nonatomic, retain) EFormUIImageView *imageView;

- (void) layoutPdfTableCellWithImage:(UIImage *)image withIndexPathRow:(NSInteger)row;

@end
