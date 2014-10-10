//
//  FileDetailsViewController.h
//  PartyPackDesigns
//
//  Created by Kevin Keyt on 6/13/14.
//  Copyright (c) 2014 Kevin Keyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileDetailsViewController : UIViewController <UIDocumentInteractionControllerDelegate>
@property (nonatomic,retain) NSString *fileName;
@property (nonatomic,retain) NSString *folderName;
@property (nonatomic,retain) UIDocumentInteractionController *documentInterationColler;
@property (weak, nonatomic) IBOutlet UILabel *lblFileName;
@end
