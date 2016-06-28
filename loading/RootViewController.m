//
//  RootViewController.m
//  loading
//
//  Created by HeavenLi on 16/6/22.
//  Copyright © 2016年 HeavenLi. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    NSArray * dataSourceArr;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    dataSourceArr = [NSArray arrayWithObjects:@"线条动画",@"水波",@"点点",nil];
    
    
    // Do any additional setup after loading the view.
}



#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        
        [self performSegueWithIdentifier:@"cell0" sender:nil];
        
    }else if (indexPath.row == 1){
        
        [self performSegueWithIdentifier:@"cell1" sender:nil];
        
    }else if (indexPath.row == 2){
        
        [self performSegueWithIdentifier:@"cell2" sender:nil];
        
    }
    
    
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSourceArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"basic"];
    cell.textLabel.text = dataSourceArr[indexPath.row];
    
    
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
