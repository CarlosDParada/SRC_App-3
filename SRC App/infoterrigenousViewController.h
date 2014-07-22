//
//  infoterrigenousViewController.h
//  SRC App
//
//  Created by admin on 5/31/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface infoterrigenousViewController : UIViewController

//Anadir ScrollView a el .h 
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


  @property (strong, nonatomic)  IBOutlet UITextField *matrix;
 
  @property (strong, nonatomic)  IBOutlet UITextField *quartz;

  @property (strong, nonatomic)  IBOutlet UITextField *feldspar;
    
  @property (strong, nonatomic)  IBOutlet UITextField *lithic;

- (IBAction)classification:(id)sender;
- (IBAction)cancel:(id)sender;

@end

