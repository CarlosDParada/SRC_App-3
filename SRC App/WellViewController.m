//
//  WellViewController.m
//  SRC App
//
//  Created by Carlos Parada on 2/4/15.
//  Copyright (c) 2015 Sinergia. All rights reserved.
//

#import "WellViewController.h"
#import "Well.h"
#import "DetailWellsViewController.h"
#import "DetailProjectsViewController.h"

#define getDataURL @"http://basededatosremotas.hol.es/dbdemon/get_well_by_project_json.php?id_project=%@"
@interface WellViewController ()

@end

@implementation WellViewController
@synthesize jsonArrayDataWell,wellsArray,sqlLine, id_project_view;

- (void)viewDidLoad {
    [super viewDidLoad];

    //set the title of your Vc
    self.title =@"Wells";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondoGris.jpg"]];
    
   // [sqlLine setText:id_project_view];
    

    //Load data
    [self retrieveData];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return wellsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Well * wellObject;
    wellObject = [wellsArray objectAtIndex:indexPath.row];
    cell.textLabel.text= wellObject.name;

   
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
        Well * object = [wellsArray objectAtIndex:indexPath.row];
        
        
        [[segue destinationViewController] getWell:object];
    }

}

#pragma mark -
#pragma mark Class Methods
-(void) retrieveData ;
{
  
     NSString *id_projectDB= id_project_view;
    
    NSString *url = [NSString stringWithFormat:@"http://basededatosremotas.hol.es/dbdemon/get_well_by_project_json.php?id_project=%@",id_projectDB];
     NSData *dta = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    jsonArrayDataWell = [NSJSONSerialization JSONObjectWithData:dta options:kNilOptions error:nil];
    
    //Set up our project array
    wellsArray = [[NSMutableArray alloc] init ];
    
    //Loop through or jsonArray
    for (int i=0; i<jsonArrayDataWell.count; i++) {
        //Crete our cityObjet
        
        NSString * cId_Well = [[jsonArrayDataWell objectAtIndex:i] objectForKey:@"id_well"];
        NSString * cId_project= [[jsonArrayDataWell objectAtIndex:i] objectForKey:@"id_project"];
        NSString * cId_field= [[jsonArrayDataWell objectAtIndex:i] objectForKey:@"id_field"];
        NSString * cName= [[jsonArrayDataWell objectAtIndex:i] objectForKey:@"name"];
        NSString * cCoordX= [[jsonArrayDataWell objectAtIndex:i] objectForKey:@"coordinate_x"];
        NSString * cCoordY= [[jsonArrayDataWell objectAtIndex:i] objectForKey:@"coordinate_y"];

    
        //Add the well object to our well array
        
        [wellsArray addObject:[[Well alloc] initWithId_well: (NSString *) cId_Well andId_project: (NSString *) cId_project andId_field: (NSString *) cId_field andName: (NSString *) cName andCoordinate_x: (NSString *) cCoordX andCoordinate_y:(NSString *) cCoordY]];
        
        
        //Reload our table view
        [self.tableView reloadData];
    }
}


@end
