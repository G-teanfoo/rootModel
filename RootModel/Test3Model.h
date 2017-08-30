//
//  Test3Model.h
//  RootModel
//
//  Created by chuanjun sun on 2017/8/30.
//  Copyright © 2017年 chjsun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJModel.h"

@interface Test3Model : CJModel

/** string */
@property (nonatomic, copy) NSString *str;
/** int */
@property (nonatomic, assign) NSInteger inter;
/** fl */
@property (nonatomic, assign) CGFloat ff;
/** bool */
@property (nonatomic, assign) BOOL boo;
/** number */
@property (nonatomic, strong) NSNumber *number;


@end
