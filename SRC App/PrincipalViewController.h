//
//  PrincipalViewController.h
//  SRC App
//
//  Created by admin on 5/30/14.
//  Copyright (c) 2014 Sinergia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrincipalViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>




{
    IBOutlet UITableView *tableProjects;
}
@property(nonatomic,assign) NSMutableData *datosRecibidos;

@end
