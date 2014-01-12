//
//  BTSDetailViewController.m
//  CrazyWheel
//
//  Created by user on 11.01.14.
//  Copyright (c) 2014 iButs. All rights reserved.
//

#import "BTSDetailViewController.h"


@interface BTSDetailViewController ()

@end

@implementation BTSDetailViewController
@synthesize currentObject;
@synthesize MessageField;
@synthesize TitleName;


- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *title = [currentObject valueForKey:@"title"];
    TitleName.text = title;
    MessageField.text = [currentObject valueForKey:@"text"];
    self.title = title;
}

@end
