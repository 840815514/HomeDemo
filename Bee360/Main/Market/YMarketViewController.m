//
//  YMarketViewController.m
//  Bee360
//
//  Created by 尤艺琪 on 2018/10/18.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#import "YMarketViewController.h"

@interface YMarketViewController ()

@end

@implementation YMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

@end
