//
//  ViewController.m
//  PickerController
//
//  Created by jglx on 16/11/23.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "ViewController.h"
#import "SDImagePicker.h"
#import "SDImagePickerController.h"
#import "SDShowCell.h"

@interface ViewController ()<SDImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)NSMutableArray * photosArray;  // 保存用户选择的图片
@property (nonatomic,strong)NSMutableArray * isSelectedPhotoArray; // 保存用户已经选中的asstest

@property (nonatomic,strong)UICollectionView * collectionView; // 仅仅用来展示选中的图片

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * addBtn = [[UIButton alloc] init];
    addBtn.backgroundColor = [UIColor redColor];
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    addBtn.frame = CGRectMake((WIDTH - 120 -30)/2.f, 90, 60, 60);
    [addBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    UIButton * deleteBtn = [[UIButton alloc] init];
    deleteBtn.backgroundColor = [UIColor redColor];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    deleteBtn.frame = CGRectMake(CGRectGetMaxX(addBtn.frame) + 30, 90, 60, 60);
    [deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteBtn];
    [self createUI];
    
}

-(void)deleteBtnClick:(UIButton *)sender{
    [_isSelectedPhotoArray removeAllObjects];
    [_photosArray removeAllObjects];
    [_collectionView reloadData];
}

-(void)click:(UIButton *)sender{
    SDImagePickerController * pickerController = [[SDImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:3 delegate:self];
    UINavigationController * pickerNav = [[UINavigationController alloc] initWithRootViewController:pickerController];
    if (_isSelectedPhotoArray.count != 0) {
        pickerController.selectedAssets  = _isSelectedPhotoArray;
    }
    //最小选择数
    pickerController.minImagesCount = 1;
    pickerController.photoPreviewMaxWidth = 600;
    //是否显示相机
    pickerController.cameraBtn = YES;
    //排序方式
    pickerController.sortAscendingByModificationDate = NO;
    //相册选择
    pickerController.pickingImage = YES;
    
//    pickerController.browserSelect = YES 游览选择暂时没做,后续整
//    pickerController.pickingVideo = NO 选择视频
    
    [self.navigationController presentViewController:pickerNav animated:YES completion:nil];
}

#pragma --SDImagePickControllerDelegate--
-(void)imagePickerController:(SDImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto{
    _photosArray = [NSMutableArray arrayWithArray:photos];
    _isSelectedPhotoArray = [NSMutableArray arrayWithArray:assets];
    [_collectionView reloadData];
}

-(void)imagePickerController:(SDImagePickerController *)picker selectedCamera:(id)info{
  NSLog(@"你点击的是拍照按钮,")
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _photosArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    SDShowCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SDShowCell" forIndexPath:indexPath];
    cell.imageView.image = _photosArray[indexPath.row];
    return  cell;
}

-(void)createUI{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat margin = 2;
    CGFloat itemWH = (WIDTH - 2 * margin)/3;
    layout.itemSize = CGSizeMake(itemWH, itemWH);
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 244, WIDTH, HEIGHT - 244) collectionViewLayout:layout];
    _collectionView.backgroundColor = UIColorFromRGB(0x697787);
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[SDShowCell class] forCellWithReuseIdentifier:@"SDShowCell"];
    
}


@end
