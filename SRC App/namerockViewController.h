//
//  namerockViewController.h
//  SRC App
//
//  Created by admin on 5/31/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface namerockViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UILabel *namerockTextView;
@property (weak, nonatomic) IBOutlet UITextView *rockdescriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imagerock;
@property (weak, nonatomic) IBOutlet UITextField *notesTextField;
@property (weak, nonatomic) IBOutlet UITextView *depthTextField;
@property (weak, nonatomic) IBOutlet UITextView *porosityTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;


@property(weak, nonatomic) NSString * name_rock_terrigenous;


//@property(weak, nonatomic) NSString * id_rock_terrigenous;

@end
