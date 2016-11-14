//
//  GZGYLimitViewController.m
//  ZGJY
//
//  Created by YYS on 16/11/3.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYLimitViewController.h"
#import "GZGYLimitView.h"
#import "GZGYLimitTableViewCell.h"
@interface GZGYLimitViewController ()<UITableViewDelegate,UITableViewDataSource,LimitDelegeteClickProtocol>
{
    UITableView * ytableView;
    UIView * headerView;
    UIImageView * imgView;
}
@property(nonatomic, strong)GZGYLimitView * limitView;
@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, strong)NSArray * nameArray;
@property(nonatomic, strong)NSMutableArray * tableArray;
@end

@implementation GZGYLimitViewController
-(NSMutableArray *)tableArray
{
    if (_tableArray == nil) {
        _tableArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _tableArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _nameArray = @[@"10:00",@"12:00",@"14:00",@"16:00"];
    self.titles.text = @"限时特卖";
    [self scrollInterface];
    [self headerViewInterface];
    // Do any additional setup after loading the view.
}
#pragma mark --- headerView界面
-(void)headerViewInterface
{
//    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, [GZGApplicationTool control_height:420])];
    self.view.backgroundColor = [UIColor colorWithRed:222/255.0 green:76/255.0 blue:70/255.0 alpha:1.0];
//    [self.view addSubview:headerView];
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, [GZGApplicationTool control_height:295])];
    imgView.image = [UIImage imageNamed:@"sy_ad1.jpg"];
    [self.view addSubview:imgView];
    self.limitView = [[GZGYLimitView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:315]+[GZGApplicationTool navBarAndStatusBarSize], SCREENWIDTH, [GZGApplicationTool control_height:105]) NameArray:_nameArray];
    self.limitView.delegate = self;
    self.limitView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.limitView];
    [self addTableViewToScrollView:self.scrollView count:_nameArray.count frame:CGRectZero];
}
- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    for (int i = 0; i < pageCount; i++) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREENWIDTH * i, 0 , SCREENWIDTH, scrollView.frame.size.height)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = i;
        tableView.backgroundColor = [UIColor colorWithRed:222/255.0 green:76/255.0 blue:70/255.0 alpha:1.0];
        [self.tableArray addObject:tableView];
        [self.scrollView addSubview:tableView];
    }
}
#pragma mark --- 定义tableview
-(void)scrollInterface
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,[GZGApplicationTool navBarAndStatusBarSize]+ [GZGApplicationTool control_height:420], SCREENWIDTH, SCREENHEIGHT-[GZGApplicationTool navBarAndStatusBarSize]-[GZGApplicationTool control_height:420])];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH * self.nameArray.count, self.scrollView.frame.size.height);
    [self.view addSubview:self.scrollView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%2 == 0) {
        return [GZGApplicationTool control_height:20];
    }
    return [GZGApplicationTool control_height:365];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return [GZGApplicationTool control_height:120];
    }
    return [GZGApplicationTool control_height:0];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        UIImageView * imggView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [GZGApplicationTool control_height:120])];
        imggView.image = [UIImage imageNamed:@"sy_ad1.jpg"];
        return imggView;
    }else{
        return nil;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    if (indexPath.row%2 == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        cell.backgroundColor = [UIColor colorWithRed:222/255.0 green:76/255.0 blue:70/255.0 alpha:1.0];
        return cell;
    }else{
        GZGYLimitTableViewCell* cell = (GZGYLimitTableViewCell*) [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil) {
            cell = [[GZGYLimitTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.backgroundColor = [UIColor colorWithRed:222/255.0 green:76/255.0 blue:70/255.0 alpha:1.0];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消点击事件的阴影 就是点击之后在返回cell上还是有点击的阴影 加上这句话可以消除阴影
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark --- seg点击事件--delegate
-(void)LimitBtnDelegate:(NSInteger)sender
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat imageH = self.limitView.frame.size.height+[GZGApplicationTool navBarAndStatusBarSize];
    //获取偏移量
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%f,%f",imageH,offsetY);
    if (offsetY>imageH) {
        [UIView animateWithDuration: 0.35 animations: ^{
        imgView.hidden = YES;
        CGRect frame = _limitView.frame;
        frame.origin.y = [GZGApplicationTool navBarAndStatusBarSize];
        _limitView.frame = frame;
        CGRect frame1 = self.scrollView.frame;
        frame1.origin.y = [GZGApplicationTool control_height:105]+[GZGApplicationTool navBarAndStatusBarSize];
        frame1.size.height = SCREENHEIGHT-[GZGApplicationTool control_height:105]-[GZGApplicationTool navBarAndStatusBarSize];
        self.scrollView.frame = frame1;
        for (int i = 0; i<_tableArray.count; i++) {
            UITableView * tableView = _tableArray[i];
            NSLog(@"%f",tableView.frame.size.height);
            CGRect frame2 = tableView.frame;
            frame2.size.height = SCREENHEIGHT-[GZGApplicationTool control_height:105]-[GZGApplicationTool navBarAndStatusBarSize];
            tableView.frame = frame2;
            NSLog(@"%f",tableView.frame.size.height);
        }
        } completion: nil];
    }
    if (offsetY < -[GZGApplicationTool control_height:200]){
        [UIView animateWithDuration: 0.35 animations: ^{
        imgView.hidden = NO;
        CGRect frame = _limitView.frame;
        frame.origin.y = [GZGApplicationTool navBarAndStatusBarSize]+[GZGApplicationTool control_height:315];
        _limitView.frame = frame;
        CGRect frame1 = self.scrollView.frame;
        frame1.origin.y = [GZGApplicationTool control_height:420]+[GZGApplicationTool navBarAndStatusBarSize];
        frame1.size.height = SCREENHEIGHT-[GZGApplicationTool control_height:420]-[GZGApplicationTool navBarAndStatusBarSize];
        self.scrollView.frame = frame1;
        for (int i = 0; i<_tableArray.count; i++) {
            UITableView * tableView = _tableArray[i];
            CGRect frame2 = tableView.frame;
            frame2.size.height = SCREENHEIGHT-[GZGApplicationTool control_height:420]-[GZGApplicationTool navBarAndStatusBarSize];
            tableView.frame = frame2;
        }
        } completion: nil];
    }
}

@end
