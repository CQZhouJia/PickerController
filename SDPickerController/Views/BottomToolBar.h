//
//  BottomToolBar.h
//  PickerController
//
//  Created by jglx on 16/11/25.
//  Copyright © 2016年 zj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ToolBarBtnBlock)(UIButton * btn);

@interface BottomToolBar : UIView

@property (nonatomic,copy)NSString * titlePhoto;

@property (nonatomic,strong)ToolBarBtnBlock toolBarBtnBlock;
@property (nonatomic,strong)UIButton * doneBtn;
@property (nonatomic,strong)UILabel  * numberLable;
@property (nonatomic,strong)UIImageView * numberView;
@property (nonatomic,strong)UIButton *photoAlbumBtn;

/**
 刷新ToolBar 状态
 */
-(void)refreshToolBarStatus:(NSInteger)selectedCount;

@end
