//
//  DatosGlobales.m
//  SRC App
//
//  Created by Carlos Parada on 11/13/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import "DatosGlobales.h"


@implementation DatosGlobales
@synthesize direccionServidor;
static DatosGlobales *datosGlobalesCompartidos = nil;

+ (DatosGlobales*)datosGlobalesCompartidos {
    if (datosGlobalesCompartidos == nil) {
        datosGlobalesCompartidos = [[super allocWithZone:NULL] init];
        
        // initialize your variables here
        datosGlobalesCompartidos.direccionServidor = @"http://basededatosremotas.hol.es/dbdemon/";
    }
    return datosGlobalesCompartidos;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self)
    {
        if (datosGlobalesCompartidos == nil)
        {
            datosGlobalesCompartidos = [super allocWithZone:zone];
            return datosGlobalesCompartidos;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}
/*
- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (void)release {
 //do nothing
 }


- (id)autorelease {
    return self;
}
*/
@end

