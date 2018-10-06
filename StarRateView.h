//
//  StarRateView.h
//  团购
//
//  Created by Jones on 11/28/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StarRateViewDelegate <NSObject>

-(void)getCurrentScore:(CGFloat)currentScore;

@end

@interface StarRateView : UIView
@property(nonatomic,weak)id<StarRateViewDelegate> delegate;
@end
