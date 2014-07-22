//
//  LoginViewController.h
//  SRC App
//
//  Created by admin on 5/30/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController {
 IBOutlet UITextField *userName;
IBOutlet UITextField *password;

}
- (IBAction)signIn:(id)sender;
- (IBAction)newUser:(id)sender;

@end
