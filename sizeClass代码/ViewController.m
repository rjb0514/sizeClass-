//
//  ViewController.m
//  sizeClass代码
//
//  Created by 茹 on 16/8/21.
//  Copyright © 2016年 rujianbin. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

//表示 iphone 手机所有机型竖屏
#define isIphonePortrait(newCollection) ((newCollection).horizontalSizeClass == UIUserInterfaceSizeClassCompact && (newCollection).verticalSizeClass == UIUserInterfaceSizeClassRegular)

//表示 iphone手机所有机型横屏  除了iphone6 plus
#define isIphoneLandscape(newCollection) ((newCollection).verticalSizeClass == UIUserInterfaceSizeClassCompact && (newCollection).horizontalSizeClass == UIUserInterfaceSizeClassCompact)

//表示 iphone6 plus的横屏状态
#define isIphone6PlusLandscape(newCollection) ((newCollection).verticalSizeClass == UIUserInterfaceSizeClassCompact && (newCollection).horizontalSizeClass == UIUserInterfaceSizeClassRegular)

//表示 Ipad 的横竖屏状态
#define isIpad(newCollection) ((newCollection).verticalSizeClass == UIUserInterfaceSizeClassRegular && (newCollection).horizontalSizeClass == UIUserInterfaceSizeClassRegular)
@interface ViewController ()
///播放按钮
@property (nonatomic, strong) UIButton *palyBtn;
///上以首按钮
@property (nonatomic, strong) UIButton *previousBtn;
///下一首按钮
@property (nonatomic, strong) UIButton *nextBtn;
///底部视图
@property (nonatomic, strong) UIView *bottomView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self setupUI];
    
   
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupUI];

}
#pragma mark -创建UI
- (void)setupUI {
    //创建底部视图
    _bottomView = [[UIView alloc]init];
    _bottomView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_bottomView];
    //播放按钮
    _palyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_palyBtn setImage:[UIImage imageNamed:@"player_btn_play_normal"] forState:UIControlStateNormal];
    [_palyBtn setImage:[UIImage imageNamed:@"player_btn_play_highlight"] forState:UIControlStateHighlighted];
    [_palyBtn setImage:[UIImage imageNamed:@"player_btn_pause_highlight"] forState:UIControlStateSelected];
    [_bottomView addSubview:_palyBtn];
    //上一首按钮
    _previousBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_previousBtn setImage:[UIImage imageNamed:@"player_btn_pre_normal"] forState:UIControlStateNormal];
    [_previousBtn setImage:[UIImage imageNamed:@"player_btn_pre_highlight"] forState:UIControlStateHighlighted];
    [_bottomView addSubview:_previousBtn];
    //下一首
    _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_nextBtn setImage:[UIImage imageNamed:@"player_btn_next_normal"] forState:UIControlStateNormal];
    [_nextBtn setImage:[UIImage imageNamed:@"player_btn_next_highlight"] forState:UIControlStateHighlighted];
    [_bottomView addSubview:_nextBtn];
    
    
    //判断设备的SizeClasses
    if (isIphonePortrait(self.traitCollection)) {
        NSLog(@"iphone 竖屏");
        //设置底部视图的约束
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.height.equalTo(@(120));
        }];
        //设置播放按钮的约束
        [_palyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_bottomView.mas_centerX);
            make.bottom.equalTo(_bottomView.mas_bottom).offset(-8);
        }];
        //上一首按钮
        [_previousBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_palyBtn.mas_centerY);
            make.right.equalTo(_palyBtn.mas_left).offset(-30);
        }];
        //下一首
        [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_palyBtn.mas_centerY);
            make.left.equalTo(_palyBtn.mas_right).offset(30);
        }];
        
    } else if(isIpad(self.traitCollection)){
        
    } else if (isIphoneLandscape(self.traitCollection)){
        //横屏时启动时的布局设定
        NSLog(@"iphone 横屏");
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.height.equalTo(@(60));
        }];
        
    }else if (isIphoneLandscape(self.traitCollection)){
        
        //横屏时启动时的布局设定
        NSLog(@"iphone 6 plus 横屏");
    }
}
#pragma mark -控件的布局
- (void)layoutChildView {
    

}



// trait 变化时会调用
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    
}

// trait 变化时会调用
-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super willTransitionToTraitCollection:newCollection
                 withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
     {
         if (isIphonePortrait(self.traitCollection)) {
             
             //写布局内容的改变 无改变就不用写
             
             NSLog(@"iphone 竖屏");
             [_bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                 make.left.right.bottom.equalTo(self.view);
                 make.height.equalTo(@(120));
             }];
             
             //设置播放按钮的约束
             [_palyBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
                 make.centerX.equalTo(_bottomView.mas_centerX);
                 make.bottom.equalTo(_bottomView.mas_bottom).offset(-8);
             }];
             //上一首按钮
             [_previousBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
                 make.centerY.equalTo(_palyBtn.mas_centerY);
                 make.right.equalTo(_palyBtn.mas_left).offset(-30);
             }];
             //下一首
             [_nextBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
                 make.centerY.equalTo(_palyBtn.mas_centerY);
                 make.left.equalTo(_palyBtn.mas_right).offset(30);
             }];

             
         }else if(isIpad(self.traitCollection)){
             
             //写布局内容的改变 无改变就不用写
             NSLog(@"ipad");
             
         }else if (isIphoneLandscape(self.traitCollection)){
             
             //写布局内容的改变 无改变就不用写
             NSLog(@"iphone 横屏");
             [_bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                 make.left.right.bottom.equalTo(self.view);
                 make.height.equalTo(@(60));
             }];
             //上一首按钮
             [_previousBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
                 make.centerY.equalTo(_bottomView.mas_centerY);
                 make.left.equalTo(_bottomView.mas_left).offset(50);
                 make.width.height.equalTo(@(30));
             }];
             //设置播放按钮的约束
             [_palyBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
                 make.centerY.equalTo(_previousBtn.mas_centerY);
                 make.left.equalTo(_previousBtn.mas_right).equalTo(@(20));
                 make.width.height.equalTo(@(30));
             }];
            
             //下一首
             [_nextBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
                 make.centerY.equalTo(_previousBtn.mas_centerY);
                 make.left.equalTo(_palyBtn.mas_right).offset(30);
                 make.width.height.equalTo(@(30));
             }];

             
             
         }else if (isIphone6PlusLandscape(self.traitCollection)){
             
             //写布局内容的改变 无改变就不用写
             NSLog(@"iphone 6 plus 横屏");
             
         }
         
         [self.view setNeedsLayout];
     } completion:nil];
}


@end
