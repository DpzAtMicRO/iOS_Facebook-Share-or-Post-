//
//  FBShareSampleViewController.h
//  FacebookShareSample
//
//  Created by DpzAtMicRO on 25/02/13.
//  Copyright (c) 2013 DpzAtMicRO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookShare.h"

@interface FBShareSampleViewController : UIViewController<UITextViewDelegate,facebookShareDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

//UIOutlets-UITextView
@property (strong, nonatomic) IBOutlet UITextView *messageText;
@property (strong, nonatomic) IBOutlet UITextView *linkText;
@property (strong, nonatomic) IBOutlet UITextView *imageUrlText;

//button actions
- (IBAction)fshareClicked:(id)sender;

@end
