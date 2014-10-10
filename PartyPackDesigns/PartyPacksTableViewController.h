//
//  PartyPacksTableViewController.h
//  PartyPackDesigns
//
//  Created by Kevin Keyt on 6/13/14.
//  Copyright (c) 2014 Kevin Keyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartyPacksTableViewController : UITableViewController<UIDocumentInteractionControllerDelegate>
@property (nonatomic,retain) NSArray *titleObjectArray;
@property (nonatomic,retain) NSArray *subtitleObjectArray;
@property (nonatomic,retain) NSArray *thumbnails;
@property (nonatomic,retain) NSString *packName;
@property int *packIndex;

@property (nonatomic,retain) UIDocumentInteractionController *documentInterationColler;
@end
