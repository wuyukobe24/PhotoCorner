# PhotoCorner
三种方式裁剪圆角头像

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
