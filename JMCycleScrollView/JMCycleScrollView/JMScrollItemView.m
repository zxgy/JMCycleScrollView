//
//  JMScrollItemView.m
//  JMCycleScrollView
//
//  Created by JM on 2019/6/19.
//  Copyright © 2019 Jimon. All rights reserved.
//

#import "JMScrollItemView.h"

@implementation JMScrollItemView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGRect imgRect = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        _iconImageView = [[UIImageView alloc] initWithFrame:imgRect];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        _iconImageView.clipsToBounds = YES;
        [self addSubview:_iconImageView];
    }
    return self;
}

@end
