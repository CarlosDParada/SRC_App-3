//
//  infoterrigenousViewController.m
//  SRC App
//
//  Created by admin on 5/31/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import "infoterrigenousViewController.h"

@interface infoterrigenousViewController ()

@end

@implementation infoterrigenousViewController
@synthesize quartz;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)classification:(id)sender {
    //Accion de Clasificar
}

- (IBAction)cancel:(id)sender {
    //Accion de Cancelar
}
@end
