//
//  MYModelObjectViewController.h
//  Pods
//
//  Created by Vincil Bishop on 5/5/14.
//
//

#import <UIKit/UIKit.h>
#import "MYFormViewControllerBase.h"

@class MYModelObjectBase;

@interface MYModelObjectViewControllerBase : MYFormViewControllerBase

@property (nonatomic,strong) MYModelObjectBase *modelObject;

- (void) configureWithModelObject:(MYModelObjectBase*)modelObject;
- (void) setModelObject:(MYModelObjectBase *)modelObject forDestination:(UIViewController*)destinationController;

@end
