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
#import "Test3Model.h"

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

    Test2Model *tests5 = [[Test2Model alloc] init];
    NSLog(@"5 = %p", &*tests5);
    NSLog(@"5 = %@", tests5.name);

    NSInteger inter = 5;
    BOOL boo = YES;
    CGFloat ff = 4.5f;

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@0 forKey:@"number"];
    [dict setObject:@"str" forKey:@"str"];
    [dict setObject:[NSNumber numberWithBool:boo] forKey:@"boo"];
    [dict setObject:[NSNumber numberWithInteger:inter] forKey:@"inter"];
    [dict setObject:[NSNumber numberWithFloat:ff] forKey:@"ff"];
    NSLog(@"原版字典： %@", dict);
    Test3Model *test3 = [Test3Model shareModel];
    [test3 setValueForDict:dict];

    NSLog(@"new dict %@", [test3 modelToDict]);
    NSLog(@"new json %@", [test3 modelToJson]);

    NSLog(@"判断 = %i", (test3.ff == 4.5));

    [test3 clearModelInfo];
    NSLog(@"old dict %@", [test3 modelToDict]);
    NSLog(@"old json %@", [test3 modelToJson]);

    [test3 setValueForJson:@"{\"ff\":20.5,\"number\":10,\"inter\":30,\"boo\":true,\"str\":\"\"}"];
    NSLog(@"old dict %@", [test3 modelToDict]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
