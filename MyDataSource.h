//
//  MyDataSource.h
//  团购
//
//  Created by Jones on 11/26/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDataSource : NSObject
+(instancetype)getInstance;

-(void)setCityName:(NSString*)str;
-(NSString*)getCityName;
-(void)setHomeData:(NSMutableArray *)array;
-(NSMutableArray *)getHomeData;
@end
