//
//  JRModel.m
//  parking
//
//  Created by chjsun on 2016/12/9.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "JRModel.h"
static NSMutableDictionary *storagePool;

static JRModel *model;

@implementation JRModel

+ (id)shareModel{

    NSString *modelClass = NSStringFromClass([self class]);
    if (storagePool != nil && [storagePool objectForKey:modelClass]) {//首先判断缓存池或缓存池是否存在
        model = storagePool[modelClass];

    }else{
        @synchronized(self){
            if (storagePool == nil) {//首先判断缓存池是否存在
                storagePool = [[NSMutableDictionary alloc] init];//不存在就先创建
            }
            if ([storagePool objectForKey:modelClass]) {
                return storagePool[modelClass];
            }else{
                model = [[self alloc] init];
            }
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

//    //允许copy,程序员在使用时肯定知道copy的含义，不知道请去查，留这个接口是为了某些可能需要的特殊的业务
//- (id)copyWithZone:(NSZone *)zone{
//    return model;
//}
//
//    //允许copy,程序员在使用时肯定知道mutable的含义，不知道请去查，留这个接口是为了某些可能需要的特殊的业务
//- (id)mutableCopyWithZone:(NSZone *)zone{
//    return model;
//}

// 快速设置值
- (void)setValueForDict:(NSDictionary *)dict{
    [self setValuesForKeysWithDictionary:dict];
}

//
- (void)clearModelInfo{
    // 记录属性的个数
    unsigned int propertyCount = 0;
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);

    // 把属性放到数组中
    for (int i = 0; i < propertyCount; i ++) {
        // 取出每一个属性
        objc_property_t property = propertys[i];
        const char *propertyName = property_getName(property);
        // 将所有属性值设置为nil

        //  number类型就放@(0)
        if ([[self valueForKey:[[NSString alloc] initWithUTF8String:propertyName]] isKindOfClass:[NSNumber class]]) {
            [self setValue:@(0) forKey:[[NSString alloc] initWithUTF8String:propertyName]];
            continue;
        }

        [self setValue:nil forKey:[[NSString alloc] initWithUTF8String:propertyName]];
    }
}

// 格式化对象
- (NSDictionary *)formatModel{

    // 记录属性的个数
    unsigned int propertyCount = 0;
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    // 把属性放到数组中
    for (int i = 0; i < propertyCount; i ++) {
        // 取出每一个属性
        objc_property_t property = propertys[i];
        const char *propertyName = property_getName(property);
        // 将所有属性值赋值给字典
        id value = [self valueForKey:[[NSString alloc] initWithUTF8String:propertyName]];
        if (value == nil) {
            value = @"nil";
        }
        [dict setObject:value forKey:[[NSString alloc] initWithUTF8String:propertyName]];
    }

    return dict;

}


// 设置不存在 key 的值
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    NSLog(@"%@ key 值 %@ 未定义，无法设置值 ！", [self class], key);
}

// 获取不存在的 key 的值
- (id)valueForUndefinedKey:(NSString *)key {

    NSLog(@"%@ key 值 %@ 不存在，无法获取值 ！", [self class], key);
    
    return nil;
}
@end
