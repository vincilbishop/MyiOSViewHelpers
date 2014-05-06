//
//  MYFormViewControllerBase.m
//  Pods
//
//  Created by Vincil Bishop on 12/13/13.
//
//

#import "MYFormViewControllerBase.h"
#import "RDVKeyboardAvoidingScrollView.h"
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Validation Methods -

- (void) validateForm
{
    // Create string which will contain the first error in form
    self.errorString = [NSMutableString string];
    self.isValid = YES;
    
    for (US2ValidatorTextField *textUI in self.textFields) {
        
        // If the text UI has invalid text remember the violated condition with highest priority
        if ([textUI conformsToProtocol:@protocol(US2ValidatorUIProtocol)] && textUI.isValid == NO)
        {
            self.isValid = NO;
            
            US2Validator *validator = [textUI validator];
            US2ConditionCollection *conditionCollection = [validator checkConditions:[textUI text]];
            US2Condition *violatedCondition = [conditionCollection conditionAtIndex:0];
            
            NSMutableString *violatedString = [NSMutableString string];
            
            if (textUI.placeholder) {
                [violatedString appendString:textUI.placeholder];
                [violatedString appendString:@": "];

            }
            
            [violatedString appendString:[violatedCondition localizedViolationString]];
            [self.errorString appendString:violatedString];
            break;
        }
    }

}

- (void) showAlertIfInvalidWithCompletion:(MYCompletionBlock)completion
{
    [self validateForm];
    // Show alert if there was an invalid text in UI
    if (self.errorString.length > 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid Form"
                                                            message:self.errorString
                                                           delegate:self
                                                  cancelButtonTitle:@"Continue"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    if (completion) {
        completion(self,YES,nil,self);
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

#pragma mark - US2ValidatorUIDelegate -

/**
 Will be called when the text in the text field changes. Has its origin in listening for UITextFieldTextDidChangeNotification.
 
 @param validatorUI Instance of the sending validator text UI of type US2ValidatorTextField
 */
- (void)validatorUIDidChange:(id <US2ValidatorUIProtocol>)validatorUI
{}

/**
 Will be called when a status changes from true to false or false to true.
 
 @param validatorTextView Instance of the sending validator text field of type US2ValidatorTextView
 @param isValid Returns the status of the validation check
 */
- (void)validatorUI:(id <US2ValidatorUIProtocol>)validatorUI changedValidState:(BOOL)isValid
{}

/**
 Will be called if the text field check failed.
 
 @param validatorTextView Instance of the sending validator text field of type US2ValidatorTextView
 @param conditions Collection of type US2ConditionCollection listing all violated conditions.
 */
- (void)validatorUI:(id <US2ValidatorUIProtocol>)validatorUI violatedConditions:(US2ConditionCollection *)conditions
{}

@end
