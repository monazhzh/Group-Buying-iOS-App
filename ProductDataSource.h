//
//  ProductDataSource.h
//  团购
//
//  Created by Jones on 11/26/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductDataSource : NSObject
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *subtitle1;
@property(nonatomic,copy)NSString *subtitle2;
@property(nonatomic,copy)NSString *subtitle3;
@property(nonatomic,copy)NSString *saledNum;
@end
