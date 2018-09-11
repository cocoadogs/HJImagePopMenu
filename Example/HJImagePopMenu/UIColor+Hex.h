//
//  UIColor+Hex.h
//  HJImagePopMenu
//
//  Created by cocoadogs on 09/11/2018.
//  Copyright (c) 2018 cocoadogs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexNumber:(NSUInteger)hexColor;

@end
