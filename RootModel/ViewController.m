//
//  ViewController.m
//  RootModel
//
//  Created by chjsun on 2016/12/12.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "ViewController.h"
#import "Test1Model.h"
#import "Test2Model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 验证
    Test1Model *tests = [Test1Model shareModel];
    NSLog(@"1 = %p", &*tests);
    [tests setValueForDict:@{@"name":@"cc"}];
    NSLog(@"1 = %@", tests.name);

    Test2Model *tests2 = [Test2Model shareModel];
    NSLog(@"2 = %p", &*tests2);
    NSLog(@"2 = %@", tests2.name);

    Test1Model *tests3 = [Test1Model shareModel];
    NSLog(@"3 = %p", &*tests3);
    NSLog(@"3 = %@", tests3.name);
    
    Test2Model *tests4 = [Test2Model shareModel];
    NSLog(@"4 = %p", &*tests4);
    NSLog(@"4 = %@", tests4.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
