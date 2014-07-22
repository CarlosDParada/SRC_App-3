//
//  crystallinecarbonateViewController.h
//  SRC App
//
//  Created by admin on 5/31/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface crystallinecarbonateViewController : UIViewController{
    
    
    IBOutlet UITextView *descriptioncrystallineTextView;
    IBOutlet UIImageView *imagecrystalline;
    IBOutlet UITextView *depthTextField;
    IBOutlet UITextView *porosityTextField;
    IBOutlet UITextField *notescrystallineTextField;
    
}
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@end
