//
//  PhotoAlbumView.h
//  PickerController
//
//  Created by jglx on 16/11/25.
//  Copyright © 2016年 zj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReloadCollectionaViewBlock)(SDAlbumModel * model);

@interface PhotoAlbumView : UIView

@property (nonatomic,strong)NSMutableArray * albumData;

@property (nonatomic,copy)ReloadCollectionaViewBlock reloadCollectionaViewBlock;

-(void)showPhotoAlbum:(UIView *)view;

-(void)dismiss;

@end
