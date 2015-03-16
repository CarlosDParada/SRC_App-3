//
//  DetailWellsViewController.h
//  SRC App
//
//  Created by Carlos Parada on 2/4/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import "ViewController.h"
#import "Well.h"

@interface DetailWellsViewController : ViewController
@property(nonatomic,strong) IBOutlet UILabel * id_wellLabel;
@property(nonatomic,strong) IBOutlet UILabel * id_projectLabel;
@property(nonatomic,strong) IBOutlet UILabel * id_fieldLabel;
@property(nonatomic,strong) IBOutlet UILabel * nameLabel;
@property(nonatomic,strong) IBOutlet UILabel * coordinate_xLabel;
@property(nonatomic,strong) IBOutlet UILabel * coordinate_yLabel;


@property(nonatomic,strong) Well * currentWell;


#pragma mark -
#pragma mark Class Methods
-(void)getWell:(id)wellObject;
-(void) setLabels;
@end
