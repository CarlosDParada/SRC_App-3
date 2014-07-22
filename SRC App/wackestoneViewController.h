//
//  wackestoneViewController.h
//  SRC App
//
//  Created by admin on 5/31/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wackestoneViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UITextView *infowackestoneTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imagewackestone;
@property (weak, nonatomic) IBOutlet UITextView *depthTextField;
@property (weak, nonatomic) IBOutlet UITextView *porosityTextField;
@property (weak, nonatomic) IBOutlet UITextField *noteswackestoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;


@end
