//
//  UIView+NibAdditions.m
//  Pods
//
//  Created by Vincil Bishop on 6/26/14.
//
//

#import "UIView+NibAdditions.h"

@implementation UIView (NibAdditions)

+ (instancetype) newViewWithNib
{
    return [self newViewWithNibNamed:NSStringFromClass(self)];
}

+ (instancetype) newViewWithNibNamed:(NSString*)nibName
{
    NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    UIView* mainView = (UIView*)[nibViews objectAtIndex:0];
    return mainView;
}

@end
