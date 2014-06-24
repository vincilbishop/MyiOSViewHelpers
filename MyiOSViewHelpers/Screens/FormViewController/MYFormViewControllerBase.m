//
//  MYFormViewControllerBase.m
//  Pods
//
//  Created by Vincil Bishop on 12/13/13.
//
//

#import "MYFormViewControllerBase.h"
#import "US2FormValidator.h"
#import "UIView+HierarchyAdditions.h"

@interface MYFormViewControllerBase ()

@end

@implementation MYFormViewControllerBase

@synthesize textFields=_textFields;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.keyboardControls = [[APLKeyboardControls alloc] initWithInputFields:self.textViewsAndFields];
    self.keyboardControls.hasPreviousNext = YES;
    self.statusBarNotification = [CWStatusBarNotification new];
    self.validators = [NSMutableArray new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Validation Methods -

- (void) addValidator:(ALPValidator*)validator forControl:(UIControl*)control
{
    __block MYFormViewControllerBase *blockSelf = self;
    self.statusBarNotification.notificationLabelTextColor = [UIColor whiteColor];
    
    validator.validatorStateChangedHandler = ^(ALPValidatorState newState) {
        switch (newState) {
                
            case ALPValidatorValidationStateValid:
                // do happy things
                [blockSelf.statusBarNotification dismissNotification];
                
                break;
                
            case ALPValidatorValidationStateInvalid:
                // do unhappy things
                blockSelf.statusBarNotification.notificationLabelBackgroundColor = [UIColor redColor];
                
                [blockSelf.statusBarNotification displayNotificationWithMessage:validator.errorMessages[0] completion:NULL];
                
                break;
                
            case ALPValidatorValidationStateWaitingForRemote:
                // do loading indicator things
                
                break;
                
        }
    };
    [control attachValidator:validator];
    [self.validators addObject:validator];
}

- (BOOL) formIsValid
{
    __block BOOL formIsValid = YES;
    
    [self.validators enumerateObjectsUsingBlock:^(ALPValidator *validator, NSUInteger idx, BOOL *stop) {
        
        if (!validator.isValid) {
            formIsValid = validator.isValid;
            *stop = YES;
        }
    }];
    
    return formIsValid;
}

- (void) showAlertIfFormInvalidWithSuccess:(MYCompletionBlock)successBlock
{
    if (self.formIsValid) {
        successBlock(self,YES,nil,[NSNumber numberWithBool:YES]);
    } else {
        [UIAlertView showWithTitle:@"Error" message:@"The form is not valid. Please check the input and try again." cancelButtonTitle:@"Ok" otherButtonTitles:nil tapBlock:NULL];
    }
}

#pragma mark - Overrides -

- (NSArray*) textViewsAndFields
{
    if (!_textViewsAndFields) {
        
        @synchronized (self) {
            
            _textViewsAndFields = [[NSMutableArray alloc] init];
            
            for (UIView *view in self.view.allSubviews) {
                
                if ([view isKindOfClass:[UITextField class]] || [view isKindOfClass:[UITextView class]]) {
                    
                    [_textViewsAndFields addObject:view];
                }
            }
        }
    }
    
    return _textViewsAndFields;

}

- (NSArray*) textFields
{
    if (!_textFields) {
        
        @synchronized (self) {
            
            _textFields = [[NSMutableArray alloc] init];
            
            for (UIView *view in self.view.allSubviews) {
                
                if ([view isKindOfClass:[UITextField class]]) {
                    
                    [_textFields addObject:view];
                }
            }
        }
    }
    
    return _textFields;
}

- (NSArray*) textViews
{
    if (!_textViews) {
        
        @synchronized (self) {
            
            _textViews = [[NSMutableArray alloc] init];
            
            for (UIView *view in self.view.allSubviews) {
                
                if ([view isKindOfClass:[UITextView class]]) {
                    
                    [_textViews addObject:view];
                }
            }
        }
    }
    
    return _textViews;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger textFieldIndex = [self.textViewsAndFields indexOfObject:textField];
    
    if (textFieldIndex < self.textViewsAndFields.count - 1) {
        [(UITextField *)self.textViewsAndFields[textFieldIndex + 1] becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.statusBarNotification dismissNotification];
}


@end
