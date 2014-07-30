//
//  MYModelObjectViewBase.h
//  Pods
//
//  Created by Vincil Bishop on 7/30/14.
//
//

#import <UIKit/UIKit.h>

@class MYModelObjectBase;

@interface MYModelObjectViewBase : UIView

@property (nonatomic,strong) MYModelObjectBase *modelObject;
- (void) configureWithModelObject:(MYModelObjectBase*)modelObject;

@end
