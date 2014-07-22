//
//  InfowellViewController.h
//  SRC App
//
//  Created by admin on 5/30/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfowellViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UITextView *countryTextView;
@property (weak, nonatomic) IBOutlet UITextView *locationXTexView;
@property (weak, nonatomic) IBOutlet UITextView *locationYTextView;
@property (weak, nonatomic) IBOutlet UITextView *fieldTextView;
@property (weak, nonatomic) IBOutlet UIButton *adddataButton;
@property (weak, nonatomic) IBOutlet UIButton *dataButton;
@property (weak, nonatomic) IBOutlet UIButton *lithologyButton;

@end
