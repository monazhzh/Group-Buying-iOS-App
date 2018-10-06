//
//  StarRateView.m
//  团购
//
//  Created by Jones on 11/28/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import "StarRateView.h"
@interface StarRateView(){
    UIView *foreStarView;
    UIView *backStarView;
    CGFloat currentScore;
}
@end
@implementation StarRateView
// + class 单例
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        foreStarView = [self createView:@"star_yellow.png" frame:CGRectZero];
        backStarView = [self createView:@"star_gray.png" frame:self.bounds];
        [self addSubview:backStarView];
        [self addSubview:foreStarView];
        // 手势
        UITapGestureRecognizer *tagGeture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        tagGeture.numberOfTapsRequired = 1;// 单击
        [self addGestureRecognizer:tagGeture];
    }
    return self;
}
-(UIView*)createView:(NSString *)imageName frame:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.clipsToBounds = true;
    view.backgroundColor = [UIColor clearColor];
    for (int i = 0; i<5; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i*self.bounds.size.width/5, 0, self.bounds.size.width/5, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}
-(void)tapAction:(UITapGestureRecognizer *)gesture{
    CGPoint tapPoint = [gesture locationInView:self];
    CGFloat x = tapPoint.x;
    CGFloat realStarScore = x/(self.bounds.size.width/5);
    CGFloat startScore = realStarScore;
    currentScore = startScore/5;
    [self refushUI];
}
-(void)refushUI{
    if (currentScore < 0) {
        currentScore = 0;
    }else if (currentScore >1){
        currentScore = 1;
    }
    // if 检查delegate方法存在
    if ([self.delegate respondsToSelector:@selector(getCurrentScore:)]) {
        [self.delegate getCurrentScore:currentScore];
    }
    // 1 begin 2 属性 3 commit
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    foreStarView.frame = CGRectMake(0, 0, self.bounds.size.width*currentScore, self.bounds.size.height);
    [UIView commitAnimations];
}
@end
