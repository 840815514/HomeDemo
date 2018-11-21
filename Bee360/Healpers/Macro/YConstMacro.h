//
//  YConstMacro.h
//  Bee360
//
//  Created by 尤艺琪 on 2018/10/18.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#ifndef YConstMacro_h
#define YConstMacro_h
//生产环境
//#define prefix_com_url  @"http://api.jihe-tech.com:9191/"
//测试环境
#define prefix_com_url  @"http://api-dev.jihe-tech.com/"


// 1.判断是否为iOS7
#define IOS5 ([UIDevice currentDevice].systemVersion.floatValue >= 5)
#define IOS6 ([UIDevice currentDevice].systemVersion.floatValue >= 6)
#define IOS7 ([UIDevice currentDevice].systemVersion.floatValue >= 7)
#define IOS8 ([UIDevice currentDevice].systemVersion.floatValue >= 8)
#define Version [[UIDevice currentDevice].systemVersion doubleValue]
#define ViewController_BackGround [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1.0]//视图控制器背景颜色

//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断是否是iPhone SE
#define iPhoneSE ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1336), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone 6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone 6p
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPHoneXr
#define iPhone_Xrs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1624), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPHoneXr
#define iPhone_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXs
#define iPhone_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define iPhone_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT ((iPhoneX || iPhone_Xr || iPhone_Xs || iPhone_Xs_Max || iPhone_Xrs) ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT 44.f
// tabBar高度
#define TAB_BAR_HEIGHT ((iPhoneX || iPhone_Xr || iPhone_Xs || iPhone_Xs_Max || iPhone_Xrs) ? (49.f+34.f) : 49.f)
// home indicator高度
#define HOME_INDICATOR_HEIGHT ((iPhoneX || iPhone_Xr || iPhone_Xs || iPhone_Xs_Max || iPhone_Xrs) ? 34.f : 0.f)
/**  获取屏幕宽高  */
#define WADAPTER ([UIScreen mainScreen].bounds.size.width/375.0)
#define HADAPTER ([UIScreen mainScreen].bounds.size.height/667.0)
//屏幕宽度
#define V_W ([UIScreen mainScreen].bounds.size.width)
//屏幕高度
#define V_H ([UIScreen mainScreen].bounds.size.height)
#define BGColor [UIColor whiteColor]
//导航栏相关颜色
#define kTabBarColor [UIColor colorWithRed:0.86 green:0.26 blue:0.26 alpha:1.00] //系统默认色
//(r:0.86 g:0.26 b:0.26 a:1.00)
#define kNavBarColor [UIColor colorWithRed:0.86 green:0.26 blue:0.26 alpha:1.00] //系统默认色
#define kNavTitleColor [UIColor whiteColor] //控制器标题颜色
//字体、大小
#define XMFontOfSize(SIZE) [UIFont fontWithName:@"PingFangSC-Regular" size:((SIZE) * WADAPTER)]
//加粗字体
#define Thickening(SIZE) [UIFont fontWithName:@"PingFangSC-Medium" size:((SIZE) * WADAPTER)]
//控件位置
#define FrameCGRectMake(x,y,w,h)  CGRectMake(x*WADAPTER, y*HADAPTER, w*WADAPTER, h*HADAPTER)
//颜色
#define COLOR(r,g,b,a)   [UIColor colorWithRed:r green:g blue:b alpha:a]
#define kColorWithRGBA(r, g, b, a)[UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kColorWithRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]



/**保存用户的唯一识别码**/
#define Token [[NSUserDefaults standardUserDefaults]objectForKey:@"UID"]
/**去除输入框两边的空格**/
#define GetTRIMStr(Str) [Str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]

#define FormarGray  [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1]
#define SelectBlue  [UIColor colorWithRed:0.2 green:0.63 blue:0.95 alpha:1]

#define MYBlue   [UIColor colorWithRed:0.20 green:0.63 blue:0.95 alpha:1]
#define MYGray87   [UIColor colorWithRed:0.87 green:0.87 blue:0.87 alpha:1]
#define MYGray96   [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1]
#define MYGray06   [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1]
#define MYGray04   [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1]
#define MYblack   [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1]

//左右item的文字颜色
#define kNavItemNormalColor [UIColor blackColor]
#define kNavItemHighColor kColor(89, 89, 89)
#define kNavItemDisableColor kColor(238, 238, 238)

//导航栏title字体大小
#define kNavTitleFont [UIFont boldSystemFontOfSize:17] //控制器标题大小
#define kNavItemTitleFont [UIFont systemFontOfSize:15] //左右item的文字大小

//左右item的文字颜色
#define kNavItemNormalColor [UIColor blackColor]
#define kNavItemHighColor kColor(89, 89, 89)
#define kNavItemDisableColor kColor(238, 238, 238)

//导航栏title字体大小
#define kNavTitleFont [UIFont boldSystemFontOfSize:17] //控制器标题大小
#define kNavItemTitleFont [UIFont systemFontOfSize:15] //左右item的文字大小

//控制键盘弹出造成的遮挡，界面上移所用的宏
#define ORIGINAL_MAX_WIDTH 640.0f
#define MARGIN_KEYBOARD 10

#endif /* YConstMacro_h */
