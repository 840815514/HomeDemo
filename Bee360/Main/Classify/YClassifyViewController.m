//
//  YClassifyViewController.m
//  Bee360
//
//  Created by 尤艺琪 on 2018/10/18.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#import "YClassifyViewController.h"

@interface YClassifyViewController ()

@end

@implementation YClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
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
