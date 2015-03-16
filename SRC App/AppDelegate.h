//
//  AppDelegate.h
//  SRC App
//
//  Created by InternerS3-02 on 29/05/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSString *dataBaseName;
@property (nonatomic, retain) NSString *dataBasePath;


//Coredata

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;

//Fin CoreData



@end
