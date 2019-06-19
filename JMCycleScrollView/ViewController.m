//
//  ViewController.m
//  JMCycleScrollView
//
//  Created by JM on 2019/6/19.
//  Copyright © 2019 Jimon. All rights reserved.
//

#import "ViewController.h"
#import "JMCycleScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    JMCycleScrollView *scrollView = [JMCycleScrollView cycleScrollViewWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:scrollView];
}


@end
