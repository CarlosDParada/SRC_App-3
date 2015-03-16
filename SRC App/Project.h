//
//  Project.h
//  SRC App
//
//  Created by Carlos Parada on 1/29/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject
@property (strong,nonatomic) NSString * idproject;
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * info;

#pragma mark
#pragma mark   Class Methods
-(id) initWithIdProject: (NSString *) cID andName: (NSString *) cName andInfo: (NSString *) cInfo;


@end
