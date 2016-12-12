//
//  CJModel.m
//  parking
//
//  Created by chjsun on 2016/12/9.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "CJModel.h"

static NSMutableDictionary *storagePool;

static CJModel *model;

@implementation CJModel

+ (id)shareModel{

    @synchronized(self){

        if (storagePool == nil) {//首先判断容器是否存在
            storagePool = [[NSMutableDictionary alloc] init];//不存在就先创建
        }
        NSString *modelClass = NSStringFromClass([self class]);
        if ([storagePool objectForKey:modelClass]) {
            return storagePool[modelClass];
        }else{
            model = [[self alloc] init];
        }
    }
    return model;
}

    //重写alloc方法，保证在使用alloc、new 去创建对象时，不产生新的对象
+ (id)allocWithZone:(NSZone *)zone{
    NSString *modelClass = NSStringFromClass([self class]);
//
    if (storagePool == nil) {
        storagePool = [[NSMutableDictionary alloc] init];;
    }
//
    if ([storagePool objectForKey:modelClass]) {
        return storagePool[modelClass];
    }else{
        model = [[super allocWithZone:zone] init];
        [storagePool setObject:model forKey:modelClass];
    }
    return model;
}

// 允许copy,程序员在使用时肯定知道copy的含义，不知道请去查，留这个接口是为了某些可能需要的特殊的业务
//- (id)copyWithZone:(NSZone *)zone{
//    return model;
//}
//
// 允许mutableCopy,程序员在使用时肯定知道mutable的含义，不知道请去查，留这个接口是为了某些可能需要的特殊的业务
//- (id)mutableCopyWithZone:(NSZone *)zone{
//    return model;
//}

    // KVC 快速设置值
- (void)setValueForDict:(NSDictionary *)dict{
    [self setValuesForKeysWithDictionary:dict];
}


    // 设置不存在 key 的值
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    NSLog(@"key 值 %@ 不存在，无法设置值 ！", key);
}

    // 获取不存在的 key 的值
- (id)valueForUndefinedKey:(NSString *)key {

    NSLog(@"key 值 %@ 不存在，无法获取值 ！", key);
    
    return nil;
}
@end
