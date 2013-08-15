//
//  HelloWorldLayer.h
//  ParticleTest
//
//  Created by Yoshihisa Miyamoto on 8/5/13.
//  Copyright pocketgroovy 2013. All rights reserved.
//



// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import <OpenGLES/EAGLDrawable.h>

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor

@property (nonatomic, strong)CCParticleSpringParticle * emitter;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
