//
//  LoginViewController.m
//  SRC App
//
//  Created by admin on 5/30/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import "LoginViewController.h"
#import "DatosGlobales.h"


@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize scrollView;
@synthesize campoActivo;

@synthesize userName;
@synthesize password;



//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
/////Esconder Teclado
    
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
    
/////fin

    
    // Traer el Dato del Servidor
    
   // NSString *strURL2 = [NSString stringWithFormat:@"http: //%@/get_all_user.php",[DatosGlobales datosGlobalesCompartidos].direccionServidor];
    
    //
    
    
    
}

//Acomodar vista
-(void) viewDidUnload
{
    [self setUserName:nil];
    [self setPassword:nil];
    [self setScrollView:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    [super viewDidUnload];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"INICIO-3.png"]];
    
}

//
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
//
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Accion Ocultar TEclado
-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [userName resignFirstResponder];
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


- (IBAction)signIn:(id)sender {
    /*
/////////////// Validar / Inicio de  Usuario
    
    //Creo una string que contendrá la url del PHP, que recibirá los TextFields
    NSString *strURL = [NSString stringWithFormat:@"http://basededatosremotas.hol.es/dbdemon/login.php?userName=%@&password=%@", userName.text, password.text];
    NSLog(@"%@",strURL);
    
    //Para ejecutar PHP
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSLog(@"%@",dataURL);
    
    //Para recibir el valor que retorna
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    NSLog(@"%@", strResult); //debug per veure que retorna
    
    //Sólo se muestra si retorna el text OK del php
    if ([strResult isEqualToString: @"Login OK"]){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Login"
                                                          message:@"Login correcto."
                                                         delegate:self
                                                cancelButtonTitle:@"Acceptar"
                                                otherButtonTitles: nil];
        [message show];
        
    }
    
    ////////// FIn
*/
    
}

- (IBAction)newUser:(id)sender {
    /* //////////////////////////////////////////////////////////// Llamado para guardar
     
     - (IBAction)buttonGuardar:(id)sender {
     
     NSString *strURL = [NSString stringWithFormat:@"http://localhost/geotips/insertaUsuarios.php?nombre=%@&apellidos=%@&usuario=%@&contrasenya=%@",textFieldNombre.text,textFieldApellidos.text,textFieldUsuario.text,textFieldContrasenya.text];
     
     
     
     
     
     //En dataURL guarda lo que recibe del php
     NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
     }
     */
}
@end
