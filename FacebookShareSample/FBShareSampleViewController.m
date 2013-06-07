//
//  FBShareSampleViewController.m
//  FacebookShareSample
//
//  Created by DpzAtMicRO on 25/02/13.
//  Copyright (c) 2013 DpzAtMicRO. All rights reserved.
//

#import "FBShareSampleViewController.h"

@implementation FBShareSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
}
-(void)viewWillAppear:(BOOL)animated
{
    //set background imageview color
    [self.backgroundImageView setBackgroundColor:[UIColor colorWithRed:0.231 green:0.349 blue:0.596 alpha:1.0]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [self setBackgroundImageView:nil];
    [self setMessageText:nil];
    [self setLinkText:nil];
    [self setImageUrlText:nil];
    [super viewDidUnload];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self removeKeypad];
    
}
#pragma mark - Custom methods

-(void)removeKeypad
{
    [self.view endEditing:YES];
}

#pragma mark - UITextField delegates
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    switch (textView.tag)
    {
        case 1:
            [self.messageText setText:@""];
            break;
        case 2:
            [self.linkText setText:@""];
            break;
        case 3:
            [self.imageUrlText setText:@""];
            break;
        default:
            break;
    }
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self removeKeypad];
}

#pragma mark - UIButton actions
- (IBAction)fshareClicked:(id)sender
{
    FacebookShare *facebookShare = [[FacebookShare alloc] init];
    [facebookShare setDelegate:self];
    if ([self.messageText.text length] == 0)
    {
        self.messageText.text=@"From FBSharesample app";
    }
    else if([self.imageUrlText.text length] == 0)
    {
        self.imageUrlText.text=@"http://www.siamnewcar.com/mimage/large/tritonsingle.jpg";
    }
    else if ([self.linkText.text length] == 0)
    {
        self.linkText.text=@"www.facebook.com";
    }
    [facebookShare postToFacebook:self.messageText.text productLink:self.linkText.text productImageUrl:self.imageUrlText.text];
}

#pragma mark - facebook share delegates
-(void)showALert:(NSString *)message
{
    UIAlertView *sharedAlert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [sharedAlert show];
}
@end
