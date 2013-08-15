//
//  Snapshot.h
//  DemoView
//
//  Created by YOSHIHISA MIYAMOTO on 5/8/13.
//  Copyright (c) 2013 YOSHIHISA MIYAMOTO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OpenGLES/EAGLDrawable.h>
#import <OpenGLES/ES1/glext.h>
#import "BBFImageStore.h"
@interface Snapshot : UIView
@property (nonatomic, copy)NSData * imageData;
@property (nonatomic, copy)UIImage * image;

-(void)takeAsUIImage;

@end
