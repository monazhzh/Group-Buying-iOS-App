//
//  ProductTableViewCell.h
//  团购
//
//  Created by Jones on 11/26/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDataSource.h"
@interface ProductTableViewCell : UITableViewCell
+(instancetype)createCellWithTableView:(UITableView *)tableView;
-(void)loadData:(ProductDataSource *)product;
@end
