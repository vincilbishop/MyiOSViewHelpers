//
//  MYTableViewControllerBase.h
//  Pods
//
//  Created by Vincil Bishop on 3/31/14.
//
//

#import <UIKit/UIKit.h>

@interface MYTableViewControllerBase : UITableViewController

@property (nonatomic,strong) NSMutableArray *objects;
@property (nonatomic,strong) NSString *reuseIdentifier;

- (void) reloadWithArray:(NSArray*)objects;
- (void) reloadSection:(NSUInteger)section withArray:(NSArray*)objects;
- (id) objectForIndexPath:(NSIndexPath*)indexPath;
- (NSArray*) arrayForSection:(NSUInteger)section;

- (NSString*) cellIdentifierForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *) tableView:(UITableView *)tableView configureCellAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *) tableView:(UITableView *)tableView configureCell:(UITableViewCell*)cell withObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

- (id) selectedObject;
- (NSArray*) selectedObjects;


@end
