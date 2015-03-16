//
//  crystallinecarbonateViewController.m
//  SRC App
//
//  Created by admin on 5/31/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import "crystallinecarbonateViewController.h"

@interface crystallinecarbonateViewController ()

@end

@implementation crystallinecarbonateViewController

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
    //Esconder Teclado
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    //fin
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Accion Ocultar TEclado
-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [porosityTextField resignFirstResponder];
    [descriptioncrystallineTextView resignFirstResponder];
    [depthTextField resignFirstResponder];
        [notescrystallineTextField resignFirstResponder];
    
}
//fin

- (IBAction)cancel:(id)sender {
}

- (IBAction)save:(id)sender {
}
@end
