//
//  BaseViewController.m
//  Lottery
//
//  Created by admin on 2018/3/19.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"
#import "YYTools.h"
#import "UIViewController+BarButton.h"
#import "BaseTabBarViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = BGColor;
    
    
    /**  设置导航条 **/
//     [self configureNavigationItem];
    
    /** 添加手势，为了关闭键盘的操作 **/
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
}
//-(void)viewWillAppear:(BOOL)animated {
////    self.navigationItem.leftBarButtonItem = nil;
////
//}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//#pragma mark  设置导航条
//- (void)configureNavigationItem
//{
//    self.navigationController.navigationBar.translucent = NO;
//    self.tabBarController.tabBar.translucent = NO;
//
//    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:kNavBarColor] forBarMetrics:(UIBarMetricsDefault)];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kNavTitleColor,NSFontAttributeName:kNavTitleFont}];
//    [self configureBackNavigationItem];
//}
//#pragma mark - 导航栏左边返回按钮
//- (void)configureBackNavigationItem {
//     [self addLeftBarButtonWithImage:[UIImage imageNamed:@"white_back_icon"] action:@selector(backClick:)];
//}
//-(void)backClick:(UIButton *)btn {
//    if(self.indexNumber == 101) {
//        [self.navigationController popToRootViewControllerAnimated:NO];
//        //                    //第二步，更改tabber的selected
//        BaseTabBarViewController *root = (BaseTabBarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//        [root setSelectedIndex:3];
//    }
//    else if(self.indexNumber == 102) {
//        [self.navigationController popToRootViewControllerAnimated:YES];
//    }
//    else {
//      [self.navigationController popViewControllerAnimated:YES];
//    }
//}
//#pragma mark - 导航条右边按钮 图片式
//- (void)configureRightNavigationItemWithTarget:(id)target action:(SEL)action image:(UIImage *)image {
//
//    [self addRightBarButtonWithFirstImage:image action:action];
//}
//- (void)configureRightNavigationItemWithTarget:(id)target action:(SEL)action title:(NSString *)title {
//    [self addRightBarButtonItemWithTitle:title action:action];
//}


//点击空白处的手势要实现的方法
-(void)viewTapped:(UITapGestureRecognizer*)tap1
{
    [self.view endEditing:YES];
}



/**
 *  提示正在加载中，带进度动画，必须调用关闭方法hideLoading
 */
- (void)showLoading
{
    //如果提示器未隐藏， 则先隐藏提示器
    if (![self.myHud isHidden]) {
        [self.myHud hideAnimated:YES];
        self.myHud = nil;
    }
    //显示提示器
    self.myHud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    self.myHud.mode = MBProgressHUDModeIndeterminate;
    self.myHud.detailsLabel.textColor = [UIColor whiteColor];
    self.myHud.detailsLabel.font = XMFontOfSize(16);
    self.myHud.bezelView.color = [UIColor blackColor];
    [self.myHud setActivityIndicatorColor:[UIColor whiteColor]];
    self.myHud.detailsLabel.text = @"正在加载...";
}

/**
 *  提示正在加载中，带进度动画，必须调用关闭方法hideLoading
 */
- (void)showLoadingMsg:(NSString*)msg
{
    //如果提示器未隐藏， 则先隐藏提示器
    if (![self.myHud isHidden]) {
        [self.myHud hideAnimated:YES];
        self.myHud = nil;
    }
    //显示提示器
    self.myHud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    self.myHud.mode = MBProgressHUDModeIndeterminate;
    self.myHud.detailsLabel.textColor = [UIColor whiteColor];
    self.myHud.detailsLabel.font = XMFontOfSize(16);
    self.myHud.bezelView.color = [UIColor blackColor];
    //提示器字体和菊花颜色
    self.myHud.contentColor =[UIColor whiteColor];
//    [self.myHud setActivityIndicatorColor:[UIColor whiteColor]];
    self.myHud.detailsLabel.text = msg;
    self.myHud.detailsLabel.font = XMFontOfSize(16);
}

/**
 *  关闭正在加载中进度动画
 */
- (void)hideLoading
{
    //如果提示器未隐藏， 则先隐藏提示器
    if (![self.myHud isHidden]) {
        [self.myHud hideAnimated:YES];
        self.myHud = nil;
    }
}
/**
 *  纯文本方式显示提示文字, 显示3秒后自动消失
 *
 *  @param alertMsg 提示内容
 */
- (void)showAlert:(NSString*)alertMsg
{
    //如果提示器未隐藏， 则先隐藏提示器
    if (![self.myHud isHidden]) {
        [self.myHud hideAnimated:YES];
        self.myHud = nil;
    }
    //显示提示器
    self.myHud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    //显示纯文本方式
    self.myHud.mode = MBProgressHUDModeText;
    
    self.myHud.bezelView.color = [UIColor blackColor];
    self.myHud.detailsLabel.text = alertMsg;
    self.myHud.detailsLabel.font = XMFontOfSize(16);
    self.myHud.detailsLabel.textColor = [UIColor whiteColor];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        // Do something...
        [self.myHud hideAnimated:YES];
    });
}

- (void)showMessage:(NSString *)alertMsg
{
    //如果提示器未隐藏， 则先隐藏提示器
    if (![self.myHud isHidden]) {
        [self.myHud hideAnimated:YES];
        self.myHud = nil;
    }
    //显示提示器
    self.myHud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    //显示纯文本方式
    self.myHud.mode = MBProgressHUDModeText;
    
    self.myHud.bezelView.color = [UIColor blackColor];
    self.myHud.detailsLabel.text = alertMsg;
    self.myHud.detailsLabel.font = XMFontOfSize(16);
    self.myHud.detailsLabel.textColor = [UIColor whiteColor];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2.5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        // Do something...
        [self.myHud hideAnimated:YES];
    });
}
/**
 *  显示成功提示, 有对勾图片
 *
 *  @param sucMsg 提示文字
 */
- (void)showSuc:(NSString*)sucMsg
{
    //如果提示器未隐藏， 则先隐藏提示器
    if (![self.myHud isHidden]) {
        [self.myHud hideAnimated:YES];
        self.myHud = nil;
    }
    //显示提示器
    self.myHud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    //显示自定义图片加文本方式显示
    self.myHud.detailsLabel.text = sucMsg;
    self.myHud.detailsLabel.font = XMFontOfSize(16);
    self.myHud.bezelView.color = [UIColor blackColor];
    self.myHud.detailsLabel.textColor = [UIColor whiteColor];
    self.myHud.mode = MBProgressHUDModeCustomView;
    //可以设置对应的图片；
    self.myHud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2.5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        // Do something...
        [self.myHud hideAnimated:YES];
    });
}

/**
 *  显示失败提示
 *
 *  @param sucMsg 提示文字
 */
- (void)showFail:(NSString*)failMsg
{
    //如果提示器未隐藏， 则先隐藏提示器
    if (![self.myHud isHidden]) {
        [self.myHud hideAnimated:YES];
        self.myHud = nil;
    }
    //显示提示器
    self.myHud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    //显示自定义图片加文本方式显示
    
    self.myHud.detailsLabel.text = failMsg;
    self.myHud.detailsLabel.font = XMFontOfSize(16);
    self.myHud.detailsLabel.textColor = [UIColor whiteColor];
    self.myHud.bezelView.color = [UIColor blackColor];
    self.myHud.mode = MBProgressHUDModeCustomView;
    //可以设置对应的图片；
    self.myHud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error"]];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2.5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        
        [self.myHud hideAnimated:YES];
    });
}

/*图片转为颜色*/
- (UIImage*)imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark  ----------判断电话号码的正则表达式
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[03678])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(17[8])|(18[2-4,7-8]))\\d{8}|(170[5])\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"^((13[0-2])|(145)|(15[5-6])|(17[156])|(18[5,6]))\\d{8}|(170[4,7-9])\\d{7}$";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"^((133)|(149)|(153)|(17[3,7])|(18[0,1,9]))\\d{8}|(170[0-2])\\d{7}$";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
#pragma mark-验证身份证号码正则

-(BOOL)checkUserID:(NSString *)userID
{
    //长度不为18的都排除掉
    if (userID.length!=18) {
        return NO;
    }
    
    //校验格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL flag = [identityCardPredicate evaluateWithObject:userID];
    
    if (!flag) {
        return flag;    //格式错误
    }else {
        //格式正确在判断是否合法
        
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++)
        {
            NSInteger subStrIndex = [[userID substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            
            idCardWiSum+= subStrIndex * idCardWiIndex;
            
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [userID substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2)
        {
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
            {
                return YES;
            }else
            {
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
    }
}
////正则匹配用户身份证号15或18位
//-(BOOL)validateIDCardNumber:(NSString *)value {
//
//    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    NSInteger length =0;
//    if (!value) {
//        return NO;
//    }else {
//        length = value.length;
//        //不满足15位和18位，即身份证错误
//        if (length !=15 && length !=18) {
//            return NO;
//        }
//    }
//    // 省份代码
//    NSArray *areasArray = @[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
//
//    // 检测省份身份行政区代码
//    NSString *valueStart2 = [value substringToIndex:2];
//    BOOL areaFlag =NO; //标识省份代码是否正确
//    for (NSString *areaCode in areasArray) {
//        if ([areaCode isEqualToString:valueStart2]) {
//            areaFlag =YES;
//            break;
//        }
//    }
//
//    if (!areaFlag) {
//        return NO;
//    }
//
//    NSRegularExpression *regularExpression;
//    NSUInteger numberofMatch;
//
//    int year =0;
//    //分为15位、18位身份证进行校验
//    switch (length) {
//        case 15:
//            //获取年份对应的数字
//            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
//
//            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
//                //创建正则表达式 NSRegularExpressionCaseInsensitive：不区分字母大小写的模式
//                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
//                                                                        options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
//            }else {
//                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
//                                                                        options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
//            }
//            //使用正则表达式匹配字符串 NSMatchingReportProgress:找到最长的匹配字符串后调用block回调
//            numberofMatch = [regularExpression numberOfMatchesInString:value
//                                                               options:NSMatchingReportProgress
//                                                                 range:NSMakeRange(0, value.length)];
//
//            if(numberofMatch >0) {
//                return YES;
//            }else {
//                return NO;
//            }
//        case 18:
//            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
//            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
//                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
//            }else {
//                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
//            }
//            numberofMatch = [regularExpression numberOfMatchesInString:value
//                                                               options:NSMatchingReportProgress
//                                                                 range:NSMakeRange(0, value.length)];
//
//
//            if(numberofMatch >0) {
//                //1：校验码的计算方法 身份证号码17位数分别乘以不同的系数。从第一位到第十七位的系数分别为：7－9－10－5－8－4－2－1－6－3－7－9－10－5－8－4－2。将这17位数字和系数相乘的结果相加。
//
//                int S = [value substringWithRange:NSMakeRange(0,1)].intValue*7 + [value substringWithRange:NSMakeRange(10,1)].intValue *7 + [value substringWithRange:NSMakeRange(1,1)].intValue*9 + [value substringWithRange:NSMakeRange(11,1)].intValue *9 + [value substringWithRange:NSMakeRange(2,1)].intValue*10 + [value substringWithRange:NSMakeRange(12,1)].intValue *10 + [value substringWithRange:NSMakeRange(3,1)].intValue*5 + [value substringWithRange:NSMakeRange(13,1)].intValue *5 + [value substringWithRange:NSMakeRange(4,1)].intValue*8 + [value substringWithRange:NSMakeRange(14,1)].intValue *8 + [value substringWithRange:NSMakeRange(5,1)].intValue*4 + [value substringWithRange:NSMakeRange(15,1)].intValue *4 + [value substringWithRange:NSMakeRange(6,1)].intValue*2 + [value substringWithRange:NSMakeRange(16,1)].intValue *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
//
//                //2：用加出来和除以11，看余数是多少？余数只可能有0－1－2－3－4－5－6－7－8－9－10这11个数字
//                int Y = S %11;
//                NSString *M =@"F";
//                NSString *JYM =@"10X98765432";
//                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 3：获取校验位
//                //4：检测ID的校验位
//                if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
//                    return YES;
//                }else {
//                    return NO;
//                }
//
//            }else {
//                return NO;
//            }
//        default:
//            return NO;
//    }
//}
#pragma mark 判断银行卡号是否合法
-(BOOL)isBankCard:(NSString *)cardNumber{
    if(cardNumber.length==0){
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < cardNumber.length; i++){
        c = [cardNumber characterAtIndex:i];
        if (isdigit(c)){
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--){
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo){
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

#pragma mark ---比较时间
- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSString *)anotherDayStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    //  NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    //  NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedAscending){
        return 1;
    }
    return 0;
}

@end
