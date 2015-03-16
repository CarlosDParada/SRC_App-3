//
//  infoterrigenousViewController.m
//  SRC App
//
//  Created by admin on 5/31/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import "infoterrigenousViewController.h"
#import "namerockViewController.h"

@interface infoterrigenousViewController ()

@end

@implementation infoterrigenousViewController
@synthesize matrix, feldspar,lithic,quartz;
@synthesize sqlLine;
@synthesize namelabel;

NSString *Smatriz, *Squartz,*Sfeldspar,*Slithic , *name;
double Dmatriz, Dquartz,Dfeldspar,Dlithic;



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



//Accion Ocultar TEclado
-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [matrix resignFirstResponder];
    [quartz resignFirstResponder];
    [feldspar resignFirstResponder];
    [lithic resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"set_terrigenous"]){
        
        UINavigationController *nav = segue.destinationViewController;
        namerockViewController *vista = (namerockViewController *)nav.topViewController;
        
        // NSString *intro = name;
        vista.name_rock_terrigenous=name;
        
    }
}



- (IBAction)classification:(id)sender {
    //Accion de Clasificar
    

    
    Smatriz =[[NSString alloc] initWithString:matrix.text];
    Dmatriz = [Smatriz doubleValue];
   
    Squartz =[[NSString alloc] initWithString:quartz.text];
    Dquartz= [Squartz doubleValue];
    
    Sfeldspar =[[NSString alloc] initWithString:matrix.text];
    Dfeldspar = [Sfeldspar doubleValue];
    
    Slithic =[[NSString alloc] initWithString:matrix.text];
    Dlithic = [Slithic doubleValue];
    
    
    if (Dmatriz <= 15 && Dquartz >= 90) {//M <= 15%  and Q>= 90%
        name = @"Cuarzo Arenisca";
    } else if (Dmatriz <= 15 && Dfeldspar >= 25 && (Dfeldspar == Dlithic
                                                    || Dfeldspar > Dlithic)) {//M <= 15%  and F>=25%  and (F=L or F>L)
       name = @"Arcosa";
    } else if (Dmatriz <= 15 && Dfeldspar >= 5 && Dfeldspar <= 25  && (Dfeldspar == Dlithic || Dfeldspar > Dlithic)) {//M <= 15% and F>=5% and F<=25%  and ( F=L or F>L)
    name = @"Subarcosa";
   } else if (Dmatriz <= 15 && Dlithic >= 25 && Dlithic > Dfeldspar) {//M <= 15% and L >=25% and  L > F
       name = @"Litoarenisca";
   } else if (Dmatriz <= 15 && Dlithic >= 5 && Dlithic <= 25 && Dlithic > Dfeldspar) {//M <=15  and L >=5% and  L<= 25  and L>F
       name = @"Sublitoarenisca";
   } else if (Dmatriz > 15 && Dquartz >= 90) {//M> 15% and Q>=90%
       name = @"Cuarzo Grauvacas";
   } else if (Dmatriz > 15 && Dfeldspar >= 5 && Dfeldspar > Dlithic) {//M> 15%  and F>=5% and F>L
       name = @"Grauvacas Feldespaticas";
   } else if (Dmatriz > 15 && Dlithic >= 5 && Dlithic > Dfeldspar) {//M>15 and L>=5%  and L>F
       name = @"Grauvacas Liticas";
   } else if (Dmatriz >= 75) {//M>75%
       name = @"Lutitas";
   } else {
       name = @"No identificada";
       }
    
   //[namelabel setText:(name)];
    //Creo una string que contendrá la url del PHP, que recibirá los TextFields
    
    NSString *strURL = [NSString stringWithFormat:@"http://basededatosremotas.hol.es/dbdemon/save_terrigenous.php?name=%@&matrix=%@&quartz=%@&feldspar=%@&lithic=%@",name,matrix.text,quartz.text,feldspar.text,lithic.text];
    
    
    
   // [namelabel setText:(strURL)];
    
    // En dataURL guarda lo que recibe del php
    
    // to execute php code
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    
    
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    NSLog(@"%@", strResult); //debug per veure que retorna
    
    [namelabel setText:(strResult)];

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


- (IBAction)cancel:(id)sender {
    //Accion de Cancelar
}
@end
