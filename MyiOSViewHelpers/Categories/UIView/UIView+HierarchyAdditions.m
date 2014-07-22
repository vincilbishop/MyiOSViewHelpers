#import "UIView+HierarchyAdditions.h"

@implementation UIView(HierarchyAdditions)

-(NSArray *) allSubviewsForView: (UIView *) view
{
	NSMutableArray *subviews = [NSMutableArray array];
	[subviews addObject: view];
	for ( UIView *subview in view.subviews )
	{
		[subviews addObjectsFromArray: [self allSubviewsForView: subview]];
	}
	return [NSArray arrayWithArray: subviews];
}


-(NSArray *) allSubviews
{
	return [self allSubviewsForView: self];
}

- (UIViewController *) parentViewController {
    // convenience function for casting and to "mask" the recursive function
    return (UIViewController *)[self traverseResponderChainForUIViewController];
}

- (id) traverseResponderChainForUIViewController {
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForUIViewController];
    } else {
        return nil;
    }
}


@end
