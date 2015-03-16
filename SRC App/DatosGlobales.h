//
//  DatosGlobales.h
//  SRC App
//
//  Created by Carlos Parada on 11/13/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatosGlobales : NSObject{
    NSString *direccionServidor;
}
@property (nonatomic, retain) NSString *direccionServidor;
+ (DatosGlobales*)datosGlobalesCompartidos;

@end
