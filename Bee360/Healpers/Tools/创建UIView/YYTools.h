//
//  YYTools.h
//  lecai
//
//  Created by 房俊杰 on 15/7/27.
//  Copyright (c) 2015年 上海涵予信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGFloat YYAdaptationFrame(CGFloat original);

@interface YYTools : UIView
/**
 *  初始化数组
 */
+ (NSMutableArray *)initArray;
/**
 *  初始化字典
 */
+ (NSMutableDictionary *)initDictionary;

/**
 *  创建按钮button
 */
+ (UIButton *)createButtonWithFrame:(CGRect)frame
                            andType:(UIButtonType)buttonType
                 andBackgroundColor:(UIColor *)bgColor
                           andTitle:(NSString *)title
                      andTitleColor:(UIColor *)titleColor
                   andSelectedTitle:(NSString *)selectedTitle
              andSelectedTitleColor:(UIColor *)selectedTitleColor
                           andImage:(NSString *)image
                   andSelectedImage:(NSString *)selectedImage
                            andFont:(UIFont *)font
                          andObject:(id)object
                             andSEL:(SEL)sel
                             andTag:(NSInteger)tag
                    andCornerRadius:(CGFloat)cornerRadius;
/**
 *  创建label
 */
+ (UILabel *)createLabelWithFrame:(CGRect)frame
               andBackgroundColor:(UIColor *)bgColor
                          andText:(NSString *)text
                        textColor:(UIColor *)textColor
                 andTextAlignment:(NSTextAlignment)textAlignment
                          andFont:(UIFont *)font
                           andTag:(NSInteger)tag
                  andCornerRadius:(CGFloat)cornerRadius;
/**
 *  创建imageView
 */
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                       andBackgroundColor:(UIColor *)bgColor
                                 andImage:(NSString *)image
                                andObject:(id)object
                                   andSEL:(SEL)sel
                                   andTag:(NSInteger)tag
                          andCornerRadius:(CGFloat)cornerRadius;
/**
 *  创建textField
 */
+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                       andBackgroundColor:(UIColor *)bgColor
                                  andText:(NSString *)text
                             andTextColor:(UIColor *)textColor
                                  andFont:(UIFont *)font
                           andPlaceholder:(NSString *)placeholder
                         andReturnKeyType:(UIReturnKeyType)returnKeyType
                          andKeyBoardType:(UIKeyboardType)keyboardType
                       andTextBorderStyle:(UITextBorderStyle)borderStyle
                              andDelegate:(id)delegate
                                   andTag:(NSInteger)tag;
/**
 *  创建textView
 */
+ (UITextView *)createTextViewWithFrame:(CGRect)frame
                     andBackgroundColor:(UIColor *)bgColor
                                andText:(NSString *)text
                           andTextColor:(UIColor *)textColor
                                andFont:(UIFont *)font
                       andReturnKeyType:(UIReturnKeyType)returnKeyType
                            andDelegate:(id)delegate
                                 andTag:(NSInteger)tag
                        andCornerRadius:(CGFloat)cornerRadius;

/**
 *  创建view
 */
+ (UIView *)createViewWithFrame:(CGRect)frame
             andBackgroundColor:(UIColor *)bgColor
                andCornerRadius:(CGFloat)cornerRadius;
/**
 *  创建scrollView
 */
+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame
                         andBackgroundColor:(UIColor *)bgColor
                                    andSize:(CGSize)size
                           andPagingEnabled:(BOOL)pagingEnabled
                                andDelegate:(id)delegate
                                     andTag:(NSInteger)tag;




@end











































