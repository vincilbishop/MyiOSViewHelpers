//
//  MYModelObjectTableViewCellBase.m
//  Pods
//
//  Created by Vincil Bishop on 4/5/14.
//
//

#import "MYModelObjectTableViewCellBase.h"
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

- (void) configureWithModelObject:(id<MYParseableModelObject>)modelObject
{
    self.modelObject = modelObject;
}

- (UITableView *) parentTableView {
    // iterate up the view hierarchy to find the table containing this cell/view
    UIView *aView = self.superview;
    while(aView != nil) {
        if([aView isKindOfClass:[UITableView class]]) {
            return (UITableView *)aView;
        }
        aView = aView.superview;
    }
    return nil; // this view is not within a tableView
}

- (NSIndexPath*) indexPath
{
    NSIndexPath *indexPath = [self.parentTableView indexPathForCell:self];
    return indexPath;
}

@end
