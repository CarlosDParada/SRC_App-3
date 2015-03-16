//
//  infoterrigenousViewController.h
//  SRC App
//
//  Created by admin on 5/31/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface infoterrigenousViewController : UIViewController


@property (nonatomic, retain) IBOutlet UITextField *matrix;
    
@property (nonatomic, retain) IBOutlet UITextField *quartz;
    
@property (nonatomic, retain) IBOutlet UITextField *feldspar;
    
@property (nonatomic, retain) IBOutlet UITextField *lithic;

@property (strong, nonatomic) IBOutlet UITextField *sqlLine;

@property (weak, nonatomic) IBOutlet UITextField *namelabel;

//Anadir ScrollView a el .h 
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;



- (IBAction)classification:(id)sender;
- (IBAction)cancel:(id)sender;

@end

