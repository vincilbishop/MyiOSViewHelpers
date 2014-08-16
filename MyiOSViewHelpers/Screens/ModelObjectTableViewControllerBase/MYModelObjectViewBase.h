//
//  MYModelObjectViewBase.h
//  Pods
//
//  Created by Vincil Bishop on 7/30/14.
//
//

#import <UIKit/UIKit.h>
#import "MYParseableModelObject.h"

@interface MYModelObjectViewBase : UIView

@property (nonatomic,strong) id<MYParseableModelObject> modelObject;
- (void) configureWithModelObject:(id<MYParseableModelObject>)modelObject;

@end
