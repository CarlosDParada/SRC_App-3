//
//  NewUser.m
//  SRC App
//
//  Created by Carlos Parada on 11/27/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import "NewUser.h"

@interface NewUser ()

@end

@implementation NewUser
@synthesize scrollView;
@synthesize campoActivo;
@synthesize name;
@synthesize last_name;
@synthesize user_name;
@synthesize password;
@synthesize email;
@synthesize sqlLine;


- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    [self setName:nil];
    [self setLast_name:nil];
    [self setEmail:nil];
    [self setUser_name:nil];
    [self setPassword:nil];
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
//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Accion Ocultar TEclado
-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [name resignFirstResponder];
    [user_name resignFirstResponder];
    [last_name resignFirstResponder];
    [email resignFirstResponder];
    [password resignFirstResponder];
    
}
//fin

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

- (IBAction)newUser:(id)sender {
    
    //Creo una string que contendrá la url del PHP, que recibirá los TextFields
    NSString *strURL = [NSString stringWithFormat:@"http://basededatosremotas.hol.es/dbdemon/save_user.php?name=%@&lastName=%@&userName=%@&email=%@&password=%@",name.text,last_name.text,user_name.text,email.text,password.text];

    
    [sqlLine setText:(strURL)];
    
    // En dataURL guarda lo que recibe del php
    
    // to execute php code
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    NSLog(@"%@", strResult); //debug per veure que retorna
    
    //Sólo se muestra si retorna el text OK del php
    if ([strResult isEqualToString: @"OK"]){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"UserName"
                                                          message:@"UsernName correcto."
                                                         delegate:self
                                                cancelButtonTitle:@"Acceptar"
                                                otherButtonTitles: nil];
        [message show];
        
    }
}

///
@end
