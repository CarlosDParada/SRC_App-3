//
//  InfowellViewController.h
//  SRC App
//
//  Created by admin on 5/30/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfowellViewController : UIViewController
 @property (strong, nonatomic) IBOutlet UITextView *countryTV;
   @property (strong, nonatomic) IBOutlet UITextView *locationXTV;
  @property (strong, nonatomic)  IBOutlet UITextView *locationYTV;
@property (strong, nonatomic)  IBOutlet UITextView *fieldTV;

@property (strong, nonatomic) UITextField *campoActivo;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancel;


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)data:(id)sender;
- (IBAction)lithology:(id)sender;
- (IBAction)addData:(id)sender;

@end
