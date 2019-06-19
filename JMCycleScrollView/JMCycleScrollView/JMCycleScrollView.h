//
//  JMCycleScrollView.h
//  JMCycleScrollView
//
//  Created by JM on 2019/6/19.
//  Copyright © 2019 Jimon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMCycleScrollView : UIView<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *mainScrollView;

@property (nonatomic,assign) CGFloat widthOfView;
@property (nonatomic,assign) CGFloat heightOfView;
@property (nonatomic,assign) NSInteger curIndex;


+(instancetype)cycleScrollViewWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
