//
//  MYFormViewControllerBase.h
//  Pods
//
//  Created by Vincil Bishop on 12/13/13.
//
//

#import <UIKit/UIKit.h>
#import "US2ValidatorUIDelegate.h"
#import "ALPValidator.h"
#import "MyiOSLogicBlocks.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "APLKeyboardControls.h"
#import "CWStatusBarNotification.h"
#import "ASCFlatUIColor.h"

@interface MYFormViewControllerBase : UIViewController<US2ValidatorUIDelegate>
{
    NSMutableArray *_textFields;
}

@property (strong, nonatomic) NSMutableArray *textFields;
@property (strong, nonatomic) NSMutableArray *textViews;
@property (strong, nonatomic) NSMutableArray *textViewsAndFields;
@property (strong, nonatomic) NSMutableArray *validators;
@property (nonatomic) BOOL isValid;
@property (nonatomic,strong) NSMutableString *errorString;
@property (nonatomic,strong) NSMutableArray *errorMessages;
@property (nonatomic,strong) APLKeyboardControls *keyboardControls;
@property (nonatomic,strong) CWStatusBarNotification *statusBarNotification;

- (void) addValidator:(ALPValidator*)validator forControl:(UIControl*)control;

- (BOOL) formIsValid;

- (void) showAlertIfFormInvalidWithSuccess:(MYCompletionBlock)successBlock;

@end
