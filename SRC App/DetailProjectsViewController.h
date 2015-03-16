//
//  DetailProjectsViewController.h
//  SRC App
//
//  Created by Carlos Parada on 1/29/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import "ViewController.h"
#import "Project.h"

@interface DetailProjectsViewController : ViewController

@property(nonatomic,strong) IBOutlet UILabel * idprojectLabel;
@property(nonatomic,strong) IBOutlet UILabel * nameLabel;
@property(nonatomic,strong) IBOutlet UILabel * infoLabel;


@property(nonatomic,strong) Project * currentProject;



#pragma mark - 
#pragma mark Class Methods
-(void)getProject:(id)projectObject;
-(void) setLabels;
@end