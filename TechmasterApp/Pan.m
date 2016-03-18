//
//  Pan.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/8/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "Pan.h"

@interface Pan ()

@end

@implementation Pan {
    UIImageView *bullEye, *target;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    bullEye = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BullEye.png"]];
    bullEye.userInteractionEnabled = YES;
    
    target = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Target.png"]];
    target.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    
    [self.view addSubview:target];
    [self.view addSubview:bullEye];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self 
                                                                                 action:@selector(onPan:)];
    
    [bullEye addGestureRecognizer:panGesture];
    
}

- (void) onPan: (UIPanGestureRecognizer*) pan {
    if (pan.state == UIGestureRecognizerStateChanged ||
        pan.state == UIGestureRecognizerStateBegan) {
    
        bullEye.center = [pan locationInView:self.view];
        [self bullEyeInTarget:bullEye.center];
    }
}

- (BOOL) bullEyeInTarget: (CGPoint) bullEyeCenter {
    CGFloat distanceDoubleSquare = powf(bullEyeCenter.x - target.center.x, 2) + powf(bullEyeCenter.y - target.center.y, 2);
    if (distanceDoubleSquare < 20) {
        NSLog(@"Match");
        return true;
    } else {
        return false;
    }
}

@end
