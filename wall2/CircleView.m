//
//  CircleView.m
//
//
//  Created by Divyanshu Sharma on 27/01/16.
//  Copyright (c) 2016 Divyanshu Sharma.
//
#import "CircleView.h"
#import "UIBezierPath+Rob_points.h"
#import "Global.h"


@implementation CircleView
{
    Global *global;
}

- (void)setInterval:(CGFloat)interval {
    _interval = interval;
    [self setNeedsDisplay];
}


// My Custom Method for drawing view in circular path,

- (void)drawRect:(CGRect)rect {
    
    global = [Global shareInstance];
    
    global.numCircle = [NSNumber numberWithInt:0];
    
    NSInteger less = 22-[global.numDays integerValue];
    
   __block  UIImage *arrow;

    arrow = [CircleView imageWithImage:[UIImage imageNamed:@"dotb.png"] scaledToSize:CGSizeMake(5, 5)];


    UIBezierPath *cPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.bounds.origin.x+5, self.bounds.origin.y+5, self.bounds.size.width-10, self.bounds.size.height-10)];

    [cPath Rob_forEachPointAtInterval:self.interval perform:^(CGPoint point, CGVector vector) {
        CGContextRef gc = UIGraphicsGetCurrentContext();
        CGContextSaveGState(gc); {

            CGContextTranslateCTM(gc, point.x, point.y);
            CGContextConcatCTM(gc, CGAffineTransformMake(vector.dx, vector.dy, -vector.dy, vector.dx, 0, 0));
            CGContextTranslateCTM(gc, -0.5 * arrow.size.width, -0.5 * arrow.size.height);
            if(self.tag != 101)
            {
            if([global.numCircle integerValue]<less)
            {
                arrow = [CircleView imageWithImage:[UIImage imageNamed:@"dotb.png"] scaledToSize:CGSizeMake(5, 5)];
                global.numCircle = [NSNumber numberWithInteger:[global.numCircle integerValue]+1];
                

            }
            else if([global.numCircle integerValue]>=less && [global.numCircle integerValue]<22)
            {
                arrow = [CircleView imageResize:arrow andResizeTo:CGSizeMake(3, 3)];
                global.numCircle = [NSNumber numberWithInteger:[global.numCircle integerValue]+1];
            }
            else
            {
                arrow = [CircleView imageWithImage:[UIImage imageNamed:@"dotb.png"] scaledToSize:CGSizeMake(5, 5)];
                global.numCircle = [NSNumber numberWithInteger:[global.numCircle integerValue]+1];
            }
            }
            [arrow drawAtPoint:CGPointZero];
        } CGContextRestoreGState(gc);
    }];
}


// Class method to scale image

+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

// class method to resize image

+(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
    CGFloat scale = [[UIScreen mainScreen]scale];
    /*You can remove the below comment if you dont want to scale the image in retina   device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
