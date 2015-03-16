//
//  Well.m
//  SRC App
//
//  Created by Carlos Parada on 2/4/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import "Well.h"

@implementation Well

@synthesize id_field,id_project, id_well , name, coordinate_x,coordinate_y;

-(id) initWithId_well: (NSString *) cId_Well andId_project: (NSString *) cId_project andId_field: (NSString *) cId_field andName: (NSString *) cName andCoordinate_x: (NSString *) cCoordX andCoordinate_y:(NSString *) cCoordY


{
    self = [super init];
    if (self)
    {
        id_well= cId_Well;
        id_project = cId_project;
        id_field = cId_field;
        name = cName;
        coordinate_x= cCoordX;
        coordinate_y=cCoordY;
        
    }
    
    return self;
}



@end
