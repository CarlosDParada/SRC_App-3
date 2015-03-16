//
//  Well.h
//  SRC App
//
//  Created by Carlos Parada on 2/4/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Well : NSObject
@property (strong,nonatomic) NSString * id_well;
@property (strong,nonatomic) NSString * id_project;
@property (strong,nonatomic) NSString * id_field;
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * coordinate_x;
@property (strong,nonatomic) NSString * coordinate_y;

#pragma mark
#pragma mark   Class Methods
-(id) initWithId_well: (NSString *) cId_Well andId_project: (NSString *) cId_project andId_field: (NSString *) cId_field andName: (NSString *) cName andCoordinate_x: (NSString *) cCoordX andCoordinate_y:(NSString *) cCoordY;



@end
