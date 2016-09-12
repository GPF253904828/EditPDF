//
//  PdfTableCell.m
//  iPoS_IOS
//
//  Created by zhenhuan on 14-4-23.
//  Copyright (c) 2014年 AIA Information Technology (Beijing) Co. All rights reserved.
//

#import "PdfTableCell.h"

#define TAG 100000

@implementation PdfTableCell
@synthesize imageView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) layoutPdfTableCellWithImage:(UIImage *)image withIndexPathRow:(NSInteger)row
{
    self.imageView = [[EFormUIImageView alloc]initWithImage:nil];
    imageView.image = image;
    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    imageView.tag = TAG +  row + 1;

    [self addSubview:imageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
