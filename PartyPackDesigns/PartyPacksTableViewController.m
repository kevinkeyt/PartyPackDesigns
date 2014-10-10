//
//  PartyPacksTableViewController.m
//  PartyPackDesigns
//
//  Created by Kevin Keyt on 6/13/14.
//  Copyright (c) 2014 Kevin Keyt. All rights reserved.
//

#import "PartyPacksTableViewController.h"
#import "PackItemsTableViewController.h"
#import "SimpleTableCell.h"

@interface PartyPacksTableViewController ()

@end

@implementation PartyPacksTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleObjectArray = @[@"Baby",@"Holiday",@"Rock Star",@"Royal",@"Super Hero",@"Tea Party",@"Wedding",];
    //self.subtitleObjectArray = @[@"Pirates",@"Animals",@"Sea Creatures",@"Flowers",@"Sports",];
    self.thumbnails = @[@"Rattle.png",@"BowTie.png",@"MustacheApp.png",@"Crown.png",@"Mask.png",@"Tea.png",@"LipsIcon.png",];
    
    
    NSArray *ver = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
    if ([[ver objectAtIndex:0] intValue] >= 7)
    {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:219.0/255.0 green:0.0/255.0 blue:6.0/255.0 alpha:1];
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.translucent = NO;
        NSMutableDictionary *textAttributes = [[NSMutableDictionary alloc] initWithDictionary:self.navigationController.navigationBar.titleTextAttributes];
        [textAttributes setValue:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
        self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    }
    else
    {
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:219.0/255.0 green:0.0/255.0 blue:6.0/255.0 alpha:1];
    }
    
    UIButton* infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
	[infoButton addTarget:self action:@selector(infoButtonAction) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *modalButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
	[self.navigationItem setLeftBarButtonItem:modalButton animated:YES];
	//[modalButton release];
}

-(void)infoButtonAction
{
    /*NSURL *url = [[NSBundle mainBundle] URLForResource:@"Instructions" withExtension:@".pdf"];
    if(url){
        self.documentInterationColler = [UIDocumentInteractionController interactionControllerWithURL:url];
        [self.documentInterationColler setDelegate:self];
        [self.documentInterationColler presentPreviewAnimated:YES];
    }*/
    [self performSegueWithIdentifier:@"infoview" sender:self];
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,  tableView.bounds.size.width, 30)];
    
//    UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake (0,0,320,30)];
//    labelHeader.textColor = [UIColor whiteColor];
//    [headerView setBackgroundColor:[UIColor redColor]];
//    labelHeader.text = @"Photo Booth Props";
//    return headerView;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.titleObjectArray = nil;
    self.subtitleObjectArray = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.titleObjectArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //cell.textLabel.text = [self.titleObjectArray objectAtIndex:indexPath.row];
    //cell.imageView.image = [UIImage imageNamed:[_thumbnails objectAtIndex:indexPath.row]];
    //cell.detailTextLabel.text = [self.subtitleObjectArray objectAtIndex:indexPath.row];
    
    //return cell;
    
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameLabel.text = [self.titleObjectArray objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[_thumbnails objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.packName = [self.titleObjectArray objectAtIndex:indexPath.row];
    self.packIndex = (int *)indexPath.row;
    [self performSegueWithIdentifier:@"packitems" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual:@"packitems"]){
        PackItemsTableViewController *vc = (PackItemsTableViewController *)segue.destinationViewController;
        vc.packName = self.packName;
        vc.packIndex = self.packIndex;
    }
}

-(UIViewController *) documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller{
    return [self navigationController];
}

@end
