//
//  DetailProjectsViewController.m
//  SRC App
//
//  Created by Carlos Parada on 1/29/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import "DetailProjectsViewController.h"
#import "WellViewController.h"
#import "test.h"

@interface DetailProjectsViewController ()

@end
@implementation DetailProjectsViewController
@synthesize idprojectLabel,nameLabel,infoLabel,currentProject;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.title =currentProject.name;
      self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondoGris.jpg"]];
  
    
    //Load up the UI
    [self setLabels];
    
}

// pasar a la siguiente vista el id

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"project_well"]){
        
    UINavigationController *nav = segue.destinationViewController;
        WellViewController *vista = (WellViewController *)nav.topViewController;
        //Para donde va             //Para Donde Va
        NSString *intro = currentProject.idproject;
                    //Varaible de donde Viene
        vista.id_project_view=intro;
        
    }
    
}

//end

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resoxurces that can be recreated.
}



#pragma mark -
#pragma mark Class Methods

-(void)getProject:(id)projectObject
{
    currentProject = projectObject;

}
-(void) setLabels
{
    idprojectLabel.text=currentProject.idproject;
    nameLabel.text=currentProject.name;
    infoLabel.text=currentProject.info;
    
    
}



@end
