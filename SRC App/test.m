//
//  test.m
//  SRC App
//
//  Created by Carlos Parada on 2/17/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import "test.h"

@interface test ()

@end

@implementation test

@synthesize milabel, id_project_temp;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * temp= id_project_temp;
    
   [ milabel setText:temp];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
