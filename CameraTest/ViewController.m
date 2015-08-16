//
//  ViewController.m
//  CameraTest
//
//  Created by Aaron Liu on 8/10/15.
//  Copyright (c) 2015 Aaron Liu. All rights reserved.
//

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>
#import <CoreImage/CoreImage.h>

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    


   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated
{
    NSArray *possibleDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    session.sessionPreset = AVCaptureSessionPresetMedium;
    
    CALayer *viewLayer = self.vImagePreview.layer;
    NSLog(@"viewLayer = %@", viewLayer);
    
    AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    
    captureVideoPreviewLayer.frame = self.vImagePreview.bounds;
    [self.vImagePreview.layer addSublayer:captureVideoPreviewLayer];
    
    AVCaptureDevice *device = [possibleDevices lastObject];

    
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (!input) {
        // Handle the error appropriately.
        NSLog(@"ERROR: trying to open camera: %@", error);
    }
    [session addInput:input];
    
    [session startRunning];
    // Use UIvisualeffects blur
    if (!UIAccessibilityIsReduceTransparencyEnabled()) {
        self.view.backgroundColor = [UIColor clearColor];
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.frame = self.view.frame;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
      
        blurEffectView.alpha = .8; // <==== USE THIS TO MANIPULATE BLUR INTENSITY
        
        [self.view addSubview:blurEffectView];
    }
    else {
        self.view.backgroundColor = [UIColor blackColor];
    }///// This is the ios8 visual effect framework
    // get your window screen size
    
    ////// ADD SATURATION, BRIGHTNESS, ALPHA
    // add a subview
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //create a new view with the same size
    UIView* coverView = [[UIView alloc] initWithFrame:screenRect];
    // change the background color to black and the opacity to 0.6
    UIColor * newColor = [ UIColor colorWithHue:.231 saturation:0 brightness:1 alpha:.2 ] ;
    coverView.backgroundColor = newColor;
    // add this new view to your main view
    [self.view addSubview:coverView];
}





- (IBAction)Stepperaction:(UIStepper *)sender {
    double value = sender.value;
    double bluralpha = value/100.0;
   // blurEffectView.alpha = bluralpha;
}

@end


