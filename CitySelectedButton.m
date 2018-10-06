//
//  CitySelectedButton.m
//  团购
//
//  Created by Jones on 10/29/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import "CitySelectedButton.h"

@implementation CitySelectedButton
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 50;
    CGFloat h = 44;
    return CGRectMake(x, y, w, h);
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat w = 15;
    CGFloat h = 15;
    CGFloat x = 50;
    CGFloat y = (44-15)/2;

    return CGRectMake(x, y, w, h);
}
@end
