//
//  PackItemsTableViewController.h
//  PartyPackDesigns
//
//  Created by Kevin Keyt on 6/13/14.
//  Copyright (c) 2014 Kevin Keyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PackItemsTableViewController : UITableViewController<UIDocumentInteractionControllerDelegate>
@property (nonatomic, retain) NSString *packName;
@property int *packIndex;
@property (nonatomic,retain) NSArray *packItemsArray;
@property (strong, nonatomic) IBOutlet UITableView *tblPackFiles;
@property (nonatomic,retain) NSString *fileName;

@property (nonatomic,retain) UIDocumentInteractionController *documentInterationColler;
@end
