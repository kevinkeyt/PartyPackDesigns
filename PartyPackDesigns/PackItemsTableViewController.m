//
//  PackItemsTableViewController.m
//  PartyPackDesigns
//
//  Created by Kevin Keyt on 6/13/14.
//  Copyright (c) 2014 Kevin Keyt. All rights reserved.
//

#import "PackItemsTableViewController.h"
#import "FileDetailsViewController.h"
@interface PackItemsTableViewController ()

@end

@implementation PackItemsTableViewController

@synthesize packName = _packName;
@synthesize packIndex = _packIndex;

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
}


-(void) viewDidAppear:(BOOL)animated
{
    self.title = _packName;
    switch((int)_packIndex){
        //NSLog(@"Value: %d", (int)_packIndex);
        case 0: self.packItemsArray = @[@"Bowties Boy",@"Bowties Girl",@"Mustaches Boy",@"Mustaches Girl",@"Signs Boy",@"Signs Girl",@"Toys Boy",@"Toys Girl",]; break;
        case 1: self.packItemsArray = @[@"Bowties",@"Elf Hat",@"Santa Beard",@"Santa Hat",@"Signs",@"Top Hat",]; break;
        case 2: self.packItemsArray = @[@"Glasses",@"Glasses Pink",@"Hats",@"Hats Pink",@"Microphone",@"Microphone Pink",@"Mustaches",@"Ties",@"Ties Pink",]; break;
        case 3: self.packItemsArray = @[@"Lips",@"Mustaches",@"Prince Crowns",@"Princess Crowns",@"Sheilds",@"Signs",]; break;
        case 4: self.packItemsArray = @[@"Bowties",@"Glasses Green",@"Masks Blue",@"Masks Green",@"Mustaches",@"Mustaches Black Dots",@"Signs Green",@"Signs Red",]; break;
        case 5: self.packItemsArray = @[@"Bowties",@"Cups",@"Lips",@"Signs",@"Tea Pot",]; break;
        case 6: self.packItemsArray = @[@"Glasses",@"Glasses Two",@"Lips Red",@"Mustaches",@"Mustaches Two",@"Signs",@"Top Hat",]; break;
    }
    [self.tblPackFiles reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.packItemsArray = nil;
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
    return self.packItemsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.packItemsArray objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    //self.fileName = [self.packItemsArray objectAtIndex:indexPath.row];
    //[self performSegueWithIdentifier:@"detailview" sender:self];
    
    
    
    NSString *filePath = [self.packName stringByReplacingOccurrencesOfString:@" " withString:@""];
    filePath = [filePath stringByAppendingString:[[self.packItemsArray objectAtIndex:indexPath.row] stringByReplacingOccurrencesOfString:@" " withString:@""]];
    NSURL *url = [[NSBundle mainBundle] URLForResource:filePath withExtension:@".pdf"];
    if(url){
        self.documentInterationColler = [UIDocumentInteractionController interactionControllerWithURL:url];
        [self.documentInterationColler setDelegate:self];
        [self.documentInterationColler presentPreviewAnimated:YES];
    }
}

/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual:@"detailview"]){
        FileDetailsViewController *vc = (FileDetailsViewController *)segue.destinationViewController;
        vc.fileName = self.fileName;
        vc.folderName = self.packName;
    }
}*/

-(UIViewController *) documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller{
    return [self navigationController];
}


@end
