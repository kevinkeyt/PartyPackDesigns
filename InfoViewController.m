//
//  InfoViewController.m
//  PartyPackDesigns
//
//  Created by Kevin Keyt on 7/9/14.
//  Copyright (c) 2014 Kevin Keyt. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
@end

@implementation InfoViewController

@synthesize scrollView;

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
    // Do any additional setup after loading the view.
    self.title = @"Information";
    
    [scrollView setScrollEnabled:YES];
    [scrollView setContentSize:CGSizeMake(320, 510)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnViewSiteClick:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.amandakeyt.com"]];
}
@end
