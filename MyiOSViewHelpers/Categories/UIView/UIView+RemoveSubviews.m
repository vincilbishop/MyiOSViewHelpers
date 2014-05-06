//
//  UIView+RemoveSubviews.m
//  CPKit
//
//  Created by Vincil Bishop on 8/8/13.
//  Copyright (c) 2013 CookingPlanIt. All rights reserved.
//

#import "UIView+RemoveSubviews.h"

@implementation UIView (RemoveSubviews)

- (void) removeAllSubviews
{
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [((UIView*)obj) removeFromSuperview];
    }];
}

@end
