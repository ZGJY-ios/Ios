//
//  ClassifiCationViewController.m
//  ZGJY
//
//  Created by YYS on 16/9/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGClassifiCationViewController.h"
#import "GZGYRightCollectionViewCell.h"
#import "GZGYClassModel.h"
#import "GZGYActivityCollectionViewCell.h"
#import "GZGYSegView.h"
#import "GZGYBrandCollectionViewCell.h"
#import "GZGYDetailsViewController.h"
@interface GZGClassifiCationViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,SegDelegeteClickProtocol>
{
    UIView*ViewHead;
    NSArray*DataArray;
    NSArray*classArray;
    NSInteger number;
}
@property(nonatomic,retain)NSMutableArray*SecArray;
@property(nonatomic,strong)NSArray<GZGYClassModel*>*model;
@property(nonatomic,strong)UICollectionView*CollectionView;
@property(nonatomic,strong)UITableView*TableView;
@property(nonatomic,strong)UICollectionView*brandCollection;
@property(nonatomic,strong)GZGYSegView*segView;
@property(nonatomic,retain)NSArray*NameArray;
@property(nonatomic,retain)NSString*NameTitle;
@property(nonatomic,retain)UIScrollView*ScrollView;
@property(nonatomic,strong)UIView*twoView;
@end

@implementation GZGClassifiCationViewController
-(NSMutableArray*)SecArray
{
    if (_SecArray == nil) {
        _SecArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _SecArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"分类";
//    self.navigationController.navigationBar.hidden = NO;
//    self.navBarView.hidden = YES;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.titles.text = @"分类";
    number = 0;
    self.view.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    classArray = @[@"精品男装",@"潮流女装",@"母婴用品",@"儿童玩具",@"个护化妆",@"家用电器",@"电脑办公",@"手机数码",@"母婴童装",@"图书音像",@"家居家纺",@"家居生活",@"家具建材",@"食品生鲜",@"酒水饮料",@"运动户外",@"奢品礼品"];
    self.NameArray = @[@"分类",@"品牌"];
    DataArray = @[@{@"SecStr":@"常用分类",@"STR":@[@{@"ImgUrl":@"qweqwe",@"NameStr":@"潮流女装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"}]},@{@"SecStr":@"专场推荐",@"STR":@[@{@"ImgUrl":@"qweqwe",@"NameStr":@"潮流女装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"}]},@{@"SecStr":@"热门分类",@"STR":@[@{@"ImgUrl":@"qweqwe",@"NameStr":@"潮流女装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"},@{@"ImgUrl":@"qweqwe",@"NameStr":@"品牌男装"}]}];
    self.model = DataArray;
    for (int i = 0; i<DataArray.count; i++) {
        NSString*String = DataArray[i][@"SecStr"];
        [self.SecArray addObject:String];
    }
    NSLog(@"%@",_SecArray);
    
    //搜索框
    [self SearchInterface];
    [self ScrollViewInterface];
    //Seg
    [self SegViewInterface];
    //scrollview
//    [self ScrollViewInterface];
    [self refreshTableView:0];
}
#pragma mark --- 搜索框
-(void)SearchInterface
{
    UIView* textview = [[UIView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool navBarAndStatusBarSize], KScreenWigth, [GZGApplicationTool control_height:100])];
    textview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textview];
    UITextField * textfiled = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:30], [GZGApplicationTool control_height:25], KScreenWigth-[GZGApplicationTool control_wide:60], [GZGApplicationTool control_height:60])];
    textfiled.backgroundColor = [UIColor colorWithRed:214/255.0 green:213/255.0 blue:211/255.0 alpha:1.0];
    textfiled.borderStyle = UITextBorderStyleRoundedRect;
    textfiled.placeholder = @"请输入品牌名称";
    UIImageView * searchImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"-magnify-glass@2x"]];
    searchImg.frame = CGRectMake(0, 0, [GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:40]);
    textfiled.leftView = searchImg;
    textfiled.leftViewMode = UITextFieldViewModeAlways;
    [textview addSubview:textfiled];
}
#pragma mark --- scrollview
-(void)ScrollViewInterface
{
    self.ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:200]+[GZGApplicationTool navBarAndStatusBarSize], KScreenWigth, KScreenHeight-64-[GZGApplicationTool control_height:200]-self.tabBarController.tabBar.frame.size.height)];
    self.ScrollView.delegate = self;
    self.ScrollView.pagingEnabled = YES;
    self.ScrollView.bounces = NO;
    self.ScrollView.contentSize = CGSizeMake(KScreenWigth * _NameArray.count, self.ScrollView.frame.size.height);
    self.ScrollView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    [self.view addSubview:self.ScrollView];
}
#pragma mark --- Seg
-(void)SegViewInterface
{
    self.segView = [[GZGYSegView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:101]+[GZGApplicationTool navBarAndStatusBarSize], KScreenWigth, [GZGApplicationTool control_height:95]) NameArray:_NameArray];
    self.segView.delegate = self;
    self.segView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.segView];
    [self addTableViewToScrollView:self.ScrollView count:_NameArray.count frame:CGRectZero];
}
#pragma mark --- tableview collection
- (void)addTableViewToScrollView:(UIScrollView *)scrollView count:(NSUInteger)pageCount frame:(CGRect)frame {
    if (_TableView == nil) {
        _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KScreenWigth/3-7, self.ScrollView.frame.size.height)];
        _TableView.delegate = self;
        _TableView.dataSource = self;
    }
    [self.ScrollView addSubview:self.TableView];
    
    if (_CollectionView == nil) {
        UICollectionViewFlowLayout*flowlay = [[UICollectionViewFlowLayout alloc]init];
        flowlay.headerReferenceSize = CGSizeMake(KScreenWigth/3*2, KScreenHeight/20+10);
        _CollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(KScreenWigth/3, 59, KScreenWigth/3*2, self.ScrollView.frame.size.height) collectionViewLayout:flowlay];
        flowlay.minimumLineSpacing = 5;
        flowlay.minimumInteritemSpacing = 0;
        flowlay.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
        [_CollectionView registerClass:[GZGYActivityCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_CollectionView registerClass:[GZGYRightCollectionViewCell class] forCellWithReuseIdentifier:@"Rcell"];
        //_CollectionView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
        [_CollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
        _CollectionView.delegate = self;
        _CollectionView.dataSource = self;
        _CollectionView.backgroundColor = [UIColor whiteColor];
        _CollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    }
    [self.ScrollView addSubview:self.CollectionView];
    
//    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(KScreenWigth, 0, KScreenWigth, self.ScrollView.frame.size.height)];
//    self.twoView.backgroundColor = [UIColor redColor];
//    [self.ScrollView addSubview:self.twoView];
    
    if (_brandCollection == nil) {
        UICollectionViewFlowLayout*brandflowlay = [[UICollectionViewFlowLayout alloc]init];
        brandflowlay.headerReferenceSize = CGSizeMake(KScreenWigth, KScreenHeight/20+10);
        _brandCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(KScreenWigth, 0, KScreenWigth, self.ScrollView.frame.size.height) collectionViewLayout:brandflowlay];
        brandflowlay.minimumLineSpacing = 5;
        brandflowlay.minimumInteritemSpacing = 0;
        brandflowlay.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
        [_brandCollection registerClass:[GZGYBrandCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        //_CollectionView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
        [_brandCollection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
        _brandCollection.delegate = self;
        _brandCollection.dataSource = self;
        _brandCollection.backgroundColor = [UIColor whiteColor];
        _brandCollection.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.ScrollView addSubview:self.brandCollection];
    }
//    UIScrollView*collscroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:190], KScreenWigth, KScreenHeight-64-[GZGApplicationTool control_height:190]-self.tabBarController.tabBar.frame.size.height)];
//    collscroll.delegate = self;
//    collscroll.contentSize = CGSizeMake(KScreenWigth * _NameArray.count, self.ScrollView.frame.size.height);
//    [self.ScrollView addSubview:collscroll];
}

#pragma mark --- tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return classArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",classArray[indexPath.row]];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    [_CollectionView scrollRectToVisible:CGRectMake(0, -5, self.CollectionView.frame.size.width, self.CollectionView.frame.size.height) animated:YES];
    
    
    //    _selectedIndex = indexPath.row;
    
    [_CollectionView reloadData];
}
#pragma mark --- collectionview

- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout colorForSectionAtIndex:(NSInteger)section;
{
    if (section == 0) {
        return [UIColor redColor];
    }else{
        return [UIColor yellowColor];
    }
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([collectionView isEqual:self.CollectionView]) {
        if (section == 0) {
            return 0;
        }else if (section == 1){
            return 4;
        }
        return 10;
    }else{
        if (section == 0) {
            return 4;
        }else if (section == 1){
            return 4;
        }
        return 4;
    }
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if ([collectionView isEqual:self.CollectionView]) {
        return 3;
    }else{
        return 3;
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([collectionView isEqual:self.CollectionView]) {
        if (indexPath.section == 1) {
            return CGSizeMake(KScreenWigth/3-10, [GZGApplicationTool control_height:110]);
        }
        return CGSizeMake(KScreenWigth/9*2-10, KScreenHeight/8);
    }else{
        return CGSizeMake(KScreenWigth/9*3-10, [GZGApplicationTool control_height:100]);
    }
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView isEqual:self.CollectionView]) {
        if (indexPath.section == 1) {
            static NSString*identify = @"cell";
            GZGYActivityCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
            [cell sizeToFit];//自适应 Label就是label自适应 Image就是调整图片大小与image一直
            return cell;
        }else{
            static NSString*identify = @"Rcell";
            GZGYRightCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
            [cell sizeToFit];//自适应 Label就是label自适应 Image就是调整图片大小与image一直
            cell.model =[self.model[indexPath.section] valueForKey:@"STR"][indexPath.row];
            NSLog(@"%@",cell.model);
            return cell;
        }
    }else{
        static NSString*identify = @"cell";
        GZGYBrandCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
        NSLog(@"%@",[cell superview]);
        [[cell superview] superview].backgroundColor = [UIColor redColor];
        [cell sizeToFit];//自适应 Label就是label自适应 Image就是调整图片大小与image一直
        return cell;
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if ([collectionView isEqual:self.CollectionView]) {
        if (section==0) {
            return CGSizeMake(KScreenWigth/3*2, [GZGApplicationTool control_height:255]);
        }else{
            return CGSizeMake(KScreenWigth/3*2, KScreenHeight/20);
        }
    }else{
        return CGSizeMake(KScreenWigth, [GZGApplicationTool control_height:90]);
    }
}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    number++;
    NSLog(@"你吗呀%ld",number);
    if ([collectionView isEqual:self.CollectionView]) {
        UICollectionReusableView*headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            if (number == 5) {
                UIImageView*imgHeadView = [[UIImageView alloc]init];
                imgHeadView.frame = CGRectMake(0, 0, KScreenWigth/3*2, [GZGApplicationTool control_height:305]);
                imgHeadView.image = [UIImage imageNamed:@"sy_xspic3.jpg"];
                [headerView addSubview:imgHeadView];
            }else{
                NSLog(@"不建了");
            }
        }else{
            UILabel*HeadLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, KScreenWigth/3*2, KScreenHeight/20)];
            HeadLabel.font = [UIFont systemFontOfSize:13];
            HeadLabel.text = _SecArray[indexPath.section];
            HeadLabel.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
            [headerView addSubview:HeadLabel];
        }
        return headerView;
    }else{
        UICollectionReusableView*headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
        UILabel*HeadLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWigth, KScreenHeight/20)];
        HeadLabel.font = [UIFont systemFontOfSize:13];
        HeadLabel.text = @"世界品牌";
        HeadLabel.backgroundColor = [UIColor whiteColor];
        [headerView addSubview:HeadLabel];
        
        
        return headerView;
    }
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
    if ([collectionView isEqual:self.CollectionView]) {
        GZGYDetailsViewController * details = [[GZGYDetailsViewController alloc]init];
        details.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:details animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
}

- (void)changeView:(float)x {
    float xx = x*(1.0f/2.0f);
    NSLog(@"~~~~~~~~%f",xx);
    CGRect frame = self.segView.LineView.frame;
    frame.origin.x = xx;
    [self.segView.LineView setFrame:frame];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //只要滚动了就会触发
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
    }
    else
    {
        NSLog(@"%f",scrollView.contentOffset.x);
        [self changeView:scrollView.contentOffset.x];
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //减速停止了时执行，手触摸时执行执行
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
    }
    else
    {
        float xx = scrollView.contentOffset.x * (0.5) - KScreenWigth/2;
        NSLog(@"%f",xx);
        [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, KScreenWigth, self.segView.HeaderScroller.frame.size.height) animated:YES];
        int i = (scrollView.contentOffset.x / KScreenWigth);
        [self refreshTableView:i];
    }
}
- (void)refreshTableView:(int)index {
    if (index == 0) {
        CGRect frame = CGRectMake(0, 0, KScreenWigth/3-7, self.ScrollView.frame.size.height);
        CGRect frame1 = CGRectMake(KScreenWigth/3, 0, KScreenWigth/3*2, self.ScrollView.frame.size.height);
        frame.origin.x = 0;
        frame1.origin.x = KScreenWigth/3;
        [self.TableView setFrame:frame];
        [self.CollectionView setFrame:frame1];
    }else{
        CGRect frame = CGRectMake(KScreenWigth, 0, KScreenWigth, self.ScrollView.frame.size.height);
        frame.origin.x = KScreenWigth;
        [self.twoView setFrame:frame];
    }
//    self.exchangeView = _viewArray[index];
//    CGRect frame = self.exchangeView.frame;
//    frame.origin.x = KScreenWigth * index;
//    [self.exchangeView setFrame:frame];
//    _NameTitle = _NameArray[index];
//    self.navigationItem.title = _NameTitle;
}

-(void)SegBtnDelegate:(NSInteger)sender
{
    NSLog(@"%ld",sender);
//    _NameTitle = _NameArray[sender];
    [self.ScrollView setContentOffset:CGPointMake(KScreenWigth * sender, 0) animated:YES];
    float xx = KScreenWigth * (sender - 1) * (0.5) - KScreenWigth/2;
    [self.segView.HeaderScroller scrollRectToVisible:CGRectMake(xx, 0, KScreenWigth, self.segView.frame.size.height) animated:YES];
    [self refreshTableView:(int)sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
