//
//  HelloWorldLayer.m
//  ParticleTest
//
//  Created by Yoshihisa Miyamoto on 8/5/13.
//  Copyright pocketgroovy 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer
@synthesize emitter;
// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
    NSLog(@"%s", __FUNCTION__);

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if (self=[super initWithColor:ccc4(255,255,255,255)])
    {
        [self setTouchEnabled:YES];
        


        CCSprite * bg = [CCSprite spriteWithFile:@"cupcake.png"];
        [bg setPosition:ccp(240, 200)];
        [self addChild:bg z:0];
        
        emitter = [[CCParticleSpringParticle alloc]initWithTotalParticles:10];
        emitter.texture = [[CCTextureCache sharedTextureCache]addImage:@"star.png"];
        emitter.scale = 5.0f;
        emitter.position = ccp(150, 160);
        emitter.speed = 50;
        emitter.speedVar = 10;
        emitter.life = 10;
        [self addChild:emitter z:0];
        NSLog(@"%s", __FUNCTION__);
	}
	return self;
}





-(void)ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent *)event
{
    [self ccTouchesMoved:touches withEvent:event];
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * myTouch = [touches anyObject];
    CGPoint location = [myTouch locationInView:[myTouch view]];
    CGPoint point = [[CCDirector sharedDirector]convertToGL:location];
    emitter.position = ccp(point.x, point.y);
    
}



@end
