//
//  YHomeViewController.m
//  Bee360
//
//  Created by 尤艺琪 on 2018/10/18.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#import "YHomeViewController.h"
#import "Masonry.h"
#import "UIImage+imgaeWithColor.h"


#define oriOfftY -244*HADAPTER
#define oriHeight 200*HADAPTER

@interface YHomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, copy) NSArray *listArr;
@property (nonatomic, strong) UIView *headerBgView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *sectionView;
@end

@implementation YHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    //设置页面
    [self setupUI];
}

#pragma mark 设置导航条
- (void)setupNavBar {
    // 设置导航栏的背景
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 取消掉底部的那根线
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    //设置标题
    UILabel *title = [[UILabel alloc] init];
    title.text = @"主页";
    [title sizeToFit];
    // 开始的时候看不见，所以alpha值为0
    title.textColor = [UIColor colorWithWhite:0 alpha:0];
    self.navigationItem.titleView = title;
}


#pragma mark 设置页面
- (void)setupUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    //当调用contentInset会自动调用scrollViewDidScroll
    
    
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.sectionView];
    [self.sectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).mas_equalTo(0);
        make.left.equalTo(self.headerView.mas_left).mas_equalTo(0);
        make.right.equalTo(self.headerView.mas_right).mas_equalTo(0);
        make.height.mas_equalTo(44*HADAPTER);
        
    }];
}


#pragma mark scrollView的delegate

#pragma mark - scrollview
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f", scrollView.contentOffset.y);
    CGFloat offset = scrollView.contentOffset.y - oriOfftY;
    
    CGFloat imgH = oriHeight - offset;
    if (imgH < NAVIGATION_BAR_HEIGHT) {
        imgH = NAVIGATION_BAR_HEIGHT;
    }
    CGRect frame = self.headerView.frame;
    frame.size.height = imgH;
    self.headerView.frame = frame;
    
    //根据透明度来生成图片
    //找最大值/
    CGFloat alpha = offset * 1 / 136.0;   // (200 - 64) / 136.0f
    if (alpha >= 1) {
        alpha = 0.99;
    }
    
    //拿到标题 标题文字的随着移动高度的变化而变化
    UILabel *titleL = (UILabel *)self.navigationItem.titleView;
    titleL.textColor = [UIColor colorWithWhite:0 alpha:alpha];
    
    //把颜色生成图片
    UIColor *alphaColor = [UIColor colorWithWhite:1 alpha:alpha];
    //把颜色生成图片
    UIImage *alphaImage = [UIImage imageWithColor:alphaColor];
    //修改导航条背景图片
    [self.navigationController.navigationBar setBackgroundImage:alphaImage forBarMetrics:UIBarMetricsDefault];
    
    
}



#pragma mark   delegate，datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"cell";
    //给一个cell做标记
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //cell 为空的时候 ,需要创建 ,即:第一次创建,之后就不用创建了
    if(nil== cell) {
        //初始化一个UITableViewCellStyleDefault 是不显示 副标题的
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.detailTextLabel.text= self.listArr[indexPath.row];//副标题
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40*HADAPTER;
}



#pragma mark 懒加载
-(NSArray *)listArr {
    if(_listArr == nil) {
        _listArr = @[@"1",@"2",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5"];
    }
    return _listArr;
}
-(UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, V_W, V_H-TAB_BAR_HEIGHT-STATUS_BAR_HEIGHT)];
        _tableView.contentInset = UIEdgeInsetsMake(244*HADAPTER, 0, 0, 0);
        _tableView.backgroundColor = [UIColor orangeColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //多余的cell不显示
        _tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}
-(UIView *)headerView {
    if(_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, V_W, 200*HADAPTER)];
        _headerView.backgroundColor = [UIColor yellowColor];
    }
    return _headerView;
}
-(UIView *)sectionView {
    if(_sectionView == nil) {
        _sectionView = [[UIView alloc]init];
        _sectionView.backgroundColor = [UIColor blueColor];
    }
    return _sectionView;
}
@end






////
////  YHomeViewController.m
////  Bee360
////
////  Created by 尤艺琪 on 2018/10/18.
////  Copyright © 2018年 尤艺琪. All rights reserved.
////
//
//#import "YHomeViewController.h"
//#import "Masonry.h"
//#define oriOfftY -244*HADAPTER
//#define oriHeight 200*HADAPTER
//
//
//
//@interface YHomeViewController ()<UITableViewDelegate, UITableViewDataSource>
//@property (nonatomic, copy) NSArray *listArr;
//@property (nonatomic, strong) UIView *searchView;
//@property (nonatomic, strong) UIView *headerBgView;
//@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong) UIView *headerView;
//@property (nonatomic, strong) UIView *sectionView;
//@end
//
//@implementation YHomeViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    //设置页面
//    [self setupUI];
//}
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//}
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
//}
//
//
//- (void)setupUI {
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self.view addSubview:self.tableView];
//    //当调用contentInset会自动调用scrollViewDidScroll
//
//
//    [self.view addSubview:self.headerView];
//    [self.view addSubview:self.sectionView];
//    [self.sectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.headerView.mas_bottom).mas_equalTo(0);
//        make.left.equalTo(self.headerView.mas_left).mas_equalTo(0);
//        make.right.equalTo(self.headerView.mas_right).mas_equalTo(0);
//        make.height.mas_equalTo(44*HADAPTER);
//
//    }];
//
//    [self.view addSubview:self.searchView];
//    self.searchView.alpha = 0;
//}
//
//
//#pragma mark scrollView的delegate
//
//#pragma mark - scrollview
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%f", scrollView.contentOffset.y);
//    CGFloat offset = scrollView.contentOffset.y - oriOfftY;
//
//    CGFloat imgH = oriHeight - offset;
//    if (imgH < (NAVIGATION_BAR_HEIGHT)) {
//        imgH = NAVIGATION_BAR_HEIGHT;
//    }
//    CGRect frame = self.headerView.frame;
//    frame.size.height = imgH;
//    self.headerView.frame = frame;
//
//    //根据透明度来生成图片
//    //找最大值/
//    CGFloat alpha = offset * 1 / 136.0;   // (200 - 64) / 136.0f
//    if (alpha >= 1) {
//        alpha = 0.99;
//    }
//
//    self.searchView.alpha = alpha;
////    //拿到标题 标题文字的随着移动高度的变化而变化
////    UILabel *titleL = (UILabel *)self.navigationItem.titleView;
////    titleL.textColor = [UIColor colorWithWhite:0 alpha:alpha];
////
////    //把颜色生成图片
////    UIColor *alphaColor = [UIColor colorWithWhite:1 alpha:alpha];
////    //把颜色生成图片
////    UIImage *alphaImage = [UIImage imageWithColor:alphaColor];
////    //修改导航条背景图片
////    [self.navigationController.navigationBar setBackgroundImage:alphaImage forBarMetrics:UIBarMetricsDefault];
//
//}
//
//
//
//#pragma mark   delegate，datasource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [self.listArr count];
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString* cellIdentifier = @"cell";
//    //给一个cell做标记
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    //cell 为空的时候 ,需要创建 ,即:第一次创建,之后就不用创建了
//    if(nil== cell) {
//        //初始化一个UITableViewCellStyleDefault 是不显示 副标题的
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
//        //cell 可以设置为透明
//        //cell.backgroundColor= [UIColor clearColor];
//        //取消 cell的选中效果
//        //cell.selectionStyle = UITableViewCellSelectionStyleNone;//这样用户体验不好 我们用下面这个:
//        //选中时有置灰效果,离开时 选中效果 消失
//        //这句话在选中cell时触发的方法里设置[tableView deselectRowAtIndexPath:indexPath animated:YES];
//    }
//    cell.detailTextLabel.text= self.listArr[indexPath.row];//副标题
//    return cell;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 40*HADAPTER;
//}
//
//
//
//#pragma mark 懒加载
//-(NSArray *)listArr {
//    if(_listArr == nil) {
//        _listArr = @[@"1",@"2",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5",@"3",@"4",@"5"];
//    }
//    return _listArr;
//}
//-(UIView *)searchView {
//    if(_searchView == nil) {
//        _searchView = [[UIView alloc]initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, V_W, 44*HADAPTER)];
//        _searchView.backgroundColor = [UIColor grayColor];
//    }
//    return _searchView;
//}
//-(UITableView *)tableView {
//    if(_tableView == nil) {
//        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, V_W, V_H-TAB_BAR_HEIGHT-STATUS_BAR_HEIGHT)];
//         _tableView.contentInset = UIEdgeInsetsMake(244*HADAPTER, 0, 0, 0);
//        _tableView.backgroundColor = [UIColor orangeColor];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        //多余的cell不显示
//        _tableView.tableFooterView = [UIView new];
//
//    }
//    return _tableView;
//}
//-(UIView *)headerView {
//    if(_headerView == nil) {
//        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, V_W, 200*HADAPTER)];
//        _headerView.backgroundColor = [UIColor yellowColor];
//    }
//    return _headerView;
//}
//-(UIView *)sectionView {
//    if(_sectionView == nil) {
//        _sectionView = [[UIView alloc]init];
//        _sectionView.backgroundColor = [UIColor blueColor];
//    }
//    return _sectionView;
//}
//@end
