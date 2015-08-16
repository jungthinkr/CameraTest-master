//
//  imageblur.h
//  CameraTest
//
//  Created by Aaron Liu on 8/15/15.
//  Copyright (c) 2015 Aaron Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
@interface imageblur : UIImage
- (UIImage *)imageWithGaussianBlur;
@end
