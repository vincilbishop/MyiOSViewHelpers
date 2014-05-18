//
//  MYModelObjectTableViewControllerBase.m
//  Pods
//
//  Created by Vincil Bishop on 4/5/14.
//
//

#import "MYModelObjectTableViewControllerBase.h"
#import "MYModelObjectBase.h"
#import "MYModelObjectTableViewCellBase.h"
#import "MYModelObjectViewControllerBase.h"

@interface MYModelObjectTableViewControllerBase ()

@end

@implementation MYModelObjectTableViewControllerBase

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.modelClassNames = [NSMutableArray new];
    }
    return self;
}

- (UITableViewCell *) tableView:(UITableView *)tableView configureCell:(MYModelObjectTableViewCellBase*)cell withObject:(NSDictionary*)object atIndexPath:(NSIndexPath *)indexPath;
{
    if ([cell respondsToSelector:@selector(setParentTableViewController:)]) {
        cell.parentTableViewController = self;
    }
    
    return [self tableView:tableView configureCell:cell withModelObject:object atIndexPath:indexPath];
}

- (UITableViewCell *) tableView:(UITableView *)tableView configureCell:(UITableViewCell*)cell withModelObject:(MYModelObjectBase*)object atIndexPath:(NSIndexPath *)indexPath
{
    MYModelObjectTableViewCellBase *modelCell = (MYModelObjectTableViewCellBase*)cell;
    
    if ([modelCell isKindOfClass:[MYModelObjectTableViewCellBase class]]) {
        [modelCell configureWithModelObject:object];
    }
        
    return modelCell;
}

- (void) reloadWithDictionaries:(NSArray*)objectDictionaries
{
    [self reloadSection:0 withArray:objectDictionaries];
}

- (void) reloadSection:(NSUInteger)section withDictionaries:(NSArray*)objectDictionaries
{
    if (self.modelClassNames.count > section) {
        NSString *modelClassName = self.modelClassNames[section];
        Class<MYParseableModelObject> modelClass = NSClassFromString(modelClassName);
        NSArray *strongObjects = [[modelClass parser] parseArray:objectDictionaries];
        [self reloadSection:section withArray:strongObjects];
        
    }
}

#pragma mark - Selected Item -

- (id) selectedObject
{
    if ([self selectedObjects].count > 0) {
        return self.selectedObjects[0];
    } else {
        return nil;
    }
}

- (NSArray*) selectedObjects
{
    NSMutableArray *selectedObjects = [NSMutableArray new];
    [[self.tableView indexPathsForSelectedRows] enumerateObjectsUsingBlock:^(NSIndexPath *indexPath, NSUInteger idx, BOOL *stop) {
        id object = [self objectForIndexPath:indexPath];
        [selectedObjects addObject:object];
    }];
    
    
    return selectedObjects;
    
}

#pragma mark - Details View -

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pushToDetails"]) {
        
        MYModelObjectViewControllerBase *controller = segue.destinationViewController;
        
        controller.modelObject = self.selectedObject;
    }
}

@end
