//
//  BaseViewController.h
//  Lottery
//
//  Created by admin on 2018/3/19.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "MBProgressHUD.h"
#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic, strong) MBProgressHUD* myHud;
@property (nonatomic, assign) NSInteger indexNumber;

//
//- (void)configureRightNavigationItemWithTarget:(id)target action:(SEL)action image:(UIImage *)image;
//- (void)configureRightNavigationItemWithTarget:(id)target action:(SEL)action title:(NSString *)title;

/**
 *  提示正在加载中，带进度动画，必须调用关闭方法hideLoading
 */
- (void)showLoading;
- (void)showLoadingMsg:(NSString*)msg;
/**
 *  关闭正在加载中进度动画
 */
- (void)hideLoading;

/**
 *  显示提示文字, 显示3秒后自动消失
 *
 *  @param alertMsg 提示内容
 */
- (void)showAlert:(NSString*)alertMsg;
/**
 *  显示提示文字, 显示3秒后自动消失
 *
 *  @param alertMsg 提示内容
 */
- (void)showMessage:(NSString*)alertMsg;
/**
 *  显示成功提示
 *
 *  @param sucMsg 提示文字
 */
- (void)showSuc:(NSString*)sucMsg;

/***显示失败提示*/
- (void)showFail:(NSString*)failMsg;
/***  色值转图片*/
- (UIImage *)imageWithColor:(UIColor *)color ;


- (BOOL)isMobileNumber:(NSString *)mobileNum;

-(BOOL)checkUserID:(NSString *)userID;

-(BOOL)isBankCard:(NSString *)cardNumber;

#pragma mark ---比较时间
- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSString *)anotherDayStr;

@end
