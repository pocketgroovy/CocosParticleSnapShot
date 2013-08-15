//
//  CocosViewController.h
//  CocosParticleWithStoryBoards
//
//  Created by Yoshihisa Miyamoto on 8/6/13.
//  Copyright (c) 2013 pocketgroovy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "Snapshot.h"
#import "BBFImageStore.h"

@interface CocosViewController : UIViewController<CCDirectorDelegate>
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

- (IBAction)showParticles:(id)sender;
- (IBAction)snapShot:(id)sender;
@end
