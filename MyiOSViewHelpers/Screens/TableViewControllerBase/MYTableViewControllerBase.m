//
//  MYTableViewControllerBase.m
//  Pods
//
//  Created by Vincil Bishop on 3/31/14.
//
//

#import "MYTableViewControllerBase.h"

@interface MYTableViewControllerBase ()

@end

@implementation MYTableViewControllerBase

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.objects = [NSMutableArray new];
        self.sortDescriptors = [NSMutableArray new];
        self.predicates = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    
    // A little trick for removing the cell separators
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Base Helpers -

- (void) reloadWithArray:(NSArray*)objects
{
    [self reloadSection:0 withArray:objects];
}

- (void) reloadSection:(NSUInteger)section withArray:(NSArray*)objects
{
    if (self.objects && objects) {
        
        NSArray *sortedAndFilteredObjects = objects;
        
        if (self.predicates) {
            NSCompoundPredicate *compoundPredicate = [[NSCompoundPredicate alloc] initWithType:NSAndPredicateType subpredicates:self.predicates];
            
            sortedAndFilteredObjects = [sortedAndFilteredObjects filteredArrayUsingPredicate:compoundPredicate];
        }
        
        if (self.sortDescriptors.count > 0) {
            sortedAndFilteredObjects = [sortedAndFilteredObjects sortedArrayUsingDescriptors:self.sortDescriptors];
        }
        
        if (self.objects.count > 0 && self.objects.count > section) {
            [self.objects replaceObjectAtIndex:section withObject:sortedAndFilteredObjects];
        } else {
            [self.objects addObject:sortedAndFilteredObjects];
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }
}

- (id) objectForIndexPath:(NSIndexPath*)indexPath
{
    NSArray *sectionArray = [self arrayForSection:indexPath.section];
    
    if (sectionArray && sectionArray.count > indexPath.row) {
    
        return sectionArray[indexPath.row];
    
    } else {
    
        return nil;
    }
}

- (NSArray*) arrayForSection:(NSUInteger)section
{
    if (self.objects.count > section) {
        NSArray *sectionArray = self.objects[section];
        
        return sectionArray;
    } else {
        return nil;
    }
    
}

#pragma mark - DZNEmptyDataSetSource -

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    
    NSString *text = @"Empty";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    
    NSString *text = @"There is no data to display.";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.objects.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self arrayForSection:section] && self.objects.count >= 1) {
    
        return  [self arrayForSection:section].count;
    
    } else {
        
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self objectForIndexPath:indexPath];
    
    NSString *cellIdentifier = [self cellIdentifierForRowAtIndexPath:indexPath];
    
    UITableViewCell *cell = nil;
    
    if (cellIdentifier) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    }
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    
    cell = [self tableView:tableView configureCell:cell withObject:object atIndexPath:indexPath];

    return cell;
}

- (NSString*) cellIdentifierForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self objectForIndexPath:indexPath];
    NSString *cellIdentifier = nil;
    
    if (object) {
        cellIdentifier = NSStringFromClass([object class]);
    }
    
    return cellIdentifier;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [self cellIdentifierForRowAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    return cell.frame.size.height;
}

- (UITableViewCell *) tableView:(UITableView *)tableView configureCell:(UITableViewCell*)cell withObject:(id)object atIndexPath:(NSIndexPath *)indexPath
{
    NSAssert([self respondsToSelector:_cmd],@"Must Override!");
    
    return nil;
}

@end
