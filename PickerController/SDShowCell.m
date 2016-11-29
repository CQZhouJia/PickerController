//
//  SDShowCell.m
//  PickerController
//
//  Created by jglx on 16/11/28.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "SDShowCell.h"

@implementation SDShowCell

-(instancetype)initWithFrame:(CGRect)frame{
   
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    _bottomView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:_bottomView];
    
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.clipsToBounds = YES;
    [self addSubview:_imageView];
}



@end
