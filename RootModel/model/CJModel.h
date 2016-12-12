//
//  JRModel.h
//  parking
//
//  Created by chjsun on 2016/12/9.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJModel : NSObject
/**
 *  创建共享唯一model
 */
+ (id)shareModel;

/**
 *  通过kvc快速给属性赋值
 */
- (void)setValueForDict:(NSDictionary *)dict;
@end
