//
//  MYModelObjectTableViewCellBase.h
//  Pods
//
//  Created by Vincil Bishop on 4/5/14.
//
//

#import <UIKit/UIKit.h>

@class MYModelObjectBase;
@class MYModelObjectTableViewControllerBase;

@interface MYModelObjectTableViewCellBase : UITableViewCell

@property (nonatomic,strong) MYModelObjectBase *modelObject;
@property (nonatomic,strong) MYModelObjectTableViewControllerBase *parentTableViewController;

+ (MYModelObjectTableViewCellBase*) newTableViewCell;
- (void) configureWithModelObject:(MYModelObjectBase*)modelObject;
- (UITableView *) parentTableView;
- (NSIndexPath*) indexPath;

@end
