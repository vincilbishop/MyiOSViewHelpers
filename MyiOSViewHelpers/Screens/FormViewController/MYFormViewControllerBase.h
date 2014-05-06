//
//  MYFormViewControllerBase.h
//  Pods
//
//  Created by Vincil Bishop on 12/13/13.
//
//

#import <UIKit/UIKit.h>
#import "US2ValidatorUIDelegate.h"
#import "MyiOSLogicBlocks.h"

@class RDVKeyboardAvoidingScrollView;

@interface MYFormViewControllerBase : UIViewController<US2ValidatorUIDelegate>
{
    NSMutableArray *_textFields;
}
@property (strong, nonatomic) NSMutableArray *textFields;


@property (nonatomic) BOOL isValid;

@property (nonatomic,strong)  NSMutableString *errorString;

- (void) validateForm;
- (void) showAlertIfInvalidWithCompletion:(MYCompletionBlock)completion;

@end
