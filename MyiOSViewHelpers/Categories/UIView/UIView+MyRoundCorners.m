//
//  UIView+MyRoundCorners.m
//  Pods
//
//  Created by Vincil Bishop on 4/16/14.
//
//

#import "UIView+MyRoundCorners.h"

@implementation UIView (MyRoundCorners)

- (void) setRoundCorners
{
    self.layer.cornerRadius = 6.0;
    self.clipsToBounds = YES;
    [self.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.layer setBorderWidth:0.5];

}

@end
