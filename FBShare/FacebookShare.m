//
//  FacebookShare.m
//  FacebookShareSample
//
//  Created by Deepak on 25/02/13.
//  Copyright (c) 2013 cabot. All rights reserved.
//

#import "FacebookShare.h"
#import "JSON.h"

#warning Regsiter your project and enter the appID.
//enter your clientId here
#define FB_CLIENT_ID @""
#define DICT_SIZE 5
#define FB_LINK_KEY @"link"
#define FB_NAME_KEY @"name"
#define FB_PICTURE_KEY @"picture"
#define FB_CAPTION_KEY @"caption"
#define FB_DESCRIPTION_KEY @"description"
#define FB_SHARE_CAPTION @"set the caption here"
#define FB_SHARE_DESCRIPTION  @"set description here"
#define FB_SHARED_ALERT @"Shared on Facebook"

@implementation FacebookShare

@synthesize modelImageUrl,modelLink,modelName,feedPostId;
@synthesize delegate;

-(id)init
{
    return [super init];
}

#pragma mark - Custom methods
-(void)postToFacebook:(NSString *)name productLink:(NSString *)productLink productImageUrl:(NSString *)imageUrl
{
    modelName = name;
    modelLink = productLink;
    modelImageUrl = imageUrl;
    
    #warning Regsiter your project and enter the appID.
    //create a clientID for your project by registering at http://developers.facebook.com/  and enter the app ID above
    NSString *clientID = FB_CLIENT_ID;
    
    fbGraph = [[FbGraph alloc]initWithFbClientID:clientID];
    [FbGraph StoreShareid:self];
    [fbGraph authenticateUserWithCallbackObject:self andSelector:@selector(fbGraphCallback:) andExtendedPermissions:@"user_photos,user_videos,publish_stream,offline_access,user_checkins,friends_checkins"];
}
-(void)fbGraphCallback:(id)sender
{
    if ( (fbGraph.accessToken == nil) || ([fbGraph.accessToken length] == 0) )
    {
        //NSLog(@"You pressed the 'cancel' or 'Dont Allow' button, you are NOT logged into Facebook...I require you to be logged in & approve access before you can do anything useful....");
        //restart the authentication process.....
        [fbGraph authenticateUserWithCallbackObject:self andSelector:@selector(fbGraphCallback:)
                             andExtendedPermissions:@"user_photos,user_videos,publish_stream,offline_access,user_checkins,friends_checkins"];
    }
    else
    {
        //NSLog(@"----------->CONGRATULATIONS<-----------, You're logged into Facebook... Your oAuth token is: %@", fbGraph.accessToken);
    }
}
-(void)shareOnFacebook;
{
    //  share the details on facebook
    
    NSMutableDictionary *variables = [NSMutableDictionary dictionaryWithCapacity:DICT_SIZE];
    [variables setObject:modelLink forKey:FB_LINK_KEY];
    [variables setObject:modelName forKey:FB_NAME_KEY];
    if(modelImageUrl)
        [variables setObject:modelImageUrl forKey:FB_PICTURE_KEY];
    
    [variables setObject:FB_SHARE_CAPTION forKey:FB_CAPTION_KEY];
    [variables setObject:FB_SHARE_DESCRIPTION forKey:FB_DESCRIPTION_KEY];
    
    FbGraphResponse *fb_graph_response = [fbGraph doGraphPost:@"me/feed" withPostVars:variables];
    if(fb_graph_response.error)
    {
        NSLog(@"ERROR");
    }
    
    //parse our json
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *facebook_response = [parser objectWithString:fb_graph_response.htmlResponse error:nil];
    
    //let's save the 'id' Facebook gives us so we can delete it if the user presses the 'delete /me/feed button'
    self.feedPostId = (NSString *)[facebook_response objectForKey:@"id"];
    if(feedPostId)
    {
        // NSLog(@"Now log into Facebook and look at your profile...");
        [delegate showALert:FB_SHARED_ALERT];
    }
}

@end
