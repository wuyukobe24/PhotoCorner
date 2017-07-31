//
//  CircleViewController.m
//  画圆Demo
//
//  Created by WangXueqi on 17/7/25.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "CircleViewController.h"

@interface CircleViewController ()
@property(nonatomic,strong)UIImageView * firstImage;
@property(nonatomic,strong)UIImageView * secondImage;
@property(nonatomic,strong)UIImageView * thirdImage;

@property(nonatomic,copy)NSString * aName;
@property(nonatomic,strong)NSString * bName;
@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"头像";
    self.view.backgroundColor = [UIColor darkGrayColor];
    [self addSubView];
    [self stringCopy];//测试string copy
}

- (void)addSubView {

    if (!_firstImage) {
        _firstImage = [[UIImageView alloc]initWithFrame:CGRectMake(100, 70, 144, 144)];
        _firstImage.image = [UIImage imageNamed:@"start_up_logo"];
        [self.view addSubview:_firstImage];
        [self setCircleOne];
    }
    
    if (!_secondImage) {
        _secondImage = [[UIImageView alloc]initWithFrame:CGRectMake(100, 270, 144, 144)];
        _secondImage.image = [UIImage imageNamed:@"start_up_logo"];
        [self.view addSubview:_secondImage];
        [self setCircletwo];
    }
    
    if (!_thirdImage) {
        _thirdImage = [[UIImageView alloc]initWithFrame:CGRectMake(100, 470, 144, 144)];
        _thirdImage.image = [UIImage imageNamed:@"start_up_logo"];
        [self.view addSubview:_thirdImage];
        [self setCirclethree];
    }
    
}

//第一种方法：常规裁圆
- (void)setCircleOne {

    _firstImage.layer.cornerRadius = 72;
    _firstImage.layer.masksToBounds = YES;
}

//第二种方法：使用CAShapeLayer和UIBezierPath设置圆角
- (void)setCircletwo {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_secondImage.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:_secondImage.bounds.size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = _secondImage.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    _secondImage.layer.mask = maskLayer;
}

//第三种方法:使用贝塞尔曲线UIBezierPath和Core Graphics框架画出一个圆角
- (void)setCirclethree {
    
    //开始对imageView进行画图,YES表示透明 NO表示不透明
    UIGraphicsBeginImageContextWithOptions(_thirdImage.bounds.size, NO, 0);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithOvalInRect:_thirdImage.bounds] addClip];
    [_thirdImage drawRect:_thirdImage.bounds];
    _thirdImage.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束画图
    UIGraphicsEndImageContext();
}

- (void)stringCopy {

    NSMutableString * name = [NSMutableString stringWithFormat:@"name"];
    self.aName = name;
    self.bName = name;
    [name appendString:@"lll"];
    NSLog(@"copy:%@   strong:%@  name=%@",self.aName,self.bName,name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
