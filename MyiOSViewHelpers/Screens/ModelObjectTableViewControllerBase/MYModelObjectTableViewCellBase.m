//
//  MYModelObjectTableViewCellBase.m
//  Pods
//
//  Created by Vincil Bishop on 4/5/14.
//
//

#import "MYModelObjectTableViewCellBase.h"
#import "MYModelObjectBase.h"
#import "MYModelObjectTableViewControllerBase.h"

@implementation MYModelObjectTableViewCellBase

- (void) configureWithModelObject:(MYModelObjectBase*)modelObject
{
    self.modelObject = modelObject;
}

@end
