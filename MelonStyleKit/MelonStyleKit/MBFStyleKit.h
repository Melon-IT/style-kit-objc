//
//  MBFStyleKit.h
//  MelonStyleKit
//
//  Created by Tomek Popis on 13/10/14.
//  Copyright (c) 2014 Melon IT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FontType) {
  FontTypeRegular
};

typedef NS_ENUM(NSUInteger, TextStyleType) {
  TextStyleTypeDefault
};

typedef NS_ENUM(NSUInteger, ColorStyleType) {
  ColorStyleTypeDefault
};

@interface MBFStyleKit : NSObject

+ (instancetype)defaultStyleKit;

+ (UIColor*)defaultColor;
+ (UIColor*)colorForStyleType:(ColorStyleType)colorType;
+ (UIColor*)colorForStyleType:(ColorStyleType)colorType withAlpha:(CGFloat)alpha;

+ (NSDictionary*)textAttributesForStyleType:(TextStyleType)styleType;
+ (NSDictionary*)textAttributesForStyleType:(TextStyleType)styleType
                               textAligment:(NSTextAlignment)textAligment;

@end
