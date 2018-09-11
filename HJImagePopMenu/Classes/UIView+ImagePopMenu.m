//
//  UIView+ImagePopMenu.m
//  HJImagePopMenu
//
//  Created by xujunhao on 2018/9/11.
//

#import "UIView+ImagePopMenu.h"
#import <objc/runtime.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <POP/POP.h>

#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height

static NSString *keyOfMethod_imageSource; //关联者的索引key-用于获取block

@implementation UIView (ImagePopMenu)
UIView *backgroudView_avatar;
UIView *bottomView_avatar;
CGFloat height_menu;

- (void)popImageSourceMenuWithTitleArray:(NSArray *)titleArray
							   textColor:(UIColor *)textColor
									font:(UIFont *)font
								  action:(HJImageSourcePopMenuAction)action {
	backgroudView_avatar = [[UIView alloc] initWithFrame:self.window.bounds];
	backgroudView_avatar.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
	[self.window addSubview:backgroudView_avatar];
	
	UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
	recognizer.numberOfTouchesRequired = 1;
	[[recognizer rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
		[UIView animateWithDuration:0.25 animations:^{
			backgroudView_avatar.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
			bottomView_avatar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, height_menu+50);
		} completion:^(BOOL finished) {
			[backgroudView_avatar removeFromSuperview];
			[bottomView_avatar removeFromSuperview];
		}];
	}];
	[backgroudView_avatar addGestureRecognizer:recognizer];
	NSInteger count = titleArray.count;
	height_menu = (count+1)*50 + (count-1)*0.5 + 10;
	
	bottomView_avatar = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, height_menu)];
	bottomView_avatar.backgroundColor = [UIColor whiteColor];
	[self.window addSubview:bottomView_avatar];
	
	for (NSInteger i = 0; i < titleArray.count; i++) {
		UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, i * 50.5, SCREEN_WIDTH, 50)];
		[btn setTitle:titleArray[i] forState:UIControlStateNormal];
		btn.tag = 10000 + i;
		btn.titleLabel.font = font;
		[btn setTitleColor:textColor forState:UIControlStateNormal];
		objc_setAssociatedObject(btn, &keyOfMethod_imageSource, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
		[[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
			btn.backgroundColor = [UIColor clearColor];
			HJImageSourcePopMenuAction action = (HJImageSourcePopMenuAction)objc_getAssociatedObject(btn, &keyOfMethod_imageSource);
			[UIView animateWithDuration:0.25 animations:^{
				backgroudView_avatar.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
				bottomView_avatar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, height_menu+50);
			} completion:^(BOOL finished) {
				[backgroudView_avatar removeFromSuperview];
				[bottomView_avatar removeFromSuperview];
				if (action) {
					action(btn, btn.tag - 10000);
				}
			}];
		}];
		[bottomView_avatar addSubview:btn];
		if (i != (count-1)) {
			UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame), SCREEN_WIDTH, 0.5)];
			line.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f];
			[bottomView_avatar addSubview:line];
		}
	}
	
	UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, count*50.5-0.5, SCREEN_WIDTH, 10)];
	line.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1.0f];
	[bottomView_avatar addSubview:line];
	
	UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line.frame), SCREEN_WIDTH, 50)];
	[btn setTitle:@"取消" forState:UIControlStateNormal];
	[btn setTitleColor:textColor forState:UIControlStateNormal];
	btn.titleLabel.font = font;
	[bottomView_avatar addSubview:btn];
	[[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
		[UIView animateWithDuration:0.25 animations:^{
			backgroudView_avatar.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
			bottomView_avatar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, height_menu+50);
		} completion:^(BOOL finished) {
			[backgroudView_avatar removeFromSuperview];
			[bottomView_avatar removeFromSuperview];
		}];
	}];
	
	POPSpringAnimation *anSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
	anSpring.toValue = @(bottomView_avatar.center.y-height_menu);
	//    anSpring.springBounciness = 7.0f;
	//	anSpring.springSpeed = 10.0f;
	anSpring.springBounciness = 0;
	anSpring.springSpeed = 20;
	[bottomView_avatar pop_addAnimation:anSpring forKey:@"position"];
	
	[UIView animateWithDuration:0.3 animations:^{
		backgroudView_avatar.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
	} completion:^(BOOL finished) {
		
	}];
}

@end
