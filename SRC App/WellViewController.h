//
//  WellViewController.h
//  SRC App
//
//  Created by Carlos Parada on 2/4/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WellViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray * jsonArrayDataWell;

@property (nonatomic,strong) NSMutableArray * wellsArray;


@property (weak, nonatomic) IBOutlet UILabel *sqlLine;


@property(weak, nonatomic) NSString * id_project_view;

#pragma mark -
#pragma mark Class Methods
-(void) retrieveData;

@end
