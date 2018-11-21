//
//  YLoginViewController.m
//  Bee360
//
//  Created by 尤艺琪 on 2018/10/19.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#import "YLoginViewController.h"
#import "YLoginBtnView.h"


@interface YLoginViewController ()
@property (nonatomic, strong) UIButton *regBtn;
@property (nonatomic, strong) UIImageView *welcomeImv;
@property (nonatomic, strong) UILabel *welcomeLbl;
@property (nonatomic, strong) UITextField *phoneTxt;
@property (nonatomic, strong) UIImageView *phoneLineImv;
@property (nonatomic, strong) UITextField *pwdTxt;
@property (nonatomic, strong) UILabel *pLbl;
@property (nonatomic, strong) UIImageView *pwdLineImv;
@property (nonatomic, strong) UIButton *forgetBtn;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *chooseBtn;
@property (nonatomic, strong) UILabel *delegateLbl;
@property (nonatomic, strong) YLoginBtnView *weChatBtn;
@end

@implementation YLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

#pragma mark -- 公共方法



#pragma mark --- 私有方法
//设置页面
- (void)setupUI {
    [self.view addSubview:self.regBtn];
    [self.view addSubview:self.welcomeImv];
    [self.view addSubview:self.welcomeLbl];
    [self.view addSubview:self.phoneTxt];
    [self.view addSubview:self.phoneLineImv];
    [self.view addSubview:self.pwdTxt];
    [self.view addSubview:self.pLbl];
    [self.view addSubview:self.pwdLineImv];
    [self.view addSubview:self.forgetBtn];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.chooseBtn];
    [self.view addSubview:self.delegateLbl];
    [self.view addSubview:self.weChatBtn];
    
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tap1];
}

//点击空白处的手势要实现的方法
-(void)viewTapped:(UITapGestureRecognizer*)tap1
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 懒加载
- (UIButton *)regBtn {
    if(_regBtn == nil) {
        _regBtn = [[UIButton alloc]initWithFrame:CGRectMake(20*WADAPTER, 40*HADAPTER, 56*WADAPTER, 30*HADAPTER)];
        [_regBtn setTitle:@"前去注册" forState:0];
        [_regBtn setTitleColor:[UIColor colorWithRed:0.31 green:0.32 blue:0.96 alpha:1] forState:0];
        _regBtn.titleLabel.font = XMFontOfSize(14);
    }
    return _regBtn;
}
- (UIImageView *)welcomeImv {
    if(_welcomeImv == nil) {
        _welcomeImv = [[UIImageView alloc]initWithFrame:CGRectMake(20*WADAPTER, 97*HADAPTER, 118*WADAPTER, 32*HADAPTER)];
        _welcomeImv.backgroundColor = [UIColor orangeColor];
    }
    return _welcomeImv;
}
- (UILabel *)welcomeLbl {
    if(_welcomeLbl == nil) {
        _welcomeLbl = [[UILabel alloc]initWithFrame:CGRectMake(20*WADAPTER, 146*HADAPTER, 162*WADAPTER, 21*HADAPTER)];
        _welcomeLbl.text = @"欢迎登陆 bee360";
        _welcomeLbl.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        _welcomeLbl.font = XMFontOfSize(20);
    }
    return _welcomeLbl;
}
- (UITextField *)phoneTxt {
    if(_phoneTxt == nil) {
        
    }
    return _phoneTxt;
}
- (UIImageView *)phoneLineImv {
    if(_phoneLineImv == nil) {
        
    }
    return _phoneLineImv;
}
- (UITextField *)pwdTxt {
    if(_pwdTxt == nil) {
        
    }
    return _pwdTxt;
}
- (UILabel *)pLbl {
    if(_pLbl == nil) {
        
    }
    return _pLbl;
}
- (UIImageView *)pwdLineImv {
    if(_pwdLineImv == nil) {
        
    }
    return _pwdLineImv;
}
- (UIButton *)forgetBtn {
    if(_forgetBtn == nil) {
        
    }
    return _forgetBtn;
}
- (UIButton *)loginBtn {
    if(_loginBtn == nil) {
        
    }
    return _loginBtn;
}
- (UIButton *)chooseBtn {
    if(_chooseBtn == nil) {
        
    }
    return _chooseBtn;
}
- (UILabel *)delegateLbl {
    if(_delegateLbl == nil) {
        
    }
    return _delegateLbl;
}
- (YLoginBtnView *)weChatBtn {
    if(_weChatBtn == nil) {
        
    }
    return _weChatBtn;
}
@end
