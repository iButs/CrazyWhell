//
//  BTSDetailViewController.h
//  CrazyWheel
//
//  Created by user on 11.01.14.
//  Copyright (c) 2014 iButs. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BTSDetailViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) NSDictionary* currentObject;
@property (weak, nonatomic) IBOutlet UITextField *TitleName;
@property (weak, nonatomic) IBOutlet UITextView *MessageField;
@end
