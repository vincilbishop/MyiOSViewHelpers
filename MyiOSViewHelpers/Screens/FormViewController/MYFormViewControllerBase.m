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
    self.keyboardControls = [[APLKeyboardControls alloc] initWithInputFields:self.textFields];
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
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    blockSelf.statusBarNotification.notificationLabelBackgroundColor = [ASCFlatUIColor emeraldColor];
                    [blockSelf.statusBarNotification displayNotificationWithMessage:@"Valid" forDuration:3];
                } afterDelay:0.27];
                
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
        [UIAlertView showWithTitle:@"Error" message:@"Please correct the form to continue" cancelButtonTitle:@"Ok" otherButtonTitles:nil tapBlock:NULL];
    }
}

#pragma mark - Overrides -

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

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger textFieldIndex = [self.textFields indexOfObject:textField];
    
    if (textFieldIndex < self.textFields.count - 1) {
        [(UITextField *)self.textFields[textFieldIndex + 1] becomeFirstResponder];
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
