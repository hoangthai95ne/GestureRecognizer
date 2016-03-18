//
//  Tap.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/8/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "Tap.h"

@interface Tap ()

@end

@implementation Tap {
    UIImageView *grass;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    grass = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grass.png"]];
    grass.frame = self.view.bounds;
    grass.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(onTap:)];
    [self.view addSubview:grass];
    [grass addGestureRecognizer:tapGesture];
}

- (void) onTap: (UITapGestureRecognizer*) tap {
    CGPoint center = [tap locationInView:self.view];
    [self addAntWithCenter:center];
}

- (void) addAntWithCenter: (CGPoint) center {
    UIImageView *ant = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ant.png"]];
    ant.frame = CGRectMake(0, 0, 50, 50);
    ant.center = center;
    [grass addSubview:ant];
}

@end
