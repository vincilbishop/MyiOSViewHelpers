//
//  MYModelObjectViewController.m
//  Pods
//
//  Created by Vincil Bishop on 5/5/14.
//
//

#import "MYModelObjectViewControllerBase.h"

@interface MYModelObjectViewControllerBase ()

@end

@implementation MYModelObjectViewControllerBase

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    if (self.modelObject) {
        [self configureWithModelObject:self.modelObject];
    }
    
}

- (void) configureWithModelObject:(id<MYParseableModelObject>)modelObject
{
    self.modelObject = modelObject;
}

#pragma mark - Details View -

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier hasPrefix:@"pushToDetails"]) {
         [self setModelObject:self.modelObject forDestination:segue.destinationViewController];
    }
}

- (void) setModelObject:(id<MYParseableModelObject>)modelObject forDestination:(UIViewController*)destinationController
{
    MYModelObjectViewControllerBase *controller = nil;
    
    if ([destinationController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController*)destinationController;
        controller = navigationController.topViewController;
    } else if ([destinationController isKindOfClass:[MYModelObjectViewControllerBase class]]) {
        controller = destinationController;
    } else {
        NSAssert(NO,@"segue.destinationViewController must be kindOfClass:[MYModelObjectViewControllerBase class]");
    }
    
    controller.modelObject = modelObject;
}

@end
