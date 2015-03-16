//
//  ProjectTableViewController.h
//  SRC App
//
//  Created by Carlos Parada on 1/28/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray * jsonArray;

@property (nonatomic,strong) NSMutableArray * projectsArray;

@property(nonatomic,retain) NSString * id_project_view;

#pragma mark -
#pragma mark Class Methods
-(void) retrieveData;
@end
