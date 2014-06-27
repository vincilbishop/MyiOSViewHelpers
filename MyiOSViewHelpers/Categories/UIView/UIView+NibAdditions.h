//
//  UIView+NibAdditions.h
//  Pods
//
//  Created by Vincil Bishop on 6/26/14.
//
//

#import <UIKit/UIKit.h>

@interface UIView (NibAdditions)

+ (instancetype) newViewWithNib;
+ (instancetype) newViewWithNibNamed:(NSString*)nibName;

@end