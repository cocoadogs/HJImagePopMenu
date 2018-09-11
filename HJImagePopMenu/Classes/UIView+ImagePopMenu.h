//
//  UIView+ImagePopMenu.h
//  HJImagePopMenu
//
//  Created by xujunhao on 2018/9/11.
//  仿照微信图片弹出选择菜单

#import <UIKit/UIKit.h>

typedef void (^HJImageSourcePopMenuAction)(UIButton *button, NSInteger index);

@interface UIView (ImagePopMenu)

- (void)popImageSourceMenuWithTitleArray:(NSArray *)titleArray
							   textColor:(UIColor *)textColor
									font:(UIFont *)font
								  action:(HJImageSourcePopMenuAction)action;


@end
