//
//  SDAssetModel.h
//  PickerController
//
//  Created by jglx on 16/11/23.
//  Copyright © 2016年 zj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SDAssetModelTypePhoto = 0,
    SDAssetModelTypeLivePhoto,
    SDAssetModelTypeVideo,
    SDAssetModelTypeAudio
}SDAssetModelType;

@class PHAsset;

@interface SDAssetModel : NSObject

@property (nonatomic,strong) id asset; //PHAsset 和 ALAsset 类型

@property (nonatomic,assign) BOOL isSelected;

@property (nonatomic,assign) SDAssetModelType type;

@property (nonatomic,copy) NSString * timeLength;

+ (instancetype)modelWithAsset:(id)asset type:(SDAssetModelType)type;

+ (instancetype)modelWithAsset:(id)asset type:(SDAssetModelType)type timeLength:(NSString *)timeLength;

@end

@class PHFetchResult;

@interface SDAlbumModel : NSObject

@property (nonatomic,strong) NSString * name; // 分组名

@property (nonatomic,assign) NSInteger count;

@property (nonatomic,strong) id result; // PHAsset 和 ALAsset类型

@property (nonatomic,strong) NSArray *models;

@property (nonatomic,strong) NSArray * selectedModels;

@property (nonatomic,assign) NSUInteger selectedCount;

@end
