//
//  PrincipalViewController.m
//  SRC App
//
//  Created by admin on 5/30/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import "PrincipalViewController.h"

@interface PrincipalViewController ()
{
    NSMutableArray *objecto;
    
    NSDictionary *diccionario;
    
    //definimos las claves
    
    NSString *idproject;
    
    NSString *name;
    
    NSString *info;
    
    //mostrar cuando se cargan y procesan los datos
    
    UIAlertView *cargando;
}
@end

@implementation PrincipalViewController



@synthesize datosRecibidos;


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
    
    // Do any additional setup after loading the view, typically from a nib.
    
    idproject = @"idProject";
    
    name = @"Name";
    
    info = @"Info";
    
    
    objecto = [[NSMutableArray alloc] init];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://basededatosremotas.hol.es/dbdemon/get_all_project_json.php"] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    
    NSURLConnection *conexion = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    
    //cargando - esto lo mostramos para notificar al usuario el estado de petición y procesamiento de datos.
    /*
    cargando = [[UIAlertView alloc] initWithTitle:@"Loading" message:@"Please wait while the server data obtained" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    
    [cargando show];
    
    ///////////////////////////////////////////////// 
     */
    if(conexion){
        
        self.datosRecibidos = [NSMutableData data] ;
        
    }else{
        
        UIAlertView *errConexion = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error en la conexión" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        
        [errConexion show];
  
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response

{
    
    [datosRecibidos setLength:0];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
    
    [datosRecibidos appendData:data];
    
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error

{
    
    
    //informamos al usuario
    
    UIAlertView *errConexion = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error en la conexión" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
    
 
}

*/
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    if(datosRecibidos){
        
        [cargando dismissWithClickedButtonIndex:0 animated:YES];
        NSError *e = nil;
        
       id jsonObjects = [NSJSONSerialization JSONObjectWithData:datosRecibidos options:NSJSONReadingMutableContainers error:&e];
        
        for(NSDictionary *dataDict in jsonObjects){
            
            NSString *strIdProject = [dataDict objectForKey:@"IdProject"];
            
            NSString *strName = [dataDict objectForKey:@"Name"];
            
            NSString *strInfo = [dataDict objectForKey:@"Info"];
            
            //definimos diccionario tupla id, valor
            
            diccionario =[NSDictionary dictionaryWithObjectsAndKeys:
                          
                          strIdProject, idproject,
                          
                          strName,name,
                          
                          strInfo,info,
                          
                          nil];
            
            [objecto addObject:diccionario];
            
        }
        

        
    }
    

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"Numero de entradas: %lu", (unsigned long)objecto.count);
    
    int numCount = [objecto count];
    
    if(numCount == 0) return 1;
    
    else return objecto.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    int numCount = [objecto count];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        
        //uso por defecto del estilo de cell
        
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] ;
        
    }
    
    if(numCount == 0)
        
        cell.textLabel.text = @"Cargando...";
    
    else{
        
        NSDictionary *tmpDict = [objecto objectAtIndex:indexPath.row];
        
        //TablaID
        
        NSString *titulo = [NSString stringWithFormat:@"IdProject: %@", [tmpDict objectForKey:idproject]];
        
        //Nombre y Descripción
        
        NSString *subtitulo = [NSString stringWithFormat:@"Name: %@, Info: %@",[tmpDict objectForKey:name],[tmpDict objectForKey:info]];
        
        cell.textLabel.text = titulo;
        
        cell.detailTextLabel.text = subtitulo;
        
    }
    
    return cell;
    
}






@end
