//
//  NewUser.h
//  SRC App
//
//  Created by Carlos Parada on 11/27/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewUser : UIViewController

@property (strong, nonatomic) UITextField *campoActivo;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *last_name;
@property (strong, nonatomic) IBOutlet UITextField *user_name;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) IBOutlet UITextField *sqlLine;


- (IBAction)newUser:(id)sender;


@end
