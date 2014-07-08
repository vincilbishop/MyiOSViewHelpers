//
//  MyDrawerViewController.m
//  Pods
//
//  Created by Vincil Bishop on 3/9/14.
//
//

#import "MYDrawerViewController.h"

@implementation MYDrawerViewController

#pragma mark - Static -

static MYDrawerViewController *_sharedViewController;

static UIViewController *_leftDrawerViewController;
static UIViewController *_centerViewController;
static UIViewController *_rightDrawerViewController;

+ (MYDrawerViewController*) sharedViewController
{
    if (!_sharedViewController) {
        _sharedViewController = [MYDrawerViewController new];
    }
    
    return _sharedViewController;
}

+ (void) setSharedViewController:(MYDrawerViewController*)sharedViewController
{
    _sharedViewController = sharedViewController;
}

+ (void) setLeftDrawerViewController:(UIViewController*)viewController
{
    _leftDrawerViewController = viewController;
    
    if (_sharedViewController) {
        _sharedViewController.leftDrawerViewController = _leftDrawerViewController;
    }
}

+ (void) setCenterViewController:(UIViewController*)viewController
{
    _centerViewController = viewController;
    
    if (_sharedViewController) {
        _sharedViewController.centerViewController = _centerViewController;
    }
}

+ (void) setRightDrawerViewController:(UIViewController*)viewController
{
    _rightDrawerViewController = viewController;
    
    if (_sharedViewController) {
        _sharedViewController.rightDrawerViewController = _rightDrawerViewController;
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCenterViewController:_centerViewController leftDrawerViewController:_leftDrawerViewController rightDrawerViewController:_rightDrawerViewController];
    
    if (self) {
        
        [MYDrawerViewController setSharedViewController:self];
    }
    
    return self;
}

- (void) goToViewControllerWithIdentifier:(NSString*)identifier storyboard:(UIStoryboard*)storyboard
{
    if (!storyboard) {
        storyboard = self.storyboard;
    }
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        self.centerViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
        [self closeDrawerAnimated:YES completion:^(BOOL finished) {
            
        }];
    }];
}

@end
