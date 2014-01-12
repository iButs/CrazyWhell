//
//  BTSCell.m
//  CrazyWheel
//
//  Created by user on 11.01.14.
//  Copyright (c) 2014 iButs. All rights reserved.
//

#import "BTSCell.h"

@implementation BTSCell
@synthesize Message;
@synthesize Title;


-(id)initCustomCellWithTable:(UITableView *)tableView withIdentifer:(NSString *)identifer {
    BTSCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[BTSCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    return cell;
}

-(BTSCell *)customCellFromObject:(NSDictionary *)anObject WithTableView:(UITableView *)tableView {
    Message.text = [anObject valueForKey:@"text"];
    Title.text = [anObject valueForKey:@"title"];
    CGRect frame = self.Message.frame;
    
    frame.size.height = 10*self.Message.text.length;
    self.Message.frame = frame;
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
