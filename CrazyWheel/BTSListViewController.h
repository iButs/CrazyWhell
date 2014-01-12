//
//  BTSListViewController.h
//  CrazyWheel
//
//  Created by user on 11.01.14.
//  Copyright (c) 2014 iButs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTSListViewController : UITableViewController<UITableViewDelegate,NSURLConnectionDelegate>
@property (strong, nonatomic) NSArray* objects;
-(void)reLoadData;
@end
