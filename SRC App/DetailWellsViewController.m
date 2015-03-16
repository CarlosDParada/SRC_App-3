//
//  DetailWellsViewController.m
//  SRC App
//
//  Created by Carlos Parada on 2/4/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import "DetailWellsViewController.h"

@interface DetailWellsViewController ()

@end

@implementation DetailWellsViewController
@synthesize id_wellLabel,id_projectLabel,id_fieldLabel,nameLabel,coordinate_xLabel,coordinate_yLabel,currentWell;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =currentWell.name;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondoGris.jpg"]];
    
    //Load up the UI
    [self setLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark -
#pragma mark Class Methods

-(void)getWell:(id)wellObject
{
    currentWell = wellObject;
    
}

-(void) setLabels
{
    id_wellLabel.text=currentWell.id_well;
    id_projectLabel.text=currentWell.id_project;
    id_fieldLabel.text=currentWell.id_field;
    nameLabel.text=currentWell.name;
    coordinate_xLabel.text=currentWell.coordinate_x;
    coordinate_yLabel.text=currentWell.coordinate_y;
}




@end
