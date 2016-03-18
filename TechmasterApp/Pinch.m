//
//  Pinch.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/8/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "Pinch.h"

@interface Pinch ()

@end

@implementation Pinch {
    UIImageView *girl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    girl = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, self.view.bounds.size.width - 40, self.view.bounds.size.height - 100)];
    girl.image = [UIImage imageNamed:@"playboy.jpg"];
    girl.userInteractionEnabled = true;
    girl.multipleTouchEnabled = true;
    
    [self.view addSubview:girl];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(onPinchGesture:)];
    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                                              action:@selector(onRotateGesture:)];
    [girl addGestureRecognizer:pinchGesture];
    [girl addGestureRecognizer:rotateGesture];
}

- (void) onPinchGesture: (UIPinchGestureRecognizer *)pinchGesture {
    [self adjustAnchorPointForGestureRecognizer:pinchGesture];
    if (pinchGesture.state == UIGestureRecognizerStateBegan ||
        pinchGesture.state == UIGestureRecognizerStateChanged) {
        girl.transform = CGAffineTransformScale(girl.transform, pinchGesture.scale, pinchGesture.scale);
        pinchGesture.scale = 1.0;
    }
}

- (void) onRotateGesture: (UIRotationGestureRecognizer *)rotateGesture {
    [self adjustAnchorPointForGestureRecognizer:rotateGesture];
    if (rotateGesture.state == UIGestureRecognizerStateBegan ||
        rotateGesture.state == UIGestureRecognizerStateChanged) {
        girl.transform = CGAffineTransformRotate(girl.transform, rotateGesture.rotation);
        rotateGesture.rotation = 0.0;
    }
}

- (void) adjustAnchorPointForGestureRecognizer: (UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperView = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperView;
    }
}



@end
