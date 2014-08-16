//
//  MYModelObjectViewBase.m
//  Pods
//
//  Created by Vincil Bishop on 7/30/14.
//
//

#import "MYModelObjectViewBase.h"

@implementation MYModelObjectViewBase

- (void) configureWithModelObject:(id<MYParseableModelObject>)modelObject
{
    self.modelObject = modelObject;
}

@end
