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

+ (MYModelObjectTableViewCellBase*) newTableViewCell
{
    MYModelObjectTableViewCellBase *newTableViewCell = nil;
    // Load the top-level objects from the custom cell XIB.
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:newTableViewCell options:nil];
    // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
    newTableViewCell = [topLevelObjects objectAtIndex:0];
    
    return newTableViewCell;
}

- (void) configureWithModelObject:(MYModelObjectBase*)modelObject
{
    self.modelObject = modelObject;
}

@end
