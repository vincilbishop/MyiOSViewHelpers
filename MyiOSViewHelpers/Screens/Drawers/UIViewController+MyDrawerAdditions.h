//
//  UIViewController+MyDrawerAdditions.h
//  Pods
//
//  Created by Vincil Bishop on 3/9/14.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (MYDrawerAdditions)

- (void) setupGestureRecognizers;
- (void) setupLeftMenuButton;
- (void) setupRightMenuButton;
- (void) setupStandardDrawers;

- (void) goToViewControllerWithIdentifier:(NSString *)identifier;

@end
