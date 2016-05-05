//
//  ViewController.m
//  JBPickerViewCirulate
//
//  Created by Biao on 16/5/4.
//  Copyright © 2016年 Bobby. All rights reserved.
//

#import "ViewController.h"

#define BIG_MAX 10000000

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong)UIPickerView *mPickView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mPickView = [[UIPickerView alloc]initWithFrame:CGRectMake(100, 200, 200, 180)];
    self.mPickView.layer.borderWidth = 1.0;
    self.mPickView.layer.borderColor = [[UIColor magentaColor]CGColor];
    self.mPickView.delegate = self;
    self.mPickView.dataSource = self;
    [self.view addSubview:self.mPickView];
}

- (void)pickerViewLoaded:(id)pk
{
    NSUInteger max = BIG_MAX;
    NSUInteger base = (max/2)-(max/2)%10;
    
    /**
     *  @author Biao
     *
     *  滚动到指定的中心,返回到选定行
     */
    [self.mPickView selectRow:[self.mPickView selectedRowInComponent:0]%10+base inComponent:0 animated:NO];
}

/**
 *  @author Biao
 *
 *  返回的列显示的数量。
 */
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

/**
 *  @author Biao
 *
 *  返回的行数
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return BIG_MAX;
}


/**
 *  @author Biao
 *
 *  每一行显示的内容
 */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:5];
    [arr addObject:@"Zero"];
    [arr addObject:@"One"];
    [arr addObject:@"Two"];
    [arr addObject:@"Three"];
    [arr addObject:@"Foure"];
    /**
     *  @author Biao
     *
     *  数组下标指定元素%5
     */
    return [arr objectAtIndex:(row % 5)];
}

/**
 *  @author Biao
 *
 *  点击事件
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self pickerViewLoaded:nil];
    NSLog(@"用户选择了第一列第%ld行",row%10);
}


@end
