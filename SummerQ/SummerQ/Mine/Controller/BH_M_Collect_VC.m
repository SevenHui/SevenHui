//
//  BH_M_Collect_VC.m
//  SummerQ
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 沐沐`柒. All rights reserved.
//  我的收藏

#import "BH_M_Collect_VC.h"
#import "BH_D_Section_Details_HotCity_Model.h"
#import "BH_D_Section_Details_FirstSec_Details_VC.h"
@interface BH_M_Collect_VC ()
<UITableViewDataSource, UITableViewDelegate>
/**<#注释#>*/
@property (nonatomic, retain)UITableView *tableView;
/**<#注释#>*/
@property (nonatomic, retain)NSMutableArray *arrModel;

@end

@implementation BH_M_Collect_VC
/** 懒加载 */
- (NSMutableArray *)arrModel
{
    if (!_arrModel) {
        self.arrModel = [[BHSJK shareInstance] selectAll];
        if (_arrModel == nil) {
            /** 防止空数组未初始化 */
            self.arrModel = [NSMutableArray array];
        }
    }
    return _arrModel;
}

-(void)dealloc{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
    [_arrModel release];
    [_tableView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config];
    [self creatTableView];

}

-(void)config{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.35 green:0.71 blue:0.54 alpha:1.00];

#pragma 自定义导航返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
}
#pragma mark - 返回按钮
- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(void)creatTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTHSCREEN, HEIGHTSCREEN - 64 - 49) style:0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    [self.tableView setSeparatorColor:[UIColor clearColor]];

    [self.tableView jxl_setDayMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        self.tableView.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrModel.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    BH_D_Section_Details_HotCity_Model *model = self.arrModel[indexPath.row];
    cell.textLabel.text = model.cnname;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    [cell jxl_setDayMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        //改变
        cell.backgroundColor = [UIColor colorWithRed:0.57 green:0.57 blue:0.57 alpha:1.00];
    }];

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
#pragma mark - 可以编辑
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:YES];
    [self.tableView setEditing:editing animated:YES];
}
#pragma mark - 编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}
#pragma mark - 编辑的业务逻辑
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BH_D_Section_Details_HotCity_Model *model = self.arrModel[indexPath.row];
    NSString *str = [NSString stringWithFormat:@"%@", model.cnname];
    [[BHSJK shareInstance] deleteFrom:str];
    
    // 处理模型数组数据
    [self.arrModel removeObjectAtIndex:indexPath.row];
    // 处理cell
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{

    [self.arrModel exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


@end
