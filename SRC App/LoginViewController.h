//
//  LoginViewController.h
//  SRC App
//
//  Created by admin on 5/30/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) UITextField *campoActivo;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


    
    


- (IBAction)signIn:(id)sender;
- (IBAction)newUser:(id)sender;



@end
