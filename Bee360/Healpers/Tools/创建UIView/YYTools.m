//
//  YYTools.m
//  lecai
//
//  Created by 房俊杰 on 15/7/27.
//  Copyright (c) 2015年 上海涵予信息科技有限公司. All rights reserved.
//

#import "YYTools.h"

CGFloat YYAdaptationFrame(CGFloat original)
{
    static dispatch_once_t onceToken;
    static CGFloat scale = 0;
    dispatch_once(&onceToken, ^{
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        scale = w / 320;
    });
//    return floor(scale * original);
    return (scale * original);
}

@implementation YYTools


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
                    andCornerRadius:(CGFloat)cornerRadius
{
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = frame;
    button.backgroundColor = bgColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    [button setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    button.titleLabel.font = font;
    [button addTarget:object action:sel forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    return button;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame
               andBackgroundColor:(UIColor *)bgColor
                          andText:(NSString *)text
                        textColor:(UIColor *)textColor
                 andTextAlignment:(NSTextAlignment)textAlignment
                          andFont:(UIFont *)font
                           andTag:(NSInteger)tag
                  andCornerRadius:(CGFloat)cornerRadius
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = bgColor;
    label.text = text;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.tag = tag;
    label.font = font;
    label.numberOfLines = 0;
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = cornerRadius;
    return label;
}
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                       andBackgroundColor:(UIColor *)bgColor
                                 andImage:(NSString *)image
                                andObject:(id)object
                                   andSEL:(SEL)sel
                                   andTag:(NSInteger)tag
                          andCornerRadius:(CGFloat)cornerRadius
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.backgroundColor = bgColor;
    if(image.length)
        imageView.image = [UIImage imageNamed:image];
    imageView.tag = tag;
    imageView.userInteractionEnabled = YES;
    if(object != nil)
    {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:object action:sel];
        [imageView addGestureRecognizer:tap];
    }
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = cornerRadius;
    return imageView;
}

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
                                   andTag:(NSInteger)tag
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.backgroundColor = bgColor;
    textField.delegate = delegate;
    textField.font = font;
    textField.text = text;
    textField.textColor = textColor;
    textField.tag = tag;
    textField.keyboardType = keyboardType;
    textField.returnKeyType = returnKeyType;
    textField.placeholder = placeholder;
    textField.layer.masksToBounds = YES;
    textField.borderStyle = borderStyle;
    return textField;
}
+ (UITextView *)createTextViewWithFrame:(CGRect)frame
                     andBackgroundColor:(UIColor *)bgColor
                                andText:(NSString *)text
                           andTextColor:(UIColor *)textColor
                                andFont:(UIFont *)font
                       andReturnKeyType:(UIReturnKeyType)returnKeyType
                            andDelegate:(id)delegate
                                 andTag:(NSInteger)tag
                        andCornerRadius:(CGFloat)cornerRadius
{
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.backgroundColor = bgColor;
    textView.text = text;
    textView.textColor = textColor;
    textView.font = font;
    textView.returnKeyType = returnKeyType;
    textView.delegate = delegate;
    textView.tag = tag;
    textView.layer.masksToBounds = YES;
    textView.layer.cornerRadius = cornerRadius;
    return textView;
}
+ (UIView *)createViewWithFrame:(CGRect)frame
             andBackgroundColor:(UIColor *)bgColor
                andCornerRadius:(CGFloat)cornerRadius
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = bgColor;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = cornerRadius;
    return view;
}

+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame
                         andBackgroundColor:(UIColor *)bgColor
                                    andSize:(CGSize)size
                           andPagingEnabled:(BOOL)pagingEnabled
                                andDelegate:(id)delegate
                                     andTag:(NSInteger)tag
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.backgroundColor = bgColor;
    scrollView.contentSize = size;
    scrollView.pagingEnabled = pagingEnabled;
    scrollView.delegate = delegate;
    scrollView.tag = tag;
    return scrollView;
}

+ (NSMutableArray *)initArray
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    return array;
}
+ (NSMutableDictionary *)initDictionary
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    return dictionary;
}

@end










































