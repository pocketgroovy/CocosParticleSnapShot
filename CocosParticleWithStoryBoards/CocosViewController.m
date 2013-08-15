//
//  CocosViewController.m
//  CocosParticleWithStoryBoards
//
//  Created by Yoshihisa Miyamoto on 8/6/13.
//  Copyright (c) 2013 pocketgroovy. All rights reserved.
//

#import "CocosViewController.h"
#import "HelloWorldLayer.h"

@interface CocosViewController ()
{
    CCDirector * director;
    Snapshot  * snapShot;
}
@end

@implementation CocosViewController
@synthesize imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%s", __FUNCTION__);
    

	// Do any additional setup after loading the view.

    director = [CCDirector sharedDirector];
    
    CGSize winSize = director.winSize;
    
    CGRect frame = CGRectMake(0, 0, winSize.width, winSize.height);
    
    snapShot = [[Snapshot alloc]initWithFrame:frame];


    
    if([director isViewLoaded] == NO)
    {
    
        CCGLView *glView = [CCGLView viewWithFrame:[[[UIApplication sharedApplication] keyWindow]bounds]
								   pixelFormat:kEAGLColorFormatRGBA8
								   depthFormat:0
							preserveBackbuffer:YES  //YES for iOS6 
									sharegroup:nil
								 multiSampling:NO
							   numberOfSamples:0];
        
        director.view = glView;
        
        [director setAnimationInterval:1.0f/60.0f];
        [director enableRetinaDisplay:NO];                                          
    }
    
    director.delegate = self;
    
    [self addChildViewController:director];
    
    [self.view addSubview:director.view];
    [self.view sendSubviewToBack:director.view];
    
    [director didMoveToParentViewController:self];
    NSLog(@"before runWithScene %s", __FUNCTION__);

    if(![director runningScene])
    {
        [director runWithScene: [HelloWorldLayer  scene]] ;
        [director pause];

    }
    
}




-(NSString *)itemArchivePath
{
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"flowy.png" ];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated
{
    //[director release];
    
}



- (IBAction)showParticles:(id)sender {
    
   	[director resume];

}

-(void)image:(UIImage*)image savedWithError:(NSError*)error contextInfo:(void *)ctxInfo
{
    if(error)
    {
        NSLog(@"error -%s", __FUNCTION__);
    }
    else{
        NSLog(@"No error -%s", __FUNCTION__);
    }
    
}                                                                                                                                                                                                                                                                                                                                                                                                                               


//the the image is converted to png and saved to disc to avoid memory issue.
//directly loading the image to UIImage cause crash in device

- (IBAction)snapShot:(id)sender {
    
    [snapShot takeAsUIImage];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"flowyCC.png"];
    
    UIImage * imageShot = [UIImage imageWithContentsOfFile:path];
     [imageView setImage: imageShot];
    
}

@end
