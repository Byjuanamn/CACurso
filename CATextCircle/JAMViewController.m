//
//  JAMViewController.m
//  CATextCircle
//
//  Created by Juan Antonio Martin Noguera on 23/05/14.
//  Copyright (c) 2014 cloudonmobile. All rights reserved.
//

@import QuartzCore;

#import "JAMViewController.h"

@interface JAMViewController ()

@end

@implementation JAMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self rotateImage:CGRectMake(0, 0, 200, 200)];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImage *) rotateImage:(CGRect) bounds{
    
    NSString *alfabeto = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    UIGraphicsBeginImageContext(bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(CGRectGetWidth(bounds)/2, CGRectGetHeight(bounds)/2);
    CGFloat r = center.x * 0.75f;
    
    CGContextTranslateCTM(context, center.x, center.y);
    
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:15];
    
    
    for (int i = 0; i < 26; i++) {
        NSString *letter = [alfabeto substringWithRange:NSMakeRange(i, 1)];
        CGSize letterSize = [letter sizeWithFont:font];
        
        CGFloat theta = i *((M_PI * 2) / 26.f);
        
        CGContextSaveGState(context);
        
        CGContextRotateCTM(context, theta);
        
        CGContextTranslateCTM(context, -letterSize.width / 2, -r);
        
        [letter drawAtPoint:CGPointMake(0, 0) withFont:font];
        
        CGContextRestoreGState(context);
        
        
    }
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}




























@end
