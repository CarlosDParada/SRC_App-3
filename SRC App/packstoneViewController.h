//
//  packstoneViewController.h
//  SRC App
//
//  Created by admin on 5/31/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface packstoneViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UITextView *infopackstoneTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imagepackstone;
@property (weak, nonatomic) IBOutlet UITextView *depthTextField;
@property (weak, nonatomic) IBOutlet UITextView *porosityTextField;
@property (weak, nonatomic) IBOutlet UITextField *notespackstoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;

@end
