//
//  MYModelObjectViewBase.m
//  Pods
//
//  Created by Vincil Bishop on 7/30/14.
//
//

#import "MYModelObjectViewBase.h"
#import "MYModelObjectBase.h"

@implementation MYModelObjectViewBase

- (void) configureWithModelObject:(MYModelObjectBase*)modelObject
{
    self.modelObject = modelObject;
}

@end
