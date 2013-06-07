//
//  FacebookShare.h
//  FacebookShareSample
//
//  Created by DpzAtMicRO on 25/02/13.
//  Copyright (c) 2013 DpzAtMicRO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FbGraph.h"

@protocol facebookShareDelegate <NSObject>

@optional
-(void)showALert:(NSString *)message;

@end
@interface FacebookShare : NSObject
{
    FbGraph *fbGraph;
    __unsafe_unretained id <facebookShareDelegate> delegate;
}
@property (nonatomic, assign) id <facebookShareDelegate> delegate;

-(void)postToFacebook:(NSString *)name productLink:(NSString *)productLink productImageUrl:(NSString *)imageUrl;
-(void)fbGraphCallback:(id)sender;
-(void)shareOnFacebook;

@property (nonatomic, retain) NSString *feedPostId;
@property (nonatomic, retain) NSString *modelName;
@property (nonatomic, retain) NSString *modelLink;
@property (nonatomic, retain) NSString *modelImageUrl;

@end
