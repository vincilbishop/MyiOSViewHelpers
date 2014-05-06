//
//  MYModelObjectTableViewControllerBase.h
//  Pods
//
//  Created by Vincil Bishop on 4/5/14.
//
//

#import "MYTableViewControllerBase.h"

@class MYModelObjectBase;
@protocol MYParseableModelObject;

@interface MYModelObjectTableViewControllerBase : MYTableViewControllerBase

@property (nonatomic) Class<MYParseableModelObject> modelClass;
@property (nonatomic,strong) NSMutableArray *modelClassNames;


- (void) reloadWithDictionaries:(NSArray*)objectDictionaries;
- (void) reloadSection:(NSUInteger)section withDictionaries:(NSArray*)objectDictionaries;

- (UITableViewCell *) tableView:(UITableView *)tableView configureCell:(UITableViewCell*)cell withModelObject:(MYModelObjectBase*)object atIndexPath:(NSIndexPath *)indexPath;

- (id) selectedObject;
- (NSArray*) selectedObjects;


@end
