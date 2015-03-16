//
//  ProjectTableViewController.m
//  SRC App
//
//  Created by Carlos Parada on 1/28/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import "ProjectViewController.h"
#import "Project.h"
#import "DetailProjectsViewController.h"

#define getDataURL @"http://basededatosremotas.hol.es/dbdemon/get_all_project_json.php"
@interface ProjectViewController ()

@end


@implementation ProjectViewController
@synthesize jsonArray,projectsArray;
- (void)viewDidLoad {
    [super viewDidLoad];
  
    //set the title of your Vc
    self.title =@"Project";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondoGris.jpg"]];
    //Load data
    [self retrieveData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return projectsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Project * projectObject;
    projectObject = [projectsArray objectAtIndex:indexPath.row];
    cell.textLabel.text= projectObject.name;
     // cell.textLabel.text= projectObject.info;
    
    //accessory
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"pushDetailView"])
    {
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        Project * object = [projectsArray objectAtIndex:indexPath.row];
        
        [[segue destinationViewController] getProject:object];
        
    }
}


#pragma mark -
#pragma mark Class Methods
-(void) retrieveData;
{
    NSURL * url = [NSURL URLWithString:getDataURL];
    NSData * dta = [NSData dataWithContentsOfURL:url];
    
    jsonArray = [NSJSONSerialization JSONObjectWithData:dta options:kNilOptions error:nil];
    
    //Set up our project array
    projectsArray = [[NSMutableArray alloc] init ];
    
    //Loop through or jsonArray
    for (int i=0; i<jsonArray.count; i++) {
        //Crete our cityObjet
        NSString * cID = [[jsonArray objectAtIndex:i] objectForKey:@"idproject"];
        NSString * cName = [[jsonArray objectAtIndex:i] objectForKey:@"name"];
        NSString * cInfo = [[jsonArray objectAtIndex:i] objectForKey:@"info"];
        
        //Add the city object to our cities array
        
        [projectsArray addObject:[[Project alloc] initWithIdProject:cID andName:cName andInfo:cInfo]];
        
        
        //Reload our table view
        [self.tableView reloadData];
    }
}
@end
