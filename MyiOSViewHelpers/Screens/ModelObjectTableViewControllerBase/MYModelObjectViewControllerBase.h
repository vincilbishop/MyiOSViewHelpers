//
//  MYModelObjectViewController.h
//  Pods
//
//  Created by Vincil Bishop on 5/5/14.
//
//

#import <UIKit/UIKit.h>
#import "MYParseableModelObject.h"
#import "MYFormViewControllerBase.h"

@interface MYModelObjectViewControllerBase : MYFormViewControllerBase

@property (nonatomic,strong) id<MYParseableModelObject> modelObject;

- (void) configureWithModelObject:(id<MYParseableModelObject>)modelObject;
- (void) setModelObject:(id<MYParseableModelObject>)modelObject forDestination:(UIViewController*)destinationController;

@end
