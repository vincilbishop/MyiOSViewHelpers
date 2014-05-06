//
//  MyDrawerViewController.h
//  Pods
//
//  Created by Vincil Bishop on 3/9/14.
//
//

#import <UIKit/UIKit.h>
#import "UIViewController+MYDrawerAdditions.h"
#import "MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"

@interface MYDrawerViewController : MMDrawerController

@property (nonatomic,strong) UIStoryboard *storyboard;

+ (MYDrawerViewController*) sharedViewController;
+ (void) setSharedViewController:(MYDrawerViewController*)sharedViewController;

+ (void) setLeftDrawerViewController:(UIViewController*)viewController;
+ (void) setCenterViewController:(UIViewController*)viewController;
+ (void) setRightDrawerViewController:(UIViewController*)viewController;

- (void) goToViewControllerWithIdentifier:(NSString*)identifier storyboard:(UIStoryboard*)storyboard;

@end