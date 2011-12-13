//
//  TVCPresidents.m
//  US Presidents
//
//  Created by damian on 09/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TVCPresidents.h"
#import "President.h"

@implementation TVCPresidents

@synthesize importedRows = _importedRows;

- (NSArray *) csvArray2PresidentsArray:(NSArray *)csvArray {
    int i = 0;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterNoStyle];     
    
    NSMutableArray *ma = [[NSMutableArray alloc] init];
    
    for (NSArray *row in csvArray) {
        
        //1st row is a header - skip
        if (i > 0) {
            
            President *_president = [[President alloc] init];
            
           	_president.no = [numberFormatter numberFromString:[row objectAtIndex:0]];
            _president.name = [row objectAtIndex:1];
            _president.wikiurl = [row objectAtIndex:2];
            _president.tookOffice = [dateFormat dateFromString:[row objectAtIndex:3]];
            _president.leftOffice = [dateFormat dateFromString:[row objectAtIndex:4]];
            _president.party = [row objectAtIndex:5];
            _president.homeState = [row objectAtIndex:6];
            
            [ma addObject:_president];
        }
        i++;
    }
    
    return (NSArray *) ma;
}

- (void)handleOpenURL:(NSURL *)url {
    NSError *outError;
    NSString *fileString = [NSString stringWithContentsOfURL:url 
                                                    encoding:NSUTF8StringEncoding error:&outError];
    
    if (fileString) {
        self.importedRows = [self csvArray2PresidentsArray:[fileString csvRows]];
    }
    
    [self.tableView reloadData];
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /*
    NSError *outError = nil;
    NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"USPresidents"  ofType:@"csv"];
    NSString *fileString = [NSString stringWithContentsOfFile:fullPath encoding:NSUTF8StringEncoding error:&outError];
    self.importedRows = [self csvArray2PresidentsArray:[fileString csvRows]];
    */
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.importedRows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateStyle:NSDateFormatterShortStyle];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    President *p = (President *)[self.importedRows objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%d - %@", [p.no intValue], p.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", 
                                 [dateFormat stringFromDate:p.tookOffice], 
                                 (p.leftOffice != nil ? [dateFormat stringFromDate:p.leftOffice] : @"incumbent")
                                 ];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
