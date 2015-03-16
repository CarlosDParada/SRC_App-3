//
//  InfowellViewController.m
//  SRC App
//
//  Created by admin on 5/30/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import "InfowellViewController.h"

@interface InfowellViewController ()

@end

@implementation InfowellViewController
@synthesize campoActivo;
@synthesize countryTV;
@synthesize locationXTV;
@synthesize locationYTV;
@synthesize fieldTV;
@synthesize scrollView;


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
    
    //Esconder Teclado
    
    //Setup del UIScrollView
    [[self scrollView] setContentSize:[[self view] frame].size];
    
    //Notificaciones del teclado
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(apareceElTeclado:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(desapareceElTeclado:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    //Detección de toques en el scroll view
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewPulsado)];
    [tapRecognizer setCancelsTouchesInView:NO];
    [[self scrollView] addGestureRecognizer:tapRecognizer];
    
    //fin
    
}


//Acomodar Vista

- (void)viewDidUnload
{
    [self setCountryTV:nil];
    [self setLocationXTV:nil];
    [self setLocationYTV:nil];
    [self setFieldTV: nil];
    [self setScrollView:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
//
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Accion Ocultar TEclado
-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [countryTV resignFirstResponder];
    [locationXTV resignFirstResponder];
    [locationYTV resignFirstResponder];
    [fieldTV resignFirstResponder];
    
}
//fin


//// Metodos Adicionales
#pragma mark - Métodos de UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self setCampoActivo:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self setCampoActivo:nil];
}

///
#pragma mark - Notificaciones del teclado
- (void) apareceElTeclado:(NSNotification *)laNotificacion
{
    NSDictionary *infoNotificacion = [laNotificacion userInfo];
    CGSize tamanioTeclado = [[infoNotificacion objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 0, tamanioTeclado.height, 0);
    [[self scrollView] setContentInset:edgeInsets];
    [[self scrollView] setScrollIndicatorInsets:edgeInsets];
    
    [[self scrollView] scrollRectToVisible:[self campoActivo].frame animated:YES];
}

- (void) desapareceElTeclado:(NSNotification *)laNotificacion
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    UIEdgeInsets edgeInsets = UIEdgeInsetsZero;
    [[self scrollView] setContentInset:edgeInsets];
    [[self scrollView] setScrollIndicatorInsets:edgeInsets];
    [UIView commitAnimations];
}

#pragma mark - Métodos de acción adicionales
- (void) scrollViewPulsado
{
    [[self view] endEditing:YES];
}
///


- (IBAction)data:(id)sender {
}

- (IBAction)lithology:(id)sender {
}

- (IBAction)addData:(id)sender {
}
@end
