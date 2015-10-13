//
//  XLViewController.m
//  iOS12.3CALayer练习
//
//  Created by MS on 15-9-29.
//  Copyright (c) 2015年 xuli. All rights reserved.
//

#import "XLViewController.h"

@interface XLViewController ()

@end

@implementation XLViewController
-(void)makeLayer:(NSSet *)touches
{
    //<1>获取点击屏幕的触摸点
    UITouch * touch = [touches anyObject];
    //<2>获取触摸点的坐标
    CGPoint point = [touch locationInView:self.view];
    //<3>为点击的点添加层
    CALayer * waveLayer = [CALayer layer];
    //<4>为层添加显示位置及大小
    waveLayer.frame = CGRectMake(point.x - 1, point.y - 1, 10, 10);
    
    //<5>为层添加边框颜色
    int colorNum = arc4random() % 7;
    
    switch (colorNum)
    {
        case 0:
            waveLayer.borderColor = [[UIColor redColor] CGColor];
            break;
        case 1:
            waveLayer.borderColor = [[UIColor orangeColor] CGColor];
            break;
        case 2:
            waveLayer.borderColor = [[UIColor yellowColor] CGColor];
            break;
        case 3:
            waveLayer.borderColor = [[UIColor greenColor] CGColor];
            break;
        case 4:
            waveLayer.borderColor = [[UIColor cyanColor] CGColor];
            break;
        case 5:
            waveLayer.borderColor = [[UIColor magentaColor]CGColor];
            break;
        default:
            waveLayer.borderColor = [[UIColor purpleColor] CGColor];
            break;
    }
    
    //<6>设置层的边框宽度
    waveLayer.borderWidth = 0.5;
    
    //<7>设置层圆角效果
    waveLayer.cornerRadius = 5;
    
    //<8>在当前的视图层添加子层
    [self.view.layer addSublayer:waveLayer];
    
    //添加动画效果
    [self maxScale:waveLayer];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self makeLayer:touches];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self makeLayer:touches];
}
-(void)maxScale:(CALayer *)layer
{
    const int maxScaleNum = 120;
    if(layer.transform.m11 < maxScaleNum)
    {
    
        [layer setTransform:CATransform3DScale(layer.transform, 1.1, 1.1, 1.0)];
        //递归调用该方法
        [self performSelector:_cmd withObject:layer afterDelay:0.03];
    }
    else
    {
        [layer removeFromSuperlayer];
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
