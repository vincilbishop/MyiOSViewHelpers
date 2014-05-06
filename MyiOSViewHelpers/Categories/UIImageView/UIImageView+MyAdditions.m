//
//  UIImageView+MyAdditions.m
//  Pods
//
//  Created by Vincil Bishop on 2/20/14.
//
//

#import "UIImageView+MyAdditions.h"
#import "UIImage+MyPlaceholderAdditions.h"

@implementation UIImageView (MyAdditions)

- (void) showPlaceholderImage
{
    self.image = [UIImage placeholderImage];
}




@end
