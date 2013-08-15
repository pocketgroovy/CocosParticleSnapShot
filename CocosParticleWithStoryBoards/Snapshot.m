//
//  Snapshot.m
//  DemoView
//
//  Created by YOSHIHISA MIYAMOTO on 5/8/13.
//  Copyright (c) 2013 YOSHIHISA MIYAMOTO. All rights reserved.
//

#import "Snapshot.h"

@implementation Snapshot
{
    BBFImageStore * store;
}


-(void)takeAsUIImage
{
    GLint width;
    
    GLint height;
    
    
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &width);
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &height);
    
    NSLog(@"%d, %d", width, height);
    
    NSInteger bufferLength = width * height *4;
    // CGSize size = CGSizeMake(320, 460);
    //Create buffer for pixels
    //   GLuint bufferLength = size.width * size.height * 4;
    GLubyte* buffer = (GLubyte*)malloc(bufferLength);
    GLubyte* buffer2 = (GLubyte*)malloc(bufferLength);
    //Read Pixels from OpenGL
    glPixelStorei(GL_PACK_ALIGNMENT, 4);
    glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, buffer);
    glFinish();
    
    for(int y1=0; y1<height; y1++)
    {
        for(int x1=0; x1 <width *4; x1++)
        {
            buffer2[(height -1 -y1)*width *4 +x1] = buffer[y1*4*width+x1];
        }
    }
    
    //Make data provider with data.
    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, buffer2, bufferLength, NULL);
    //Configure image
    int bitsPerComponent = 8;
    int bitsPerPixel = 32;
    int bytesPerRow = 4 *width;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    CGImageRef iref = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpaceRef, bitmapInfo, provider, NULL, NO, renderingIntent);
    
    
    
    UIImage *outputImage = [UIImage imageWithCGImage:iref];
    NSData * image = UIImagePNGRepresentation(outputImage);
    
    //saving the image to disc as png
    [image writeToFile:[self screenshotPathForFile:@"flowyCC.png"] atomically:YES];
    
    //Dealloc
    CGImageRelease(iref);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpaceRef);
    free(buffer);
    free(buffer2);
    
}



//get path to save the data
-(NSString *)screenshotPathForFile:(NSString *)file
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    NSString * screenshotPath =[documentsDirectory stringByAppendingPathComponent:file];
    return screenshotPath;
}


@end
