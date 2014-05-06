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

- (void) configureWithModelObject:(MYModelObjectBase*)modelObject
{
    self.modelObject = modelObject;
}

@end
