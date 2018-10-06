//
//  ItemViewController.h
//  团购
//
//  Created by Jones on 11/27/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import "BaseViewController.h"
#import "ProductDataSource.h"
@interface ItemViewController : BaseViewController
@property(nonatomic,strong)ProductDataSource *itemDatasource;
@end
