//
//  InfoViewController.h
//  PartyPackDesigns
//
//  Created by Kevin Keyt on 7/9/14.
//  Copyright (c) 2014 Kevin Keyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnViewSite;
- (IBAction)btnViewSiteClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
