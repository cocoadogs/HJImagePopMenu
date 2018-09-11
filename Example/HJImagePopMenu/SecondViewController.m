//
//  SecondViewController.m
//  HJImagePopMenu_Example
//
//  Created by xujunhao on 2018/9/11.
//  Copyright © 2018年 cocoadogs. All rights reserved.
//

#import "SecondViewController.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <HJImagePopMenu/UIView+ImagePopMenu.h>
#import "UIColor+Hex.h"

@interface SecondViewController ()

@property (nonatomic, strong) UIButton *showBtn;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self buildUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Build Method

- (void)buildUI {
	self.view.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:self.showBtn];
	[self.showBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.center.equalTo(self.view);
		make.size.mas_equalTo(CGSizeMake(100, 40));
	}];
}

#pragma mark - Lazy Load Methods

- (UIButton *)showBtn {
	if (!_showBtn) {
		_showBtn = [[UIButton alloc] init];
		[_showBtn setTitle:@"选择" forState:UIControlStateNormal];
		[_showBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
		[_showBtn setBackgroundColor:[UIColor whiteColor]];
		_showBtn.layer.cornerRadius = 5.0f;
		_showBtn.layer.borderWidth = 0.5f;
		_showBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
		@weakify(self)
		[[_showBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
			@strongify(self)
			[self.view popImageSourceMenuWithTitleArray:@[@"拍照", @"从手机相册选择"] textColor:[UIColor colorWithHexString:@"#212C68"] font:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular] action:^(UIButton *button, NSInteger index) {
				NSLog(@"index = %@", @(index));
			}];
		}];
	}
	return _showBtn;
}

@end
