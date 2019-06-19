# JMCycleScrollView
Only three views are needed to implement infinite circular rotation.

效果GIF图
![image](https://github.com/zxgy/JMCycleScrollView/blob/master/images/cycleScroll.gif)

仅创建3个视图，即可实现无限循环轮播；

- 初始化

JMCycleScrollView *scrollView = [JMCycleScrollView cycleScrollViewWithFrame:[UIScreen mainScreen].bounds];
[self.view addSubview:scrollView];
