//
//  MYModelObjectTableViewCellBase.h
//  Pods
//
//  Created by Vincil Bishop on 4/5/14.
//
//

#import <UIKit/UIKit.h>
#import "MYParseableModelObject.h"

@class MYModelObjectTableViewControllerBase;

@interface MYModelObjectTableViewCellBase : UITableViewCell

@property (nonatomic,strong) id<MYParseableModelObject> modelObject;
@property (nonatomic,strong) MYModelObjectTableViewControllerBase *parentTableViewController;

+ (MYModelObjectTableViewCellBase*) newTableViewCell;
- (void) configureWithModelObject:(id<MYParseableModelObject>)modelObject;
- (UITableView *) parentTableView;
- (NSIndexPath*) indexPath;

@end
