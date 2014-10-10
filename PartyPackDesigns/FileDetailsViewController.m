//
//  FileDetailsViewController.m
//  PartyPackDesigns
//
//  Created by Kevin Keyt on 6/13/14.
//  Copyright (c) 2014 Kevin Keyt. All rights reserved.
//

#import "FileDetailsViewController.h"
#import "PackItemsTableViewController.h"

@interface FileDetailsViewController ()

@end

@implementation FileDetailsViewController

@synthesize fileName = _fileName;
@synthesize folderName = _folderName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lblFileName.text = _fileName;
}

-(void)viewDidAppear:(BOOL)animated{
    NSString *filePath = [_folderName stringByReplacingOccurrencesOfString:@" " withString:@""];
    filePath = [filePath stringByAppendingString:[_fileName stringByReplacingOccurrencesOfString:@" " withString:@""]];
    NSURL *url = [[NSBundle mainBundle] URLForResource:filePath withExtension:@".pdf"];
    if(url){
        self.documentInterationColler = [UIDocumentInteractionController interactionControllerWithURL:url];
        [self.documentInterationColler setDelegate:self];
        [self.documentInterationColler presentPreviewAnimated:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UIViewController *) documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller{
    return [self navigationController];
}

-(void)documentInteractionControllerDidEndPreview:(UIDocumentInteractionController *)controller{
    //NSLog(@"Got Here!");
    //UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //PackItemsTableViewController *vc = [[PackItemsTableViewController alloc] initWithNibName:@"PackItemsTableViewController" bundle:nil];
    //vc.packName = _folderName;
    //[self.navigationController popToViewController:vc animated:YES];
    [self.navigationController popViewControllerAnimated:NO];
    //[self performSegueWithIdentifier:@"detailView" sender:self];
    //FileDetailsViewController *vc = (FileDetailsViewController *)self.navigationController;
    //vc.fileName = _fileName;
    //vc.folderName = _folderName;
    //[self.navigationController popToViewController:vc animated:YES];
    
    //[self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:NO];
}

/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual:@"detailview"]){
        FileDetailsViewController *vc = (FileDetailsViewController *)segue.destinationViewController;
        vc.fileName = _fileName;
        vc.folderName = _folderName;
    }
}*/

@end
