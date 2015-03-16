//
//  Project.m
//  SRC App
//
//  Created by Carlos Parada on 1/29/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import "Project.h"

@implementation Project

@synthesize idproject , name, info;

-(id) initWithIdProject: (NSString *) cID andName: (NSString *) cName andInfo: (NSString *) cInfo

{
    self = [super init];
    if (self)
    {
        idproject = cID;
        name = cName;
        info = cInfo;
     
    }
    
    return self;
}


@end
