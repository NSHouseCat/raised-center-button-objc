//
//  MainTabBarController.m
//  raised-center-button-objc
//
//  Created by Andrew Nordahl on 2/26/18.
//  Copyright © 2018 Andrew Nordahl. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()
@property (strong, nonatomic) UIButton *middleButton;
@end

@implementation MainTabBarController

@synthesize middleButton;

- (void)awakeFromNib {
    [super awakeFromNib];
    middleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self setupMiddleButton];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.isHidden) {
        return [super hitTest:point withEvent:event];
    }
    
    CGPoint from = point;
    CGPoint to = middleButton.center;
    
    return (sqrt(((from.x - to.x) * (from.x - to.x)) + ((from.y - to.y) * (from.y - to.y))) <= 39) ? middleButton : [super hitTest:point withEvent:event];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [middleButton setCenter:CGPointMake(UIScreen.mainScreen.bounds.size.width / 2, 0)];
}

- (void)setupMiddleButton {
    [middleButton setFrame:CGRectMake(0, 0, 70, 70)];
    [middleButton setCenter:CGPointMake(UIScreen.mainScreen.bounds.size.width / 2, 0)];
    middleButton.backgroundColor = UIColor.blueColor;
    middleButton.layer.cornerRadius = 35;
    middleButton.layer.masksToBounds = TRUE;
    [middleButton addTarget:self action:@selector(middleButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:middleButton];
}

- (void)middleButtonPressed {
    NSLog(@"Button Pressed");
}

@end
