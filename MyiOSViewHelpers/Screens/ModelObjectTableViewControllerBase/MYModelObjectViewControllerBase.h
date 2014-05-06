//
//  MYModelObjectViewController.h
//  Pods
//
//  Created by Vincil Bishop on 5/5/14.
//
//

#import <UIKit/UIKit.h>

@class MYModelObjectBase;

@interface MYModelObjectViewControllerBase : UIViewController

@property (nonatomic,strong) MYModelObjectBase *modelObject;

- (void) configureWithModelObject:(MYModelObjectBase*)modelObject;

@end
