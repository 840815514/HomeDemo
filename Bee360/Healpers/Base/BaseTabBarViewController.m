//
//  BaseTabBarViewController.m
//  Lottery
//
//  Created by admin on 2018/3/19.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseNavViewController.h"
#import "YLoginViewController.h"
@interface BaseTabBarViewController ()<UITabBarDelegate,UITabBarControllerDelegate>


@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self createSystemTabBar];
}


#pragma mark - 系统tabBar
- (void)createSystemTabBar
{    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RootTabBar" ofType:@"plist"];
    NSArray *pArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *vcArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [pArray count]; i++) {
        NSDictionary *dic = pArray[i];
        NSString *vcString = [dic objectForKey:@"controller"];
        Class class = NSClassFromString(vcString);
        UIViewController *vc = [[class alloc]init];
        
        UITabBarItem *tbi = [[UITabBarItem alloc] initWithTitle:[dic objectForKey:@"title"] image:[UIImage imageNamed:[dic objectForKey:@"icon"]] selectedImage:[UIImage imageNamed:[dic objectForKey:@"icon_sel"]]];
        tbi.selectedImage =[[UIImage imageNamed:[dic objectForKey:@"icon_sel"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tbi.tag = 1000+i+1;
        [tbi setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIColor colorWithRed:0.44 green:0.44 blue:0.44 alpha:1],NSForegroundColorAttributeName,
                                     [UIFont systemFontOfSize:11], NSFontAttributeName,
                                     nil] forState:UIControlStateNormal];
        
        [tbi setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIColor colorWithRed:0.33 green:0.6 blue:0.97 alpha:1],NSForegroundColorAttributeName,
                                     [UIFont systemFontOfSize:11], NSFontAttributeName,
                                     nil] forState:UIControlStateSelected];
        //        tbi.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        vc.tabBarItem = tbi;
        
        BaseNavViewController *nc = [[BaseNavViewController alloc] initWithRootViewController:vc];
        [vcArray addObject:nc];
    }
    self.viewControllers = vcArray;
    self.tabBar.barTintColor =  [UIColor whiteColor];//背景色
  //  self.tabBar.tintColor = MainColor;//渲染色
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.layer.shadowColor = [UIColor blackColor].CGColor;
    self.tabBar.layer.shadowRadius = 3;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -0.6);
    self.tabBar.layer.shadowOpacity = 0.2;
}




/**
 *  去除系统自带的Tabbar上面那条线
 */
- (void)removeTabbarTopLine
{
    if(!IOS8)
    {
        for (UIView* barLine in self.tabBar.subviews)
        {
            if([barLine isKindOfClass:[UIImageView class]])
            {
                [barLine removeFromSuperview];
            }
        }
    }
}
/**
 *  去除系统自带的SelectionIndicatorImage
 */
- (void)removeSelectionIndicatorImage
{
    if (!IOS8)
    {
        for (UIView *barButton in  self.tabBar.subviews)
        {
            if ([barButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
            {
                for (UIView *view in barButton.subviews)
                {
                    if ([view isKindOfClass:NSClassFromString(@"UITabBarSelectionIndicatorView")])
                    {
                        view.hidden = YES;
                        view.tag = 1;
                        [view removeFromSuperview];
                        break;
                    }
                }
            }
        }
    }
}


//***点击我的菜单模块   不跳转   模态出新的页面***//
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if(tabBarController.tabBar.selectedItem.tag == 1003) {
        return NO;
    }
    else {
        return YES;
    }
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if(item.tag == 1003) {
        YLoginViewController *loginVC = [[YLoginViewController alloc]init];
        [self presentViewController:loginVC animated:YES completion:nil];
    }
}

//#pragma mark ---------懒加载
//-(NSArray *)barTitleArr {
//    if(_barTitleArr == nil) {
//        _barTitleArr = @[@"Home", @"NetWorth", @"Informs", @"Me"];
//    }
//    return _barTitleArr;
//}
//
//-(NSMutableArray *)barArr {
//    if (_barArr == nil) {
//        for (int i=0; i<[self.barTitleArr count]; i++) {
//            UITabBarItem *tbi = [[UITabBarItem alloc] initWithTitle:self.barTitleArr[i] image:[UIImage imageNamed:self.barTitleArr[i]] selectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_sel",self.barTitleArr[i]]]];
//            tbi.selectedImage =[[UIImage imageNamed:[NSString stringWithFormat:@"%@_sel",self.barTitleArr[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//            [tbi setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                         [UIColor colorWithRed:0.57f green:0.57f blue:0.57f alpha:1.00f],NSBackgroundColorAttributeName,
//                                         [UIFont systemFontOfSize:11], NSFontAttributeName,
//                                         nil] forState:UIControlStateNormal];
//            
//            [tbi setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                         [UIColor colorWithRed:0.22 green:0.80 blue:0.39 alpha:1.00],NSForegroundColorAttributeName,
//                                         [UIFont systemFontOfSize:11], NSFontAttributeName,
//                                         nil] forState:UIControlStateSelected];
//            [_barArr addObject:tbi];
//        }
//    }
//    return _barArr;
//}
@end
