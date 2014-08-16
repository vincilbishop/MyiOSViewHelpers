//
//  MYModelObjectTableViewControllerBase.h
//  Pods
//
//  Created by Vincil Bishop on 4/5/14.
//
//

#import "MYTableViewControllerBase.h"
#import "MYParseableModelObject.h"

@interface MYModelObjectTableViewControllerBase : MYTableViewControllerBase

@property (nonatomic) Class<MYParseableModelObject> modelClass;
@property (nonatomic,strong) NSMutableArray *modelClassNames;


- (void) reloadWithDictionaries:(NSArray*)objectDictionaries;
- (void) reloadSection:(NSUInteger)section withDictionaries:(NSArray*)objectDictionaries;

- (UITableViewCell *) tableView:(UITableView *)tableView configureCell:(UITableViewCell*)cell withModelObject:(id<MYParseableModelObject>)object atIndexPath:(NSIndexPath *)indexPath;

- (id) selectedObject;
- (NSArray*) selectedObjects;


@end
