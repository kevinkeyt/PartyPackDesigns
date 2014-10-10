//
//  SimpleTableCell.h
//  PartyPackDesigns
//
//  Created by Kevin Keyt on 6/25/14.
//  Copyright (c) 2014 Kevin Keyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel *nameLabel;
@property (nonatomic,weak) IBOutlet UIImageView *thumbnailImageView;
@end
