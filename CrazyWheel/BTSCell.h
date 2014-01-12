//
//  BTSCell.h
//  CrazyWheel
//
//  Created by user on 11.01.14.
//  Copyright (c) 2014 iButs. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BTSCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UITextView *Message;

- (BTSCell *)customCellFromObject:(NSDictionary *) anObject WithTableView:(UITableView *)tableView;
- (id) initCustomCellWithTable:(UITableView *)tableView withIdentifer:(NSString *)identifer;
@end
