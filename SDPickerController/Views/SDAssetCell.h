//
//  SDAssetCell.h
//  PickerController
//
//  Created by jglx on 16/11/25.
//  Copyright © 2016年 zj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

typedef enum : NSUInteger{
    SDAssetCellTypePhoto = 0,
    SDAssetCellTypeLivePhoto,
    SDAssetCellTypeVideo,
    SDAssetCellTypeAudio,
}SDAssetCellType;


@interface SDAssetCell : UICollectionViewCell

@property (nonatomic,strong)UIButton *selectBtn;
@property (nonatomic,strong)SDAssetModel * model;
@property (nonatomic,copy)void (^selectBtnBlock)(BOOL);
@property (nonatomic,assign)SDAssetCellType type;
@property (nonatomic,copy)NSString * representedAssetIdentifier;
@property (nonatomic,assign)PHImageRequestID imageRequestID;

@property (nonatomic,copy)NSString * photoSelImageName;
@property (nonatomic,copy)NSString * photoDefImageName;

@property (nonatomic,assign)NSInteger maxImageCount;

@property (nonatomic)BOOL photoBrowseSelect;

@end

//相机cell
@interface SDAssetCameraCell : UICollectionViewCell

@property (nonatomic,strong)UIImageView * cameraView;

@end

//相博分组cell
@interface SDAlbumCell : UITableViewCell
@property (nonatomic,strong)SDAlbumModel * model;
@property (nonatomic,strong)UILabel * groupTitleLabel;
@property (nonatomic,strong)UILabel * numberLabel;
@property (nonatomic,strong)UIView * lineView;

@end



