//
//  JMCycleScrollView.m
//  JMCycleScrollView
//
//  Created by JM on 2019/6/19.
//  Copyright © 2019 Jimon. All rights reserved.
//

#import "JMCycleScrollView.h"
#import "JMScrollItemView.h"

static const int JMScrollPage = 3; //只需要创建3个视图，即可实现无限轮播

@interface JMCycleScrollView ()
@property (nonatomic,strong) NSMutableArray *itemImages;
@property (nonatomic,strong) NSMutableArray *itemViews;
@end

@implementation JMCycleScrollView

+(instancetype)cycleScrollViewWithFrame:(CGRect)frame {
    JMCycleScrollView *instance = [[JMCycleScrollView alloc] initWithFrame:frame];
    return instance;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _widthOfView = frame.size.width;
        _heightOfView = frame.size.height;
        
        [self initMainScrollView];
        
        [self addImageViewForMainScrollView];
    }
    return self;
}

- (void) initMainScrollView{
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _widthOfView, _heightOfView)];
    
    _mainScrollView.contentSize = CGSizeMake(_widthOfView*JMScrollPage, _heightOfView);
    
    _mainScrollView.pagingEnabled = YES;
    
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    
    _mainScrollView.showsVerticalScrollIndicator = NO;
    
    _mainScrollView.delegate = self;
    
    [self addSubview:_mainScrollView];
}

-(void) addImageViewForMainScrollView {
    // 循环初始化3个子视图
    for (int i=0; i<JMScrollPage; i++) {
        CGRect currentFrame = CGRectMake(_widthOfView * i, 0, _widthOfView, _heightOfView);
        JMScrollItemView *subview = [[JMScrollItemView alloc] initWithFrame:currentFrame];
        NSString *imgName = [NSString stringWithFormat:@"dayImage%i",i];
        [subview.iconImageView setImage:[UIImage imageNamed:imgName]];
        [_mainScrollView addSubview:subview];
        [self.itemImages addObject:[UIImage imageNamed:imgName]];
        [self.itemViews addObject:subview];
    }
    
    [self setScrollViewContentOffsetCenter];
}

- (void)setScrollViewContentOffsetCenter {
    self.mainScrollView.contentOffset = CGPointMake(_widthOfView, 0);
}

#pragma makr - delegate
// 每次滑动结束后调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //判断当前滑动的位置
    CGFloat pointX = self.mainScrollView.contentOffset.x;
    
    //1.若向右滑动到第一张
    if (pointX<_widthOfView) {
        self.curIndex = 0;
    }
    //2.若向右滑动到最后一张
    else if (pointX>=_widthOfView*2) {
        self.curIndex = 2;
    }
}

- (void)setCurIndex:(NSInteger)curIndex {
    if (_curIndex >= 0) {
        _curIndex = curIndex;
        
        //重新设置视图图片
        JMScrollItemView *firItem = self.itemViews[0];
        JMScrollItemView *secItem = self.itemViews[1];
        JMScrollItemView *thrItem = self.itemViews[2];
        
        NSInteger fir = (curIndex-1+JMScrollPage) % JMScrollPage;
        NSInteger sec = curIndex % JMScrollPage;
        NSInteger thr = (curIndex+1+JMScrollPage) % JMScrollPage;
        
        UIImage *firImg = self.itemImages[fir];
        UIImage *secImg = self.itemImages[sec];
        UIImage *thrImg = self.itemImages[thr];
        
        //1.重新对每个视图赋值图片
        //1.1第一张视图取当前展示图片的前一张，若没有图片则取最后一张
        [firItem.iconImageView setImage:firImg];
        //1.2将当前展示图片重新赋值给中间视图
        [secItem.iconImageView setImage:secImg];
        //1.3第三张视图取当前展示图片的后一张，若没有图片则取第一张
        [thrItem.iconImageView setImage:thrImg];
        
        //2.重新对itemImages集合进行排序
        [self.itemImages replaceObjectAtIndex:0 withObject:firImg];
        [self.itemImages replaceObjectAtIndex:1 withObject:secImg];
        [self.itemImages replaceObjectAtIndex:2 withObject:thrImg];
        
        // 每次滚动后，都需要将当前页移动到中间位置
        [self setScrollViewContentOffsetCenter];
        
    }
}

#pragma mark - getter
-(NSMutableArray *)itemImages{
    if (!_itemImages) {
        _itemImages = [NSMutableArray array];
    }
    return _itemImages;
}
-(NSMutableArray *)itemViews{
    if (!_itemViews) {
        _itemViews = [NSMutableArray array];
    }
    return _itemViews;
}

@end
