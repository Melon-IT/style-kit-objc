//
//  MBFStyleKit.m
//  MelonStyleKit
//
//  Created by Tomek Popis on 13/10/14.
//  Copyright (c) 2014 Melon IT. All rights reserved.
//

#import "MBFStyleKit.h"

NSString* const STYLE_KIT_FONT_FAMILY_NAME_REGULAR = @"";

@implementation MBFStyleKit


+ (instancetype)defaultStyleKit {
  static MBFStyleKit* sharedInstance;
  static dispatch_once_t token;
  
  dispatch_once(&token,^{
    sharedInstance = [self new];
  });
  
  return sharedInstance;
}

- (instancetype)init {
  self = [super init];
  
  if(self != nil) {
  }
  
  return self;
}


+ (UIColor*)defaultColor {
  
  return [self colorForStyleType:ColorStyleTypeDefault];
}

+ (UIColor *)colorForStyleType:(ColorStyleType)colorType withAlpha:(CGFloat)alpha {
  UIColor* resultColor;
  
  switch (colorType) {
      
    case ColorStyleTypeDefault: {
      resultColor = [[UIColor alloc] initWithWhite:1 alpha:alpha];
      break;
    }
  }
  
  return resultColor;
}

+ (UIColor*)colorForStyleType:(ColorStyleType)colorType {
  
  return [self colorForStyleType:colorType withAlpha:1.0];
}

+ (UIFont*)fontForType:(FontType)fontType withSize:(NSUInteger)size {
  
  UIFont* font;
  NSString* fontName;
  
  switch (fontType) {
      
    case FontTypeRegular: {
      fontName = STYLE_KIT_FONT_FAMILY_NAME_REGULAR;
      
      break;
    }
  }
  
  font = [UIFont fontWithName:fontName size:size];
  
  return font;
}

+ (NSMutableParagraphStyle*)makeParagraphStyleWithSpacing:(CGFloat)spacing
                                                 aligment:(NSInteger)aligment
                                            lineBreakMode:(NSInteger)lineBreakMode
                                              lineSpacing:(CGFloat)lineSpacing {
  
  NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc] init];
  
  paragraphStyle.paragraphSpacing = spacing;
  paragraphStyle.alignment = aligment;
  paragraphStyle.lineBreakMode = lineBreakMode;
  paragraphStyle.lineSpacing = 1;
  
  return paragraphStyle;
}


+ (NSMutableDictionary*)makeStyleWithFontType:(FontType)fontWeight
                                     fontSize:(NSUInteger)fontSize
                                    textColor:(UIColor*)textColor
                               paragraphStyle:(NSMutableParagraphStyle*)paragraphStyle {
  
  NSMutableDictionary* textStyle =
  [NSMutableDictionary dictionaryWithCapacity:10];
  
  textStyle[NSParagraphStyleAttributeName] = paragraphStyle;
  
  
  textStyle[NSFontAttributeName] =
  [self fontForType:fontWeight withSize:fontSize];
  
  textStyle[NSForegroundColorAttributeName] = textColor;
  
  
  return textStyle;
}

+ (NSDictionary*)textAttributesForStyleType:(TextStyleType)styleType {
  
  return [self textAttributesForStyleType:styleType
                             textAligment:NSTextAlignmentNatural];
}

+ (NSDictionary*)textAttributesForStyleType:(TextStyleType)styleType
                               textAligment:(NSTextAlignment)textAligment {
  
  NSMutableDictionary* textStyle;
  NSMutableParagraphStyle* paragraphStyle;
  
  switch(styleType) {
      
    case TextStyleTypeDefault: {
      paragraphStyle = [self makeParagraphStyleWithSpacing:0
                                                  aligment:NSTextAlignmentLeft
                                             lineBreakMode:0 lineSpacing:1];
      
      textStyle =
      [self makeStyleWithFontType:FontTypeRegular
                         fontSize:10
                        textColor:[self colorForStyleType:ColorStyleTypeDefault]
                   paragraphStyle:paragraphStyle];
      
      break;
    }
  }
  
  if(textAligment != NSTextAlignmentNatural) {
    [textStyle[NSParagraphStyleAttributeName] setAlignment:textAligment];
  }
  
  return textStyle;
}

@end
